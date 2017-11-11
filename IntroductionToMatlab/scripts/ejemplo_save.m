close all
clear all
clc


a=14.2;
b=[4 5; 6 7];

%Para guardar TODAS las variables disponibles en el workspace,
%en un archivo con nombre todas_las_variables.mat
%en la ruta C:\MiCarpetaDeEjemplo\
%debe escribir:
save('C:\MiCarpetaDeEjemplo\todas_las_variables.mat'); 


c=[1 2 ; 3 4];
d=20.7;

%Para guardar ÚNICAMENTE las variables "c" y "d" 
%en un archivo con nombre algunas_variables.mat
%en la ruta C:\MiCarpetaDeEjemplo\
%debe escribir:
save('C:\MiCarpetaDeEjemplo\algunas_variables.mat','c','d'); 

