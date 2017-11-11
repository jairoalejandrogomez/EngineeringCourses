%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que a partir de una imagen de entrada en escala de grises y un
% parámetro d permita obtener una imagen de salida luego calcular bien sea el operador Sobel en la
% dirección x (d = ' x'), o en la dirección y (d= ' y').
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0335(a)(ckt_board_saltpep_prob_pt05).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------
I4=operador_sobel(I2,'x');
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida usando el operador Sobel en X y escalando')
%--------------------------------------------------------------------------
I5=operador_sobel(I2,'y');
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida usando el operador Sobel en Y y escalando')

%--------------------------------------------------------------------------


