%--------------------------------------------------------------------------
%Laboratorio #2 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivo: 
%   1. Analizar los efectos que tiene sobre una se�al, las transformaciones 
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
%Configuraci�n de la figura.
h1 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white'); 

title('Ejemplos de escalado de amplitud en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%Definici�n de la variable independiente.
t=0:0.01*pi:(2*pi);          %Crea un vector fila de tiempo [s] que va desde 0 hasta 2*pi en incrementos de 0.01*pi.

%--------------------------------------------------------------------------
%Se�al #1.    
y1=sin(t);                  %Se�al y1=f(t). Esta va a ser la se�al de referencia.
plot(t,y1,'b');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #2.     
y2=2*sin(t);                %Se�al y2=f(t).
plot(t,y2,'r');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #3.     
y3=-0.5*sin(t);             %Se�al y3=f(t).
plot(t,y3,'k');             %Grafica la funci�n y1 vs t usando una l�nea cont�nua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
                   


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos de DESPLAZAMIENTO en amplitud
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuraci�n de la figura.
h2 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white'); 
                  
title('Ejemplos de desplazamiento de amplitud en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')

%--------------------------------------------------------------------------
%Se�al #4.    
y4=sin(t);                   %Se�al y4=f(t). Esta va a ser la se�al de referencia.
plot(t,y4,'b');              %Grafica la funci�n y4 vs t usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #5.     
y5=sin(t)+1;                 %Se�al y5=f(t).
plot(t,y5,'r');              %Grafica la funci�n y5 vs t usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #6.     
y6=sin(t)-1;                 %Se�al y6=f(t).
plot(t,y6,'k');              %Grafica la funci�n y6 vs t usando una l�nea cont�nua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------



%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Ejemplos combinando ESCALADO Y DESPLAZAMIENTO en amplitud
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Configuraci�n de la figura.
h3 = figure;                
hold on;                    
grid on;                    
set(gcf, 'color', 'white');
axis tight                  
title('Ejemplos de escalado y desplazamiento de amplitud en una se�al sinusoidal')
xlabel('Tiempo [s]')
ylabel('Amplitud')
%--------------------------------------------------------------------------
%Se�al #7.    
y7=sin(t);                   %Se�al y7=f(t). Esta va a ser la se�al de referencia.
plot(t,y7,'b');              %Grafica la funci�n y7 vs t usando una l�nea cont�nua de color azul.
%--------------------------------------------------------------------------
%Se�al #8.     
y8=2*sin(t)+1;               %Se�al y8=f(t).
plot(t,y8,'r');              %Grafica la funci�n y8 vs t usando una l�nea cont�nua de color rojo.
%--------------------------------------------------------------------------
%Se�al #9.     
y9=0.5*sin(t)-1;             %Se�al y9=f(t3).
plot(t,y9,'k');              %Grafica la funci�n y9 vs t3 usando una l�nea cont�nua de color negro.

axis tight
hold off 
%--------------------------------------------------------------------------
