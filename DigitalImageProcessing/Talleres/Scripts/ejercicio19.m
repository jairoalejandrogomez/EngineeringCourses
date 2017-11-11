%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implemente una función en Matlab que a partir de una imagen de entrada en escala de grises, y un
% parámetro de entrada e, aplique la magnitud del gradiente usando la fórmula exacta (e=1), o la
% aproximación (e=0). Son visibles los efectos de la aproximación al aplicar la función a varias imágenes de
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

I4=magnitud_del_gradiente(I2,0);   %Aproximación.
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida usando la magnitud del gradiente (fórmula aproximada) y escalando')
%--------------------------------------------------------------------------

I5=magnitud_del_gradiente(I2,1);   %Usando la fórmula exacta.
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida usando la magnitud del gradiente (fórmula exacta) y escalando')

%--------------------------------------------------------------------------


