%--------------------------------------------------------------------------
%Laboratorio #5 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivo: 
%   1. Graficar los polos y ceros de una función racional compleja en
%   Matlab.
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
%Graficando polos y ceros de forma manual.
%--------------------------------------------------------------------------
%Función de transferencia H=(s+3)*(s+1)/(s*(s+2));

%La primera columna va a representar la parte real.
%La segunda columna va a representar la parte imaginaria.
ceros=[-1 0;
       -3 0]
   
polos=[0  0;
       -2 0]
h1=figure;                                       %Se crea la figura.                                      
plot(ceros(:,1),ceros(:,2),'o','MarkerSize',14)  %Usa un marcador con forma de o para indicar los ceros.
hold on
plot(polos(:,1),polos(:,2),'x','MarkerSize',14)  %Usa un marcador con forma de x para indicar los polos.
hold off
grid on                                          %Muestra la cuadrícula.

set(gcf,'color','white')
title('Diagrama de polos y ceros de H(s)')
xlabel('Eje real')
ylabel('Eje imaginario')

%--------------------------------------------------------------------------
%Graficando polos y ceros usando los comandos de Matlab.
%--------------------------------------------------------------------------
s = tf('s')               % Define la variable de Laplace s.
H=(s+3)*(s+1)/(s*(s+2));  % Crea función de transferencia H(s)
h2=figure;
pz=pzplot(H);
grid on
set(gcf,'color','white')
p = getoptions(pz)        % Obtenga las opciones del gráfico.
p.Title.Color = [0,0,1];  % Cambie el color del título de acuerdo con su representación [R G B]. 
                          % Los valores están acotados entre 0 y 1
setoptions(pz,p);         % Aplique las opciones al gráfico.
%--------------------------------------------------------------------------



