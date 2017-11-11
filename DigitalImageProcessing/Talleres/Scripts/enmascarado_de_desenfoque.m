%--------------------------------------------------------------------------
% Desarrolle una funci�n en Matlab que a partir de un par�metro k, aplique el enmascarado de
% desenfoque (k=1), o el realce de alta frecuencia (highboost, k>1) a una imagen arbitraria de entrada.
%--------------------------------------------------------------------------
%I:                   Imagen de entrada
%h:                   M�scara de filtro paso bajo de su preferencia (cuadrado e impar). 
%k:                   Magnitud de la constante pondera la m�scara interna de la funci�n.         

%I3:                  Imagen de salida. 
%--------------------------------------------------------------------------
function I3=enmascarado_de_desenfoque(I,h,k)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];                      %inicializo la matriz de salida. 

%--------------------------------------------------------------------------
I1_paso_bajo=correlacion(I1,h,0); %use correlaci�n.

g=I1-I1_paso_bajo;                %m�scara interna

I3=I1+k*g;                        %filtrado como tal
                                  %k=1: Enmascarado de desenfoque.
                                  %k>1: Filtrado de realce (highboost).
                                  %k<1: Reduce la contribuci�n de la m�scara.
                                  
%--------------------------------------------------------------------------

