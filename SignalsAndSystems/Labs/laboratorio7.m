%--------------------------------------------------------------------------
%Laboratorio #7 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivos: 
%   1. Construir una se�al per�odica a partir de una se�al aperi�dica. 
%   2. Analizar el comportamiento de la suma de se�ales peri�dicas.
%
%Observaci�n: 
%     Este laboratorio debe ir acompa�ado de los archivos: 
%     my_signal_lab3.m
%     crear_funcion_periodica.m
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.




%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Construyendo una se�al peri�dica a partir de una se�al aperi�dica.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

h1 = figure; 
set(gcf, 'color', 'white');    

mi_funcion = @my_signal_lab3;  %Manejador de la funci�n que define la funci�n entre 0 y T.

T=4.0;                         %Periodo fundamental en [s]. 
                               %Note que el valor m�nimo sin que se recorte la se�ale ser�a T=1 para my_signal_lab3.
                               %Experimentar con diferentes valores de T,
                               %por ejemplo: 1, 1.5, 2.0, 0.5

t=0:T/100:10*T;                %Definici�n de la variable independiente.
                               %Crea un vector fila de tiempo [s].
                               
subplot(2,1,1);
plot(t,mi_funcion(t),'b');     %Grafica la se�al aperi�dica correspondiente en azul
title('Se�al aperi�dica.')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

y_periodica=crear_funcion_periodica(mi_funcion,T,t);  %Genera la se�al per�odica con periodo fundamental T. 

subplot(2,1,2)
plot(t,y_periodica,'r');       %Grafica la se�al peri�dica en rojo.
titulo=sprintf('Se�al peri�dica con per�odo fundamental T = %3.1f [s].',T);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

axis tight
hold off

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Suma de dos se�ales peri�dicas.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
h2 = figure; 
set(gcf, 'color', 'white');   

T1=1.5;                             %Per�odo de la primera se�al [s].
T2=2;                               %Per�odo de la segunda se�al [s].
tx=0:min([T1,T2])/100:10*T1*T2;     %vector de tiempo [s]

y1=sin((2*pi/T1)*tx);               %Se�al con per�odo T1.
y2=sin((2*pi/T2)*tx);               %Se�al con per�odo T2.
y3=y1+y2;                           %Suma de dos se�ales per�odicas.

subplot(3,1,1)
plot(tx,y1,'b')
title('Se�al y1(t).')
ylabel('Amplitud')
grid on;                   

subplot(3,1,2)
plot(tx,y2,'r')
title('Se�al y2(t).')
ylabel('Amplitud')
grid on;                   

subplot(3,1,3)
plot(tx,y3,'k')
title('Se�al y3(t)=y1(t)+y2(t).')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   

%--------------------------------------------------------------------------





