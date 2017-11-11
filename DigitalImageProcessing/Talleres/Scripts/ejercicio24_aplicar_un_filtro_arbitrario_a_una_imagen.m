%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Mayo 2012.
%--------------------------------------------------------------------------
% Aplique un filtro arbitrario a una imagen en escala de grises.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0338(a)(blurry_moon).tif';  %Image to load.
I0=imread(nombre_imagen_con_extension);               %Read image from file
imfinfo(nombre_imagen_con_extension)
I=escalar_imagen(I0,255,0);                           %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I,'InitialMagnification', 'fit')
title('Imagen de entrada')
%--------------------------------------------------------------------------
%Creación de filtro arbitrario en frecuencia.
%--------------------------------------------------------------------------
%Frecuencia de corte
P=100
Q=100
D0=40
tipo='ILPF'  %Filtro paso bajo ideal.

H=crear_filtro_LPF_en_frecuencia(P,Q,D0,tipo);

%--------------------------------------------------------------------------
%Filtrado.
%--------------------------------------------------------------------------
show_plots=1; %0: No muestre imágenes intermedias.

Isalida1=filtrado_en_frec_arbitrario(I0,H,show_plots);

figure
imshow(Isalida1,'InitialMagnification', 'fit')
title('Salida filtrada')

%--------------------------------------------------------------------------

