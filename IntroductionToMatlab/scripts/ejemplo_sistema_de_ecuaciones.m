close all
clear all
clc
%-----------------------------------------------------------------
%Cómo resolver el siguiente sistema de ecuaciones en Matlab?
%  x1  +2*x2=20
%  4*x1-x2  =35

%Primer paso: Una opción consiste en representar 
%             el sistema de la forma M*X=B 

%Segundo paso: Construir la matriz del sistema
M=[1  2;
   4 -1]

%Tercer paso: Construir el vector de valores independientes.
B=[20;
   35]

%Cuarto paso: Obtener el vector columna X=[x1; x2]
X=inv(M)*B

%Quinto paso: En caso de ser necesario recuperar las variables x1 y x2
x1=X(1,1)
x2=X(2,1)
%-----------------------------------------------------------------




