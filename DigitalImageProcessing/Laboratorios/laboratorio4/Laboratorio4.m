%--------------------------------------------------------------------------
%Laboratorio #4 de la asignatura "procesamiento digital de im�genes".
%
%Objetivos:  
%   - Evaluar algunas de las transformaciones geom�tricas que se pueden
%     aplicar a una imagen digital.
%   - Comprender el concepto de mapeo directo y mapeo inverso.
%   - Aprender a aplicar las transformaciones geom�tricas
%     respecto al centro de la imagen.
%
%Observaci�n: 
%  Este archivo requiere los siguientes archivos:
%  "lena512.bmp"
%  "aplicar_transformacion_geometrica.m"
%
%  En este script se asume que las transformaciones H "post multiplican"
%  a un "vector fila" en coordenadas homog�neas de la forma [x, y, 1].
%  Por esta raz�n transformaciones sucesivas se multiplican de la forma
%  H0*H1*H2*....*HN, donde H0 ocurre primero que H1, H1 ocurre primero que
%  H2, etc...
%
%  Este script y la funci�n "aplicar_transformacion_geometrica.m" usan 
%  la siguiente convenci�n para las im�genes digitales:
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
%Selecci�n del tipo de mapeo.
%--------------------------------------------------------------------------
tipo_de_mapeo =2;   %1: mapeo directo.
                    %2: mapeo inverso.
                    
%--------------------------------------------------------------------------
%Transformaciones 
%--------------------------------------------------------------------------

%Determine el centro de la imagen y la matriz de traslaci�n correspondiente.
txc=m/2;
tyc=n/2;

%La siguiente transformaci�n lleva el centro de la imagen al punto superior
%izquierdo.
Hc=[ 1     0    0;
     0     1    0;
    -txc  -tyc  1];

%La siguiente transformaci�n lleva el punto superior
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
% H=Hc*Hs*Huc;      %Transformaci�n respecto al centro de la imagen.
% %H=Hs;            %Transformaci�n respecto a la esquina superior izquierda

%--------------------------------------------------------------------------
%Translaci�n
%--------------------------------------------------------------------------
% tx=10;
% ty=20;
% Ht=[1   0   0;
%    0   1   0;
%    tx  ty  1];
% 
% %En el caso de la translaci�n, el resultado de las siguientes dos
% %expresiones es el mismo !!!.
% H=Ht;      %H=Hc*Ht*Huc;        
%--------------------------------------------------------------------------
%Rotaci�n.
%--------------------------------------------------------------------------
%�ngulo de rotaci�n
theta_grados=45;                    %�ngulo de rotaci�n en grados respecto a x (filas)
theta_rad   =theta_grados*pi/180;   %�ngulo de rotaci�n en radianes.

Hr=[ cos(theta_rad) sin(theta_rad) 0;
   -sin(theta_rad) cos(theta_rad) 0;
    0              0              1];

H=Hc*Hr*Huc;      %Rotaci�n respecto al centro de la imagen.     
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
%Aplicar transformaci�n y visualizar resultados.
%--------------------------------------------------------------------------
%Aplicar la transformaci�n geom�trica.
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
