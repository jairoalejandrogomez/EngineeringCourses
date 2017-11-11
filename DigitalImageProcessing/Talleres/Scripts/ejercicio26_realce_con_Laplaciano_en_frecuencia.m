%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Mayo 2012.
%--------------------------------------------------------------------------
% Resalte la imagen con el filtro Laplaciano en frecuencia.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0338(a)(blurry_moon).tif';  %Image to load.
I0=imread(nombre_imagen_con_extension);               %Read image from file
imfinfo(nombre_imagen_con_extension);
I=escalar_imagen(I0,255,0);                           %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I,'InitialMagnification', 'fit')
title('Imagen de entrada')
%--------------------------------------------------------------------------
%Creación de filtro Laplaciano en frecuencia.
%--------------------------------------------------------------------------
show_plots=0;
I2=realce_con_laplaciano_en_frecuencia(I,show_plots);

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de salida')
%--------------------------------------------------------------------------
