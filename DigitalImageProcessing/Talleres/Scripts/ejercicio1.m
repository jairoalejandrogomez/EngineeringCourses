%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Ejercicio1: Desarrolle una función en Matlab que retorne una imagen de salida en una escala de grises de 0 a L-1.
% La imagen de salida puede ser tipo uint o double según lo indique el usuario con un parámetro de
% entrada llamado tipo (si tipo = 0, la intensidad debe entregarse como entero sin signo, si tipo=1, la
% intensidad debe entregarse como doble). La función internamente debe escalar la imagen, y en caso
% que se deba retornar usando enteros sin signo, debe determinar automáticamente si debe usar unit8,
% uint16, uint32, o uint64.
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------

nombre_imagen_con_extension='Fig0304(a)(breast_digital_Xray).tif';  %Image to load.
I=imread(nombre_imagen_con_extension);     %Read image from file

imfinfo(nombre_imagen_con_extension)
%--------------------------------------------------------------------------
I2=escalar_imagen(I,31,0);

figure
imshow(I2,'InitialMagnification', 'fit')
%--------------------------------------------------------------------------




