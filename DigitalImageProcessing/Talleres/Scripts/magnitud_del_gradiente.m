%--------------------------------------------------------------------------
% Implemente una funci�n en Matlab que a partir de una imagen de entrada en escala de grises, y un
% par�metro de entrada e, aplique la magnitud del gradiente usando la f�rmula exacta (e=1), o la
% aproximaci�n (e=0). Son visibles los efectos de la aproximaci�n al aplicar la funci�n a varias im�genes de
% prueba?.
%--------------------------------------------------------------------------
%I:                   Imagen de entrada.
%e:                   e=1: Usando la f�rmula exacta.
%                     e=0: Usando la aproximaci�n.
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
  disp('Opcion incorrecta. F�rmula exacta e=1. Para aproximaci�n e=0')  
end
%--------------------------------------------------------------------------

