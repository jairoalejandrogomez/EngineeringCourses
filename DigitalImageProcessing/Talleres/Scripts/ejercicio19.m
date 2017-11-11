%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro G�mez.
%Instituci�n: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implemente una funci�n en Matlab que a partir de una imagen de entrada en escala de grises, y un
% par�metro de entrada e, aplique la magnitud del gradiente usando la f�rmula exacta (e=1), o la
% aproximaci�n (e=0). Son visibles los efectos de la aproximaci�n al aplicar la funci�n a varias im�genes de
% prueba?.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0342(a)(contact_lens_original).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------

I4=magnitud_del_gradiente(I2,0);   %Aproximaci�n.
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida usando la magnitud del gradiente (f�rmula aproximada) y escalando')
%--------------------------------------------------------------------------

I5=magnitud_del_gradiente(I2,1);   %Usando la f�rmula exacta.
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida usando la magnitud del gradiente (f�rmula exacta) y escalando')

%--------------------------------------------------------------------------


