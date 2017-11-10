%--------------------------------------------------------------------------
%Laboratorio #4 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%  1. Extraer el componente par e impar de una señal.
%  2. Reconstruir una señal a partir de sus componentes par e impar.
%
%Observación: 
%     Este laboratorio debe ir acompañado de los archivos: 
%     my_signal_lab3.m
%     obtener_componente_par_e_impar_de_una_funcion.m
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.
%--------------------------------------------------------------------------
%Configuración de la figura.
h1 = figure;                %Crea una figura con un manejador h1.

set(gcf, 'color', 'white'); %Define el fondo de color blanco. 

%--------------------------------------------------------------------------
t=-2:0.001:2;               %Vector de tiempo [s]

f = @my_signal_lab3;        %Manejador de la función que genera y(t).

[y_par,y_impar]=obtener_componente_par_e_impar_de_una_funcion(f,t);

%--------------------------------------------------------------------------
y=my_signal_lab3(t);             %Señal de referencia.
subplot(2,2,1)
plot(t,y,'b')
title('Señal original y(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------      
subplot(2,2,2)
plot(t,y_par,'r')
title('y_{par}(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------
subplot(2,2,3)
plot(t,y_impar,'k')
title('y_{impar}(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------              
subplot(2,2,4)     
plot(t,y_par+y_impar,'g')
title('Verificación: y(t)=y_{par}(t) + y_{impar}(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------

axis tight