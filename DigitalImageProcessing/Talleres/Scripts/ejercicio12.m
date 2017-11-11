%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que a partir de una imagen de entrada y un histograma normalizado
% deseado de salida, aplique el algoritmo de especificación del histograma y genere la imagen de salida
% correspondiente.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------

nombre_imagen_con_extension='Fig0320(4)(bottom_left).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);   %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')
%--------------------------------------------------------------------------
%Especificacion del histograma
%--------------------------------------------------------------------------

h_norm_deseado=zeros(256,1);                            %Vector columna
%h_norm_deseado(1:120,1)=1;
h_norm_deseado(120:255,1)=1;
h_norm_deseado=h_norm_deseado/sum(h_norm_deseado);      %Garantizo que esté normalizado.

figure
plot(h_norm_deseado);
title('Histograma normalizado deseado de salida')

Lmax=255;

I3=especificacion_del_histograma(I2,Lmax,h_norm_deseado);

figure
imshow(I3,[],'InitialMagnification', 'fit')
title('Imagen de salida')

%--------------------------------------------------------------------------




