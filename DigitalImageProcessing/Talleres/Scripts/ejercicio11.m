%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que permita aplicar el procesamiento del histograma local de una imagen
% de entrada. Usted debe definir los parámetros mínimos que se requieren.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0326(a)(embedded_square_noisy_512).tif';  %Image to load.
%nombre_imagen_con_extension='Fig0335(a)(ckt_board_saltpep_prob_pt05).tif';    %Image to load.

I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------
%Procesamiento global
%--------------------------------------------------------------------------

I3=ecualizar_histograma(I2,255);

figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar la ecualización global del histograma')

%--------------------------------------------------------------------------
%Procesamiento local con ecualización del histograma.
%--------------------------------------------------------------------------
I4=filtrado_no_lineal(I2,3,'ecualizar_histograma',255);

% figure
% imshow(I4,'InitialMagnification', 'fit')
% title('Imagen de salida luego de aplicar el procesamiento del histograma local usando una ventana de 3x3 con ecualización del histograma')

figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar el procesamiento local usando una ventana de 3x3 con ecualización del histograma')
%--------------------------------------------------------------------------
%Procesamiento local con mediana.
%--------------------------------------------------------------------------
I5=filtrado_no_lineal(I2,3,'median');

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar el procesamiento local usando una ventana de 3x3 con el filtro mediana')
% 
% figure
% imshow(escalar_imagen(I5,255,0),'InitialMagnification', 'fit')
% title('Imagen de salida luego de aplicar el procesamiento del histograma local usando una ventana de 3x3 con el filtro mediana')
%--------------------------------------------------------------------------





