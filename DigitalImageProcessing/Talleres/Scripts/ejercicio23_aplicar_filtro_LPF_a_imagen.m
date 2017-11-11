%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Mayo 2012.
%--------------------------------------------------------------------------
% Aplique un filtro paso bajo en frecuencia, bien sea un filtro ideal, 
% Butterworth, o Gaussiano a una imagen en escala de grises.
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

%Frecuencia de corte
D0=40

%--------------------------------------------------------------------------
P1=100
Q1=100

tipo1='ILPF'  %Filtro paso bajo ideal.

show_plots=0; %0: No muestre imágenes intermedias.

Isalida1=filtrar_con_LPF_frec(I,show_plots,P1,Q1,D0,tipo1);

figure
imshow(Isalida1,'InitialMagnification', 'fit')
title('Filtrado con LPF ideal')

%--------------------------------------------------------------------------
P2=100
Q2=100
n2=2
tipo2='BLPF'  %Filtro paso bajo Butterworth.

show_plots=0; %0: No muestre imágenes intermedias.

Isalida2=filtrar_con_LPF_frec(I,show_plots,P2,Q2,D0,tipo2,n2)

figure
imshow(Isalida2,'InitialMagnification', 'fit')
title('Filtrado con LPF Butterworth')
%--------------------------------------------------------------------------
P3=100
Q3=100

tipo3='GLPF'  %Filtro paso bajo Gaussiano.

show_plots=0; %0: No muestre imágenes intermedias.

Isalida3=filtrar_con_LPF_frec(I,show_plots,P3,Q3,D0,tipo3);

figure
imshow(Isalida3,'InitialMagnification', 'fit')
title('Filtrado con LPF Gaussiano')
%--------------------------------------------------------------------------

