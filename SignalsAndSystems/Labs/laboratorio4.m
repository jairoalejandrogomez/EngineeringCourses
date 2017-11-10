%--------------------------------------------------------------------------
%Laboratorio #4 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivos: 
%  1. Extraer el componente par e impar de una se�al.
%  2. Reconstruir una se�al a partir de sus componentes par e impar.
%
%Observaci�n: 
%     Este laboratorio debe ir acompa�ado de los archivos: 
%     senal_de_prueba.m
%     obtener_componente_par_e_impar_de_una_funcion.m
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.
addpath(genpath('./auxiliar/')); %Incluye la carpeta auxiliar en el path.
%--------------------------------------------------------------------------
%Configuraci�n de la figura.
h1 = figure;                %Crea una figura con un manejador h1.

set(gcf, 'color', 'white'); %Define el fondo de color blanco. 

%--------------------------------------------------------------------------
t=-2:0.001:2;               %Vector de tiempo [s]

f = @senal_de_prueba;        %Manejador de la funci�n que genera y(t).

[y_par,y_impar]=obtener_componente_par_e_impar_de_una_funcion(f,t);

%--------------------------------------------------------------------------
y=senal_de_prueba(t);             %Se�al de referencia.
subplot(2,2,1)
plot(t,y,'b')
title('Se�al original y(t)')
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
title('Verificaci�n: y(t)=y_{par}(t) + y_{impar}(t)')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on; 
%--------------------------------------------------------------------------

axis tight