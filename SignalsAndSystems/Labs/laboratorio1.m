%--------------------------------------------------------------------------
%Laboratorio #1 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Aprender a graficar señales de una dimensión en Matlab. 
%   2. Analizar los efectos que tiene sobre una señal, las transformaciones 
%      de escalado y desplazamiento en el tiempo.
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de ESCALADO en el tiempo.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h1 = figure;                %Crea una figura con un manejador h1.
hold on;                    %Evita que la gráfica siguiente borre la gráfica anterior.
grid on;                    %Activa la cuadrícula del gráfico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
title('Ejemplos de escalado en el tiempo en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definición de la variable independiente.
t=-2*(2*pi):0.01*pi:2*(2*pi);          %Crea un vector fila de tiempo [s] que va desde -4*pi hasta 4*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Señal #1.    
y1=sin(t);                  %Señal y1=f(t). Esta va a ser la señal de referencia.
plot(t,y1,'b');             %Grafica la función y1 vs t usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #2.     
y2=sin(2*t);                %Señal y2=f(t).
plot(t,y2,'r');             %Grafica la función y1 vs t usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #3.     
y3=sin(-0.5*t);             %Señal y3=f(t).
plot(t,y3,'k');             %Grafica la función y1 vs t usando una línea contínua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
                   


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de DESPLAZAMIENTO en el tiempo
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h2 = figure;                %Crea una figura con un manejador h2.
hold on;                    %Evita que la gráfica siguiente borre la gráfica anterior.
grid on;                    %Activa la cuadrícula del gráfico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco.               
title('Ejemplos de desplazamiento en el tiempo en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definición de la variable independiente.
t1=-2*pi:0.01*pi:2*pi;              %Crea un vector fila de tiempo [s] que va desde -2*pi hasta 2*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Señal #4.    
y4=sin(t1);                  %Señal y4=f(t1). Esta va a ser la señal de referencia.
plot(t1,y4,'b');             %Grafica la función y4 vs t1 usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #5.     
y5=sin(t1+pi/4);             %Señal y5=f(t1).
plot(t1,y5,'r');             %Grafica la función y5 vs t1 usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #6.     
y6=sin(t1-pi/4);             %Señal y6=f(t1).
plot(t1,y6,'k');             %Grafica la función y6 vs t1 usando una línea contínua de color negro.

axis tight 
hold off 
%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos combinando ESCALADO Y DESPLAZAMIENTO en el tiempo
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuración de la figura.
h3 = figure;                %Crea una figura con un manejador h3.
hold on;                    %Evita que la gráfica siguiente borre la gráfica anterior.
grid on;                    %Activa la cuadrícula del gráfico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
                 
title('Ejemplos de escalado y desplazamiento en el tiempo en una señal sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definición de la variable independiente.
t3=0:0.01*pi:2*(2*pi);         %Crea un vector fila de tiempo [s] que va desde 0 hasta 4*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Señal #7.    
y7=sin(t3);                  %Señal y7=f(t3). Esta va a ser la señal de referencia.
plot(t3,y7,'b');             %Grafica la función y7 vs t3 usando una línea contínua de color azul.
%--------------------------------------------------------------------------
%Señal #8.     
y8=sin(2*t3+pi/4);           %Señal y8=f(t3).
plot(t3,y8,'r');             %Grafica la función y8 vs t3 usando una línea contínua de color rojo.
%--------------------------------------------------------------------------
%Señal #9.     
y9=sin(0.5*t3-pi/4);         %Señal y9=f(t3).
plot(t3,y9,'k');             %Grafica la función y9 vs t3 usando una línea contínua de color negro.

axis tight 
hold off 
%--------------------------------------------------------------------------
