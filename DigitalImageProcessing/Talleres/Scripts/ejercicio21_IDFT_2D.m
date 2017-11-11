%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que le aplique la transformada inversa discreta de Fourier en 2D a una
% matriz de entrada. 
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%imagen pequeña
I2=[1 2 3 4;
    0 5 1 8;
    6 4 7 9]

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')
%--------------------------------------------------------------------------

I2

T_en_frecuencia=DFT_2D(I2)
I_en_el_espacio_con_datos_parasitos=IDFT_2D(T_en_frecuencia)
T_en_el_espacio_real=real(I_en_el_espacio_con_datos_parasitos)
%--------------------------------------------------------------------------

