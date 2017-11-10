%--------------------------------------------------------------------------
%Laboratorio #6 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivo: 
%   1. Analizar la evolución en el tiempo de las señales sinusoidales y 
%      exponenciales complejas.
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de señales sinusoidales reales
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h1 = figure;                %Crea una figura con un manejador h1.
hold on;                    %Evita que la gráfica siguiente borre la gráfica anterior.
grid on;                    %Activa la cuadrícula del gráfico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 

title('Ejemplos de señales sinusoidales reales.')
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
y2=2*sin(2*t);              %Señal y2=f(t).
plot(t,y2,'r');             %Grafica la función y1 vs t usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #3.     
y3=-0.5*sin(t+pi/4);          %Señal y3=f(t).
plot(t,y3,'k');             %Grafica la función y1 vs t usando una línea contínua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
                   


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de señales exponenciales complejas
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h2 = figure;                %Crea una figura con un manejador h2.
hold on;                    %Evita que la gráfica siguiente borre la gráfica anterior.
grid on;                    %Activa la cuadrícula del gráfico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
                 
title('Ejemplos de señales exponenciales complejas en el tiempo')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definición de la variable independiente.
t1=0:0.01*pi:8*pi;              %Crea un vector fila de tiempo [s].

%--------------------------------------------------------------------------
mag_A=1;                     %Magnitud de A.  Experimentar con los siguientes valores: -0.5, 0, 0.5, 1, 2.
theta=0;                     %Argumento de A. Experimentar con los siguientes valores: -pi/4, 0, pi/4, pi/2.
A=mag_A*exp(i*theta);        %Número complejo A.

sigma  = -0.5;               %Factor de amortiguación. Experimentar con los siguientes valores: 0, -0.1, 0.1, -0.5 y 0.5
w      = 2;                  %Frecuencia angular.      Experimentar con los siguientes valores: 0, 0.5, 1, 2
lambda = sigma + i*w;        %Número complejo lambda.

y4=A*exp(lambda*t1);         %Señal compleja y4=f(t1). 

%Señal #4. 
plot(t1,real(y4),'b');       %Grafica la parte real de y4
plot(t1,imag(y4),'r');       %Grafica la parte imaginaria de y4.
legend('Componente real','Componente imaginario')

axis tight 
hold off
%--------------------------------------------------------------------------



