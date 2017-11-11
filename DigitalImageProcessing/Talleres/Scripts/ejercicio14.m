%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implementar una función que automáticamente genere las máscaras correspondientes a filtros
% pasobajo tipo promedio, promedio ponderado, y paso bajo Gaussiano, a partir del tamaño de la
% máscara M,N. Donde M y N son enteros impares. Puede asumir que las máscaras se van a utilizar en un
% proceso de correlación (no es necesario rotar la máscara).
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------

mascara1=crear_mascara_espacial_para_LPF(5,5,'promedio')
mascara2=crear_mascara_espacial_para_LPF(5,5,'promedio_ponderado')
mascara3=crear_mascara_espacial_para_LPF(5,5,'Gaussiano',2)    %El dos es la desviación estándar que se utiliza.


figure
imagesc(mascara1)
colorbar
colormap gray
title('Máscara promedio')


figure
imagesc(mascara2)
colorbar
colormap gray
title('Máscara promedio ponderado')


figure
imagesc(mascara3)
colorbar
colormap gray
title('Máscara Gaussiana')

%--------------------------------------------------------------------------



