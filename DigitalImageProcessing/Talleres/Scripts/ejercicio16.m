%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Desarrolle una función que permita usar el Laplaciano para mejorar los detalles finos de una imagen de
% entrada en escala de grises.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0338(a)(blurry_moon).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------
%filtrado usando la correlación
%--------------------------------------------------------------------------

mag_c=1;
I4=realce_con_laplaciano(I2,0,mag_c);   %Laplaciano sencillo.
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida luego de sumar a la imagen de entrada el Laplaciano y escalar')
%--------------------------------------------------------------------------

mag_c2=1;
I5=realce_con_laplaciano(I2,1,mag_c2);  %Laplaciano que considera diagonales. 
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida luego de sumar a la imagen de entrada el Laplaciano (que considera diagonales) y escalar')

%--------------------------------------------------------------------------


