%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que a partir de una imagen de entrada en escala de grises y un
% parámetro d permita obtener una imagen de salida luego calcular bien sea el operador Sobel en la
% dirección x (d = ' x'), o en la dirección y (d= ' y').
%--------------------------------------------------------------------------
%I:                   Imagen de entrada
%d:                    d='x'  Sobel en x.  
                      %d='y'  Sobel en y.

%I3:                  Imagen de salida. 
%--------------------------------------------------------------------------
function I3=operador_sobel(I,d)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];                      %inicializo la matriz de salida. 
%--------------------------------------------------------------------------
%Seleccione operador Sobel.
%--------------------------------------------------------------------------
if d=='x'
    g=[-1 -2 -1;    %operador sobel en X
        0  0  0;
        1  2  1];
elseif d=='y'      
    g=[-1 0 1;      %operador sobel en Y
       -2 0 2;
       -1 0 1];
else
    disp('Dirección equivocada para el operador')    
end

%--------------------------------------------------------------------------
%Aplique el operador. 
%--------------------------------------------------------------------------
I3=correlacion(I1,g,0); %use correlación.
                                  
%--------------------------------------------------------------------------

