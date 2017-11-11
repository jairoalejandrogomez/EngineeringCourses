%--------------------------------------------------------------------------
close all        %Cierra todas las ventanas.
clear all        %Borra todas las variables del workspace.
clc              %Limpia la consola.
%--------------------------------------------------------------------------
a=[1; 2; 3]      %a es un vector columna de 3 filas.
b=[4; 5; 6]      %b es un vector columna de 3 filas.
c=a.*b           %c va a ser un vector columna de 3 elementos. 
d=(a.')*b        %d va a ser un número escalar.
e=(a)*(b.')      %e va a ser una matriz de 3 filas y 3 columnas.
%--------------------------------------------------------------------------
