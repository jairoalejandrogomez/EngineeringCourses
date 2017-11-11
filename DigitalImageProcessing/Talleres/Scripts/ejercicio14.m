%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro G�mez.
%Instituci�n: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implementar una funci�n que autom�ticamente genere las m�scaras correspondientes a filtros
% pasobajo tipo promedio, promedio ponderado, y paso bajo Gaussiano, a partir del tama�o de la
% m�scara M,N. Donde M y N son enteros impares. Puede asumir que las m�scaras se van a utilizar en un
% proceso de correlaci�n (no es necesario rotar la m�scara).
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------

mascara1=crear_mascara_espacial_para_LPF(5,5,'promedio')
mascara2=crear_mascara_espacial_para_LPF(5,5,'promedio_ponderado')
mascara3=crear_mascara_espacial_para_LPF(5,5,'Gaussiano',2)    %El dos es la desviaci�n est�ndar que se utiliza.


figure
imagesc(mascara1)
colorbar
colormap gray
title('M�scara promedio')


figure
imagesc(mascara2)
colorbar
colormap gray
title('M�scara promedio ponderado')


figure
imagesc(mascara3)
colorbar
colormap gray
title('M�scara Gaussiana')

%--------------------------------------------------------------------------



