%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función que despliegue en pantalla, usando ventanas diferentes, todos los planos de bits
% de una imagen de entrada. Nota: use la función que diseñó en el punto 6.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0314(a)(100-dollars).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)
figure
imshow(escalar_imagen(I,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------
despliegue_planos_de_bits(I);
%--------------------------------------------------------------------------
