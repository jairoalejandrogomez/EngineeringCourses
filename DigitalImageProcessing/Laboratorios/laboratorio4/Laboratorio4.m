%--------------------------------------------------------------------------
%Laboratorio #4 de la asignatura "procesamiento digital de imágenes".
%
%Objetivos:  
%   - Evaluar algunas de las transformaciones geométricas que se pueden
%     aplicar a una imagen digital.
%   - Comprender el concepto de mapeo directo y mapeo inverso.
%   - Aprender a aplicar las transformaciones geométricas
%     respecto al centro de la imagen.
%
%Observación: 
%  Este archivo requiere los siguientes archivos:
%  "lena512.bmp"
%  "aplicar_transformacion_geometrica.m"
%
%  En este script se asume que las transformaciones H "post multiplican"
%  a un "vector fila" en coordenadas homogéneas de la forma [x, y, 1].
%  Por esta razón transformaciones sucesivas se multiplican de la forma
%  H0*H1*H2*....*HN, donde H0 ocurre primero que H1, H1 ocurre primero que
%  H2, etc...
%
%  Este script y la función "aplicar_transformacion_geometrica.m" usan 
%  la siguiente convención para las imágenes digitales:
%
%     |-------- y
%     |
%     |
%     |
%     x
%
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
%Imagen sencilla de prueba.
% I=zeros(100,100);
% I(20:80,20:80)=128;
% I(40:60,40:60)=255;
% I(:,40:60)=255;

%Imagen del disco duro.
I=imread('lena512.bmp');


%Determine las filas y columnas de la imagen.
[m,n,k]=size(I); 

%--------------------------------------------------------------------------
%Selección del tipo de mapeo.
%--------------------------------------------------------------------------
tipo_de_mapeo =2;   %1: mapeo directo.
                    %2: mapeo inverso.
                    
%--------------------------------------------------------------------------
%Transformaciones 
%--------------------------------------------------------------------------

%Determine el centro de la imagen y la matriz de traslación correspondiente.
txc=m/2;
tyc=n/2;

%La siguiente transformación lleva el centro de la imagen al punto superior
%izquierdo.
Hc=[ 1     0    0;
     0     1    0;
    -txc  -tyc  1];

%La siguiente transformación lleva el punto superior
%izquierdo de la imagen al centro.
Huc=[1   0    0;
     0   1    0;
    txc  tyc  1];
           
%--------------------------------------------------------------------------
%Escala
%--------------------------------------------------------------------------
% cx=1.2;  %Factor de escala en x (filas).
% cy=1.2;  %Factor de escala en y (columnas).
% 
% Hs=[cx 0  0;
%     0  cy 0;
%     0  0  1];
% 
% H=Hc*Hs*Huc;      %Transformación respecto al centro de la imagen.
% %H=Hs;            %Transformación respecto a la esquina superior izquierda

%--------------------------------------------------------------------------
%Translación
%--------------------------------------------------------------------------
% tx=10;
% ty=20;
% Ht=[1   0   0;
%    0   1   0;
%    tx  ty  1];
% 
% %En el caso de la translación, el resultado de las siguientes dos
% %expresiones es el mismo !!!.
% H=Ht;      %H=Hc*Ht*Huc;        
%--------------------------------------------------------------------------
%Rotación.
%--------------------------------------------------------------------------
%Ángulo de rotación
theta_grados=45;                    %Ángulo de rotación en grados respecto a x (filas)
theta_rad   =theta_grados*pi/180;   %Ángulo de rotación en radianes.

Hr=[ cos(theta_rad) sin(theta_rad) 0;
   -sin(theta_rad) cos(theta_rad) 0;
    0              0              1];

H=Hc*Hr*Huc;      %Rotación respecto al centro de la imagen.     
%--------------------------------------------------------------------------
%Shear vertical 
%--------------------------------------------------------------------------
% sv=0.5;
% Hsv=[1   0  0;
%      sv  1  0;
%      0   0  1];
% 
% H=Hc*Hsv*Huc;      %Shear vertical respecto al centro de la imagen.  
%--------------------------------------------------------------------------
%Shear horizontal
%--------------------------------------------------------------------------
% sh=0.5;
% Hsh=[1   sh  0;
%      0   1   0;
%      0   0   1];
%  
% H=Hc*Hsh*Huc;      %Shear vertical respecto al centro de la imagen. 
%--------------------------------------------------------------------------
%Aplicar transformación y visualizar resultados.
%--------------------------------------------------------------------------
%Aplicar la transformación geométrica.
I2=aplicar_transformacion_geometrica(I,H,tipo_de_mapeo);

%Mostrar la imagen original.
h1=figure;
imshow(I,[])
title('Imagen original')

%Mostrar la imagen transformada.
h2=figure;
imshow(uint8(I2),[])
title('Imagen transformada')
%--------------------------------------------------------------------------
