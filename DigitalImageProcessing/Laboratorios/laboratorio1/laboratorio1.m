%--------------------------------------------------------------------------
%Laboratorio #1 de la asignatura "procesamiento digital de imágenes".
%
%Objetivos:  
%   - Recuperar las características de una imagen almacenada en el disco duro.
%   - Leer una imagen del disco duro.
%   - Mostrar una matriz como una imagen en Matlab
%   - Aplicar una transformación de intensidad a una imagen.
%   - Almacenar la imagen procesada en el disco duro.
%
%Observación: Este archivo requiere la imagen "lena512.bmp"
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
disp('A continuación se presenta la información de la imagen lena512.bmp:')
imfinfo('lena512.bmp')     %Recupera la información básica de la imagen.
I=imread('lena512.bmp');   %Lee la imagen contenida en el archivo lena512.bmp
h1=figure;                 %Crea una figura en blanco, y le asigna el manejador h1.
imshow(I,[0 255])          %Muestra la imagen indicando que
                           %todos los valores iguales o menores a cero
                           %corresponden al negro, y todos los valores
                           %mayores o iguales a 255 corresponden a blanco.
title('Imagen de entrada')

I2 =double(I);             %Casting a formato de doble precisión.
I3 =0.5*I2;                %Transformación de intensidad.
I4 =uint8(I3);             %Casting a entero sin signo de 8 bits.
h2=figure;                 %Crea una figura en blanco, y le asigna el manejador h2.
imshow(I4,[0,255])         %Muestra el resultado de la transformación.
title('Imagen de salida')

imwrite(I4,'lena512_procesada.bmp','bmp');   %Guarda la imagen en formato bmp.
%--------------------------------------------------------------------------