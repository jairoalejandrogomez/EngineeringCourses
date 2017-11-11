%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implemente una función en Matlab que pueda calcular tanto la correlación como la convolución entre
% una imagen y una máscara de tamaño arbitrario MxN (donde M y N son enteros impares). La función
% debe retornar bien sea la imagen de salida completa o recortada según lo requiera el usuario.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0333(a)(test_pattern_blurring_orig).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.

figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada')

%--------------------------------------------------------------------------
%filtrado usando la correlación
%--------------------------------------------------------------------------

tam=11;
h=(1/tam^2)*ones(tam,tam);   %Máscara

I3=correlacion(I2,h,0);
I3=escalar_imagen(I3,255,0); 

figure
imshow(I3,'InitialMagnification', 'fit')
title('Imagen de salida luego de aplicar un filtro promedio usando la correlación y escalar')

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


