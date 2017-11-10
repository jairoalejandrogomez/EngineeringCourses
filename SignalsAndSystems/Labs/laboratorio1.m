%--------------------------------------------------------------------------
%Laboratorio #1 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivos: 
%   1. Aprender a graficar se�ales de una dimensi�n en Matlab. 
%   2. Analizar los efectos que tiene sobre una se�al, las transformaciones 
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
%Configuraci�n de la figura.
h1 = figure;                %Crea una figura con un manejador h1.
hold on;                    %Evita que la gr�fica siguiente borre la gr�fica anterior.
grid on;                    %Activa la cuadr�cula del gr�fico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
title('Ejemplos de escalado en el tiempo en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definici�n de la variable independiente.
t=-2*(2*pi):0.01*pi:2*(2*pi);          %Crea un vector fila de tiempo [s] que va desde -4*pi hasta 4*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Se�al #1.    
y1=sin(t);                  %Se�al y1=f(t). Esta va a ser la se�al de referencia.
plot(t,y1,'b');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #2.     
y2=sin(2*t);                %Se�al y2=f(t).
plot(t,y2,'r');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #3.     
y3=sin(-0.5*t);             %Se�al y3=f(t).
plot(t,y3,'k');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
                   


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de DESPLAZAMIENTO en el tiempo
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuraci�n de la figura.
h2 = figure;                %Crea una figura con un manejador h2.
hold on;                    %Evita que la gr�fica siguiente borre la gr�fica anterior.
grid on;                    %Activa la cuadr�cula del gr�fico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco.               
title('Ejemplos de desplazamiento en el tiempo en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definici�n de la variable independiente.
t1=-2*pi:0.01*pi:2*pi;              %Crea un vector fila de tiempo [s] que va desde -2*pi hasta 2*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Se�al #4.    
y4=sin(t1);                  %Se�al y4=f(t1). Esta va a ser la se�al de referencia.
plot(t1,y4,'b');             %Grafica la funci�n y4 vs t1 usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #5.     
y5=sin(t1+pi/4);             %Se�al y5=f(t1).
plot(t1,y5,'r');             %Grafica la funci�n y5 vs t1 usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #6.     
y6=sin(t1-pi/4);             %Se�al y6=f(t1).
plot(t1,y6,'k');             %Grafica la funci�n y6 vs t1 usando una l�nea cont�nua de color negro.

axis tight 
hold off 
%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos combinando ESCALADO Y DESPLAZAMIENTO en el tiempo
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuraci�n de la figura.
h3 = figure;                %Crea una figura con un manejador h3.
hold on;                    %Evita que la gr�fica siguiente borre la gr�fica anterior.
grid on;                    %Activa la cuadr�cula del gr�fico.
set(gcf, 'color', 'white'); %Define el fondo de color blanco. 
                 
title('Ejemplos de escalado y desplazamiento en el tiempo en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definici�n de la variable independiente.
t3=0:0.01*pi:2*(2*pi);         %Crea un vector fila de tiempo [s] que va desde 0 hasta 4*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Se�al #7.    
y7=sin(t3);                  %Se�al y7=f(t3). Esta va a ser la se�al de referencia.
plot(t3,y7,'b');             %Grafica la funci�n y7 vs t3 usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #8.     
y8=sin(2*t3+pi/4);           %Se�al y8=f(t3).
plot(t3,y8,'r');             %Grafica la funci�n y8 vs t3 usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #9.     
y9=sin(0.5*t3-pi/4);         %Se�al y9=f(t3).
plot(t3,y9,'k');             %Grafica la funci�n y9 vs t3 usando una l�nea cont�nua de color negro.

axis tight 
hold off 
%--------------------------------------------------------------------------
