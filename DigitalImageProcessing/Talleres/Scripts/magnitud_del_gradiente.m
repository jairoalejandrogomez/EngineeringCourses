%--------------------------------------------------------------------------
% Implemente una función en Matlab que a partir de una imagen de entrada en escala de grises, y un
% parámetro de entrada e, aplique la magnitud del gradiente usando la fórmula exacta (e=1), o la
% aproximación (e=0). Son visibles los efectos de la aproximación al aplicar la función a varias imágenes de
% prueba?.
%--------------------------------------------------------------------------
%I:                   Imagen de entrada.
%e:                   e=1: Usando la fórmula exacta.
%                     e=0: Usando la aproximación.
%I3:                  Imagen de salida. 
%--------------------------------------------------------------------------
function I3=magnitud_del_gradiente(I,e)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];                      %inicializo la matriz de salida. 
%--------------------------------------------------------------------------
%Resultado de aplicar los operadores Sobel de manera independiente.
%--------------------------------------------------------------------------
GX=operador_sobel(I1,'x');
GY=operador_sobel(I1,'y');
%--------------------------------------------------------------------------
%Aplique el operador. 
%--------------------------------------------------------------------------

if e==0
I3=abs(GX)+abs(GY);
elseif e==1
I3=sqrt((GX.^2)+(GY.^2))
else
  disp('Opcion incorrecta. Fórmula exacta e=1. Para aproximación e=0')  
end
%--------------------------------------------------------------------------

