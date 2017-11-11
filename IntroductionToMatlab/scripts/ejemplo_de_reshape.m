%-----------------------------------------------------------------------
close all        %Cierra todas las ventanas.
clear all        %Borra todas las variables del workspace.
clc              %Limpia la consola.
%-----------------------------------------------------------------------
A =[7 6 4        %Crea una matriz A de 2 filas y 3 columnas.
    1 8 2]       
[m,n]=size(A)    %m: número de filas de A.  n: número de columnas de A.
B=reshape(A,3,2) %B es una matriz de 3 filas y 2 columnas.
C=reshape(A,6,1) %C es una matriz de 6 filas y 1 columna.
D=reshape(A,1,6) %D es una matriz de 1 fila y 6 columnas. 
%-----------------------------------------------------------------------


% 
% %Resultados en consola:
% 
% A =  7     6     4
%      1     8     2
% 
% m =  2
% 
% n =  3
% 
% B =  7     8
%      1     4
%      6     2
% 
% C =  7
%      1
%      6
%      8
%      4
%      2
% 
% D =  7     1     6     8     4     2

