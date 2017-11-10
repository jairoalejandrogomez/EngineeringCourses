%--------------------------------------------------------------------------
%Laboratorio #3 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%  1. Aprender a generar funciones arbitrarias definidas por segmentos en
%     Matlab.
%  2. Reconocer la utilidad de las ventanas rectangulares en la definición
%     de funciones definidas por segmentos.
%
%Observación: 
%     Este laboratorio debe ir acompañado del archivo: senal_de_prueba.m
%
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.
addpath(genpath('./auxiliar/')); %Incluye la carpeta auxiliar en el path.
%--------------------------------------------------------------------------
%Configuración de la figura.
h1 = figure;                %Crea una figura con un manejador h1.

set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
%--------------------------------------------------------------------------
t=-2:0.001:2;
y=senal_de_prueba(t);             %Señal de referencia.
subplot(2,2,1)
plot(t,y,'b')
title('y(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------
y2=senal_de_prueba(2*t);             
subplot(2,2,2)
plot(t,y2,'r')
title('y(2t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------
subplot(2,2,3)
y3=senal_de_prueba(t-1);             
plot(t,y3,'k')
title('y(t-1)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------              
subplot(2,2,4)
y3=senal_de_prueba(2*t-1);             
plot(t,y3,'g')
title('y(2t-1)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------
axis tight
