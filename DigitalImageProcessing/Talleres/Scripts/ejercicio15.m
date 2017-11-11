%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Aplique el Laplaciano a una imagen de entrada y despliegue la imagen de salida. Qué observa?.
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

h=[0  1 0; 
   1 -4 1;
   0  1 0];   %laplaciano sencillo

I4=correlacion(I2,h,0);
I4=escalar_imagen(I4,255,0); 

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar el Laplaciano y escalar')
%--------------------------------------------------------------------------

h=[1  1 1; 
   1 -8 1;
   1  1 1];   %laplaciano con diagonales

I5=correlacion(I2,h,0);
I5=escalar_imagen(I5,255,0); 

figure
imshow(I5,'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar el Laplaciano que considera diagonales y escalar')

%--------------------------------------------------------------------------


