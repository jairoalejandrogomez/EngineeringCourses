%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Ejercicio3. Utilizando la función desarrollada en el punto 2 y una imagen de entrada en escala de grises, obtenga:
% 3.1. El negativo de la imagen.
% 3.2. Una imagen donde se expandan las regiones oscuras de la imagen.
% 3.3. Una imagen donde se expandan las regiones claras de la imagen.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%Negativo de la imagen
%--------------------------------------------------------------------------

nombre_imagen_con_extension='Fig0304(a)(breast_digital_Xray).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

figure
imshow(escalar_imagen(I,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

I2=escalar_imagen(I,255,0);   %Esto es para garantizar que el dominio de entrada es 0-255.
m=-1;
b=255;
I2=trans_intensidad(I,'lineal',m,b);

figure
imshow(escalar_imagen(I2,255,0),'InitialMagnification', 'fit')
title('Imagen de salida con una transformación lineal (Negativo)')
%--------------------------------------------------------------------------
%Proceso para expandir las regiones oscuras de una imagen.
%--------------------------------------------------------------------------

nombre_imagen_con_extension2='Fig0305(a)(DFT_no_log).tif';  %Image to load.
I3=imread(nombre_imagen_con_extension2);     %Read image from file
imfinfo(nombre_imagen_con_extension2)

figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

opcion='log'

if opcion=='log'
    c=1;
    I4=trans_intensidad(I3,'log',c);
else  %potencia...
    c=1;
    gamma=0.6;   %cualquier valor entre 0 y 1.
    I4=trans_intensidad(I3,'potencia',c,gamma);
end

figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida con una transformación logarítmica')
%--------------------------------------------------------------------------
%Proceso para expandir las regiones claras de la imagen.
%--------------------------------------------------------------------------

nombre_imagen_con_extension3='Fig0309(a)(washed_out_aerial_image).tif';  %Image to load.
I5=imread(nombre_imagen_con_extension3);     %Read image from file
imfinfo(nombre_imagen_con_extension3)

figure
imshow(escalar_imagen(I5,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

c=1;
gamma=4;  %Debe ser mayor que uno para expandir las regiones claras.
I6=trans_intensidad(I5,'potencia',c,gamma);

figure
imshow(escalar_imagen(I6,255,0),'InitialMagnification', 'fit')
title('Imagen de salida con una transformación de ley de potencia')
%--------------------------------------------------------------------------








