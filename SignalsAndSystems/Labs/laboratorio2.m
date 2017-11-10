%--------------------------------------------------------------------------
%Laboratorio #2 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivo: 
%   1. Analizar los efectos que tiene sobre una señal, las transformaciones 
%      de escalado y desplazamiento en amplitud.
%--------------------------------------------------------------------------
close all                   
clear all                   
clc                        

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de ESCALADO en amplitud
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h1 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white'); 

title('Ejemplos de escalado de amplitud en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definición de la variable independiente.
t=0:0.01*pi:(2*pi);          %Crea un vector fila de tiempo [s] que va desde 0 hasta 2*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Señal #1.    
y1=sin(t);                  %Señal y1=f(t). Esta va a ser la señal de referencia.
plot(t,y1,'b');             %Grafica la función y1 vs t usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #2.     
y2=2*sin(t);                %Señal y2=f(t).
plot(t,y2,'r');             %Grafica la función y1 vs t usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #3.     
y3=-0.5*sin(t);             %Señal y3=f(t).
plot(t,y3,'k');             %Grafica la función y1 vs t usando una línea contínua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
                   


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de DESPLAZAMIENTO en amplitud
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h2 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white'); 
                  
title('Ejemplos de desplazamiento de amplitud en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%--------------------------------------------------------------------------
%Señal #4.    
y4=sin(t);                   %Señal y4=f(t). Esta va a ser la señal de referencia.
plot(t,y4,'b');              %Grafica la función y4 vs t usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #5.     
y5=sin(t)+1;                 %Señal y5=f(t).
plot(t,y5,'r');              %Grafica la función y5 vs t usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #6.     
y6=sin(t)-1;                 %Señal y6=f(t).
plot(t,y6,'k');              %Grafica la función y6 vs t usando una línea contínua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos combinando ESCALADO Y DESPLAZAMIENTO en amplitud
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h3 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white');
axis tight                  
title('Ejemplos de escalado y desplazamiento de amplitud en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')
%--------------------------------------------------------------------------
%Señal #7.    
y7=sin(t);                   %Señal y7=f(t). Esta va a ser la señal de referencia.
plot(t,y7,'b');              %Grafica la función y7 vs t usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #8.     
y8=2*sin(t)+1;               %Señal y8=f(t).
plot(t,y8,'r');              %Grafica la función y8 vs t usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #9.     
y9=0.5*sin(t)-1;             %Señal y9=f(t3).
plot(t,y9,'k');              %Grafica la función y9 vs t3 usando una línea contínua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
