close all
clear all
clc
%----------------------------------
%Ejemplo1
b=[]
n=5
for i=1:n
   
    b(i,1)=2*i-1;  %Genere los n primeros números impares
    
end
b
%----------------------------------
%Ejemplo2
a=randi(10,[3,2])
[m,n]=size(a);
suma=0;
for i=1:m
    for j=1:n
       suma=suma+a(i,j); %Calcule la suma de todos los elementos
                         %de la matriz.
    end
end
suma