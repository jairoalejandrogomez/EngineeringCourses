%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que permita extraer los planos correspondientes a cada bit en una
% imagen de tamaño arbitrario representada en una escala de grises con n bits.
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
I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

bit=6;                              %Recuerde que el menos significativo es el 0
I3=planos_de_bits(I2,bit)

figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de salida correspondiente a un plano de bits.')
%--------------------------------------------------------------------------
