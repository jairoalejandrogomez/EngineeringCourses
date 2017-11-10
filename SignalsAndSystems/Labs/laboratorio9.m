%--------------------------------------------------------------------------
%Laboratorio #9 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Explorar la representación en series de Fourier de una
%      señal periódica en tiempo continuo.
%
%Observación: 
%     Este laboratorio debe ir acompañado de los archivos: 
%     crear_funcion_periodica.m
%--------------------------------------------------------------------------
close all                   
clear all                   
clc                         
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Construyendo una señal periódica a partir de una señal aperiódica.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
  
%--------------------------------------------------------------------------
%A*[u(t)-u(t-t_on)] Pulso rectangular aperiódico de amplitud A y tiempo 
%                   en alto t_on.
%--------------------------------------------------------------------------
A         = 1.0;   %Amplitud del pulso
t_on      = 1.0;   %Tiempo en alto del pulso [s]
T         = 2.0;   %Periodo fundamental de la señal periódica correspondiente en [s]. 

mi_funcion=@(t) A*(my_unit_step(t)-my_unit_step(t-t_on));   %Manejador a una función anónima.

t=0:T/100:10*T;                                             %Definición de la variable independiente.
                                                            %Crea un vector fila de tiempo [s].

y_periodica=crear_funcion_periodica(mi_funcion,T,t);        %Genera la señal períodica con periodo fundamental T. 
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Reconstrucción de la señal periódica usando una serie de Fourier.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
K=10;                      %Número de términos a utilizar en la expansión de series de Fourier.
                           %Puede experimentar qué pasa cuando
                           %K=1,4,10,20,40,100,200.
y_fourier=(A*t_on/T);
for k=1:K
    y_fourier=y_fourier+(A/(pi*k))*((sin(2*pi*(t_on/T)*k)  )*(cos(k*2*pi*t/T)))-(A/(pi*k))*((cos(2*pi*(t_on/T)*k)-1)*(sin(k*2*pi*t/T)));
end
%--------------------------------------------------------------------------

h1 = figure; 
set(gcf, 'color', 'white');  

subplot(3,1,1);
plot(t,mi_funcion(t),'b');     %Grafica la señal aperiódica correspondiente en azul
title('Señal aperiódica.')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,2)
plot(t,y_periodica,'r');       %Grafica la señal periódica en rojo.
titulo=sprintf('Señal periódica con período fundamental T = %3.1f [s].',T);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,3)
plot(t,y_fourier,'k');       %Serie de Fourier truncada en negro.
titulo=sprintf('Reconstrucción de la señal periódica usando la serie trigonométrica de Fourier con K=%d términos.',K);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

hold off
%--------------------------------------------------------------------------


