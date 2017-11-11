%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Mayo 2012.
%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que calcule un filtro paso alto en
% frecuencia, bien sea, un filtro ideal, Butterworth, o Gaussiano.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
P1=100
Q1=100
D0_1=50
tipo1='IHPF'  %Filtro paso alto ideal.

H1 = crear_filtro_HPF_en_frecuencia(P1,Q1,D0_1,tipo1);
figure
imshow(H1,'InitialMagnification', 'fit')
title('Filtro HPF ideal')

figure
surf(H1)
title('Filtro HPF ideal')
%--------------------------------------------------------------------------
P2=100
Q2=100
D0_2=10
n2=2
tipo2='BHPF'  %Filtro paso alto Butterworth.
H2 = crear_filtro_HPF_en_frecuencia(P2,Q2,D0_2,tipo2,n2);

figure
imshow(H2,'InitialMagnification', 'fit')
title('Filtro HPF Butterworth')


figure
surf(H2)
title('Filtro HPF Butterworth')
%--------------------------------------------------------------------------
P3=100
Q3=100
D0_3=10
tipo3='GHPF'  %Filtro paso bajo Gaussiano.
H3 = crear_filtro_HPF_en_frecuencia(P3,Q3,D0_3,tipo3);

figure
imshow(H3,'InitialMagnification', 'fit')
title('Filtro HPF Gaussiano')

figure
surf(H3)
title('Filtro HPF Gaussiano')
%--------------------------------------------------------------------------

