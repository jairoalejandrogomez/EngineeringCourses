%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que a partir de una imagen de entrada en escala de grises genere la
% imagen correspondiente con el histograma ecualizado.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0320(4)(bottom_left).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

figure
imshow(escalar_imagen(I,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.
%--------------------------------------------------------------------------

I3=ecualizar_histograma(I2,255);
figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de salida luego de ecualizar el histograma de la imagen de entrada')

%--------------------------------------------------------------------------
