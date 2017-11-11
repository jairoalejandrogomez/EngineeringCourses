%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Diseñe una función en Matlab que tome como argumentos una imagen en escala de grises de tamaño
% arbitrario y una matriz entera de la forma M=[x y], donde x e y son vectores columna. Cada fila de la
% matriz M corresponde a los valores de intensidad de entrada y salida que especifican los puntos de
% interés de una transformación de intensidad definida por segmentos lineales. Nota: El primer valor del
% vector x debe ser 0 y el último valor del vector x debe ser L-1.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%Transformación por segmentos lineales.
%--------------------------------------------------------------------------

M1=[0   0;      %Matriz para no hacer cambios.
    255 255];

M2=[0   255;    %Matriz para invertir intensidad.
    255 0];

M3=[0    0;     %Matriz para generar una imagen binaria.
    128  0;
    128  255;
    255  255];

M4=[0    255;     %Matriz para generar otra imagen binaria.
    128  255;
    128  0;
    255  0];
%--------------------------------------------------------------------------
nombre_imagen_con_extension='Fig0316(3)(third_from_top).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file
imfinfo(nombre_imagen_con_extension)

figure
imshow(escalar_imagen(I,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

I2=escalar_imagen(I,255,0);         %Esto es para garantizar que el dominio de entrada es 0-255.
%--------------------------------------------------------------------------

disp('M1')
I3=trans_usando_seg_lineales(I2,M1);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de salida usando M1')


disp('M2')
I4=trans_usando_seg_lineales(I2,M2);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida usando M2')

disp('M3')
I5=trans_usando_seg_lineales(I2,M3);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I5,255,0),'InitialMagnification', 'fit')
title('Imagen de salida usando M3')

disp('M4')
I6=trans_usando_seg_lineales(I2,M4);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I6,255,0),'InitialMagnification', 'fit')
title('Imagen de salida usando M4')

%--------------------------------------------------------------------------