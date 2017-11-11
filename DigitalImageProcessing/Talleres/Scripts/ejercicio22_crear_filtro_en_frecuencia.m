%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Mayo 2012.
%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que calcule un filtro paso bajo en
% frecuencia, bien sea, un filtro ideal, Butterworth, o Gaussiano.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
P1=100
Q1=100
D0_1=10
tipo1='ILPF'  %Filtro paso bajo ideal.

H1 = crear_filtro_LPF_en_frecuencia(P1,Q1,D0_1,tipo1);
figure
imshow(H1,'InitialMagnification', 'fit')
title('Filtro LPF ideal')

figure
surf(H1)
title('Filtro LPF ideal')
%--------------------------------------------------------------------------
P2=100
Q2=100
D0_2=10
n2=2
tipo2='BLPF'  %Filtro paso bajo Butterworth.
H2 = crear_filtro_LPF_en_frecuencia(P2,Q2,D0_2,tipo2,n2);

figure
imshow(H2,'InitialMagnification', 'fit')
title('Filtro LPF Butterworth')


figure
surf(H2)
title('Filtro LPF Butterworth')
%--------------------------------------------------------------------------
P3=100
Q3=100
D0_3=10
tipo3='GLPF'  %Filtro paso bajo Gaussiano.
H3 = crear_filtro_LPF_en_frecuencia(P3,Q3,D0_3,tipo3);

figure
imshow(H3,'InitialMagnification', 'fit')
title('Filtro LPF Gaussiano')

figure
surf(H3)
title('Filtro LPF Gaussiano')
%--------------------------------------------------------------------------

