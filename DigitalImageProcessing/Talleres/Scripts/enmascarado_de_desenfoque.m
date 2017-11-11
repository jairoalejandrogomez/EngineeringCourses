%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que a partir de un parámetro k, aplique el enmascarado de
% desenfoque (k=1), o el realce de alta frecuencia (highboost, k>1) a una imagen arbitraria de entrada.
%--------------------------------------------------------------------------
%I:                   Imagen de entrada
%h:                   Máscara de filtro paso bajo de su preferencia (cuadrado e impar). 
%k:                   Magnitud de la constante pondera la máscara interna de la función.         

%I3:                  Imagen de salida. 
%--------------------------------------------------------------------------
function I3=enmascarado_de_desenfoque(I,h,k)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];                      %inicializo la matriz de salida. 

%--------------------------------------------------------------------------
I1_paso_bajo=correlacion(I1,h,0); %use correlación.

g=I1-I1_paso_bajo;                %máscara interna

I3=I1+k*g;                        %filtrado como tal
                                  %k=1: Enmascarado de desenfoque.
                                  %k>1: Filtrado de realce (highboost).
                                  %k<1: Reduce la contribución de la máscara.
                                  
%--------------------------------------------------------------------------

