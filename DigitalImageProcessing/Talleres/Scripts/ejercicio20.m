%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que le aplique la transformada discreta de Fourier en 2D a una
% imagen de entrada en escala de grises. Nota: se puede referir a las ecuaciones que se presentaron en las
% diapositivas de la clase 3 para tal fin.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%imagen pequeña
I2=zeros(4,4);
I2(1:4,2)=1;

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')
%--------------------------------------------------------------------------

I2

T=DFT_2D(I2)

%--------------------------------------------------------------------------

