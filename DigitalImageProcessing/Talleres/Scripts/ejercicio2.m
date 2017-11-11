%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro G�mez.
%Instituci�n: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Ejercicio2: Dise�e una funci�n en Matlab que tome como argumentos una imagen en escala de grises de tama�o
% arbitrario, y una serie de argumentos variables (ver comandos: varargin, nargin de Matlab) que definan
% tanto el tipo de funci�n de ajuste a utilizar as� como los par�metros requeridos por dicha funci�n de
% ajuste. El cuerpo de la funci�n debe aplicar el ajuste de intensidad a cada pixel de la imagen de entrada.
% La funci�n deber� permitir aplicar transformaciones de intensidad lineal, logar�tmica, y ley de potencia
% seg�n lo requiera el usuario.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%Ejemplo usando una transformaci�n lineal (negativo)
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
title('Imagen de salida con una transformaci�n lineal (Negativo)')
%--------------------------------------------------------------------------
%Ejemplo usando una transformaci�n logar�tmica.
%--------------------------------------------------------------------------

nombre_imagen_con_extension2='Fig0305(a)(DFT_no_log).tif';  %Image to load.
I3=imread(nombre_imagen_con_extension2);     %Read image from file
imfinfo(nombre_imagen_con_extension2)

figure
imshow(escalar_imagen(I3,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

c=1;
I4=trans_intensidad(I3,'log',c);

figure
imshow(escalar_imagen(I4,255,0),'InitialMagnification', 'fit')
title('Imagen de salida con una transformaci�n logar�tmica')
%--------------------------------------------------------------------------
%Ejemplo usando una transformaci�n de ley de potencia.
%--------------------------------------------------------------------------

nombre_imagen_con_extension3='Fig0308(a)(fractured_spine).tif';  %Image to load.
I5=imread(nombre_imagen_con_extension3);     %Read image from file
imfinfo(nombre_imagen_con_extension3)

figure
imshow(escalar_imagen(I5,255,0),'InitialMagnification', 'fit')
title('Imagen de entrada')

c=1;
gamma=0.4;
I6=trans_intensidad(I5,'potencia',c,gamma);

figure
imshow(escalar_imagen(I6,255,0),'InitialMagnification', 'fit')
title('Imagen de salida con una transformaci�n de ley de potencia')
%--------------------------------------------------------------------------








