%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que permita aplicar un operador arbitrario sobre una máscara de tamaño
% n x n a una imagen de entrada en escala de grises. Siendo n un entero impar. Nota: Puede especificar el
% operador en una función auxiliar. Como ejemplos de operadores puede considerar el promedio, la
% desviación estándar, la mediana, el mínimo y el máximo.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0335(a)(ckt_board_saltpep_prob_pt05).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

figure
imshow(escalar_imagen(I,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.
%--------------------------------------------------------------------------

I3=filtrado_no_lineal(I2,3,'median');
figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar un filtro mediana a la imagen de entrada')

%--------------------------------------------------------------------------

I4=filtrado_no_lineal(I2,3,'mean');
figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar un filtro promedio a la imagen de entrada')

%--------------------------------------------------------------------------

