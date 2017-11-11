%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función que permita usar el enmascarado de desenfoque para mejorar los detalles finos de una imagen de
% entrada en escala de grises.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0340(a)(dipxe_text).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------

h4=(1/25)*ones(5,5);       %Filtro paso bajo.
k4=1;                      %Enmascarado de desenfoque
I4=enmascarado_de_desenfoque(I2,h4,k4);
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida usando el enmascarado de desenfoque y escalando')
%--------------------------------------------------------------------------

h5=(1/25)*ones(5,5);        %Filtro paso bajo.
k5=4.5;                     %Highboost
I5=enmascarado_de_desenfoque(I2,h5,k5);
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida usando el filtrado highboost y escalando')

%--------------------------------------------------------------------------


