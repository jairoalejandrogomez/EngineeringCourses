%--------------------------------------------------------------------------
%Laboratorio #3 de la asignatura "procesamiento digital de imágenes".
%
%Objetivos:  
%   - Obtener una imagen en escala de grises a partir de una imagen a color.
%   - Evaluar las transformaciones de intensidad lineales.
%  -  Evalaur las transformaciones de intensidad gamma.
%  -  Evalaur las transformaciones de intensidad logarítmicas.
%
%Observación: Este archivo requiere la siguiente imagen: "paris.jpg"
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
%Leer y mostrar imagen a color
%--------------------------------------------------------------------------
I=imread('paris.jpg');

h1=figure;
imshow(I,[])
title('Imagen a color')

%--------------------------------------------------------------------------
%Extraer planos de color
%--------------------------------------------------------------------------

R=double(I(:,:,1));
G=double(I(:,:,2));
B=double(I(:,:,3));

%--------------------------------------------------------------------------
%Conversión de RGB a escala de grises usando los comandos de Matlab.
%--------------------------------------------------------------------------
Igray = rgb2gray(I);
h2=figure;
imshow(Igray,[0 255])
title('Imagen en escala de grises usando rgb2gray')

%--------------------------------------------------------------------------
%Conversión de RGB a escala de grises usando coeficientes definidos por el
%usuario.
%--------------------------------------------------------------------------
Igray2=(1/3)*R+(1/3)*G+(1/3)*B;            %Conversión a escala de grises usando el mismo peso para cada plano de color.

%Igray2=(0.2989)*R+(0.587)*G+(0.1140)*B;   %Conversión a escala de grises usando los pesos que emplea Matlab en el comando rgb2gray

h3=figure;
imshow(uint8(Igray2),[0 255])
title('Imagen en escala de grises combinando los planos de color manualmente')

%--------------------------------------------------------------------------
%Ejemplos de transformaciones de intensidad
%--------------------------------------------------------------------------
%Transformación lineal
pendiente=1.5;               %Ensaye valores como 0.5, 0.8, 1, 1.2, 1.5
corte    =0;                 %Ensaye valores como 0, -50, -100, 50, 100
I1=pendiente*Igray2+corte;
I1=uint8(I1);
h4=figure;
imshow(I1,[0 255])
title('Resultado de aplicar una transformación lineal')

%Transformación gamma.
gamma=0.5;                   %Ensaye valores entre >0 y <1
I2=Igray2.^gamma;
maxI2=max(max(I2));
C2=255/maxI2;
I2=uint8(C2*I2);
h4=figure;
imshow(I2,[0 255])
title('Resultado de aplicar una transformación gamma, con gama entre 0 y 1')

%Transformación gamma.
gamma=1.5;                  %Ensaye valores >1
I3=Igray2.^gamma;
maxI3=max(max(I3));
C3=255/maxI3;
I3=uint8(C3*I3);
h4=figure;
imshow(I3,[0 255])
title('Resultado de aplicar una transformación gamma, con gama mayor que 1')

%Transformación logarítmica.
I4=log10(1+Igray2);
maxI4=max(max(I4));
%maxI2*C=255, luego:
C4=255/maxI4;
I4=uint8(C4*I4);
h4=figure;
imshow(I4,[0 255])
title('Resultado de aplicar una transformación logarítmica')
%--------------------------------------------------------------------------



























