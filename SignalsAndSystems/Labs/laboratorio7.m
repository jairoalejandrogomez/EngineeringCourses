%--------------------------------------------------------------------------
%Laboratorio #7 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Construir una señal períodica a partir de una señal aperiódica. 
%   2. Analizar el comportamiento de la suma de señales periódicas.
%
%Observación: 
%     Este laboratorio debe ir acompañado de los archivos: 
%     my_signal_lab3.m
%     crear_funcion_periodica.m
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.




%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Construyendo una señal periódica a partir de una señal aperiódica.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

h1 = figure; 
set(gcf, 'color', 'white');    

mi_funcion = @my_signal_lab3;  %Manejador de la función que define la función entre 0 y T.

T=4.0;                         %Periodo fundamental en [s]. 
                               %Note que el valor mínimo sin que se recorte la señale sería T=1 para my_signal_lab3.
                               %Experimentar con diferentes valores de T,
                               %por ejemplo: 1, 1.5, 2.0, 0.5

t=0:T/100:10*T;                %Definición de la variable independiente.
                               %Crea un vector fila de tiempo [s].
                               
subplot(2,1,1);
plot(t,mi_funcion(t),'b');     %Grafica la señal aperiódica correspondiente en azul
title('Señal aperiódica.')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

y_periodica=crear_funcion_periodica(mi_funcion,T,t);  %Genera la señal períodica con periodo fundamental T. 

subplot(2,1,2)
plot(t,y_periodica,'r');       %Grafica la señal periódica en rojo.
titulo=sprintf('Señal periódica con período fundamental T = %3.1f [s].',T);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

axis tight
hold off

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Suma de dos señales periódicas.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
h2 = figure; 
set(gcf, 'color', 'white');   

T1=1.5;                             %Período de la primera señal [s].
T2=2;                               %Período de la segunda señal [s].
tx=0:min([T1,T2])/100:10*T1*T2;     %vector de tiempo [s]

y1=sin((2*pi/T1)*tx);               %Señal con período T1.
y2=sin((2*pi/T2)*tx);               %Señal con período T2.
y3=y1+y2;                           %Suma de dos señales períodicas.

subplot(3,1,1)
plot(tx,y1,'b')
title('Señal y1(t).')
ylabel('Amplitud')
grid on;                   

subplot(3,1,2)
plot(tx,y2,'r')
title('Señal y2(t).')
ylabel('Amplitud')
grid on;                   

subplot(3,1,3)
plot(tx,y3,'k')
title('Señal y3(t)=y1(t)+y2(t).')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

%--------------------------------------------------------------------------





