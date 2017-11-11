%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% 5. Aplique la función que diseñó en el punto 4 a una imagen en escala de grises y obtenga:
% 5.1. Una imagen binaria (seleccione y aplique un umbral).
% 5.2. El negativo de la imagen.
% 5.3. Una imagen donde se resalte un intervalo de intensidad de la imagen (ver cortes en el nivel de
% intensidad).
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%Transformación por segmentos lineales.
%--------------------------------------------------------------------------

M1=[0    0;     %Matriz para generar una imagen binaria.
    128  0;
    128  255;
    255  255];

M2=[0   255;    %Matriz para obtener el negativo de la imagen.
    255 0];

punto1_x=90;
punto2_x=220;
i_realce=255;
M3=[0         0;   %Matriz para resaltar un intervalo de la imagen.
    punto1_x  punto1_x;
    punto1_x  i_realce;
    punto2_x  i_realce;
    punto2_x  punto2_x;
    255 255];
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
title('Imagen de salida binaria usando M1')


disp('M2')
I4=trans_usando_seg_lineales(I2,M2);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida correspondiente al negativo de la imagen de entrada, usando M2')

disp('M3')
I5=trans_usando_seg_lineales(I2,M3);  %Transformación con segmentos lineales.
figure
imshow(escalar_imagen(I5,255,0),'InitialMagnification', 'fit')
title('Imagen de salida donde se resalta un intervalo de intensidades de la imagen de entrada, usando M3')

%--------------------------------------------------------------------------