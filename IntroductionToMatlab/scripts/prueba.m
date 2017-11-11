clear all %Elimina todas las variables.
close all %Cierra todas las figuras.
clc       %Limpia la consola. 


x=0:0.01:20*pi;  %Creo un vector de ángulos de 0 a 20pi en radianes.
y=sin(x);       %Calculo el seno de cada ángulo en el vector. 
h1=figure       %Creo una figura en blanco y le asigno el manejador h1.
plot(x,y)       %Grafico el seno de x.



