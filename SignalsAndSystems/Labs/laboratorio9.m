%--------------------------------------------------------------------------
%Laboratorio #9 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivos: 
%   1. Explorar la representaci�n en series de Fourier de una
%      se�al peri�dica en tiempo continuo.
%
%Observaci�n: 
%     Este laboratorio debe ir acompa�ado de los archivos: 
%     crear_funcion_periodica.m
%--------------------------------------------------------------------------
close all                   
clear all                   
clc                         
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Construyendo una se�al peri�dica a partir de una se�al aperi�dica.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
  
%--------------------------------------------------------------------------
%A*[u(t)-u(t-t_on)] Pulso rectangular aperi�dico de amplitud A y tiempo 
%                   en alto t_on.
%--------------------------------------------------------------------------
A         = 1.0;   %Amplitud del pulso
t_on      = 1.0;   %Tiempo en alto del pulso [s]
T         = 2.0;   %Periodo fundamental de la se�al peri�dica correspondiente en [s]. 

mi_funcion=@(t) A*(my_unit_step(t)-my_unit_step(t-t_on));   %Manejador a una funci�n an�nima.

t=0:T/100:10*T;                                             %Definici�n de la variable independiente.
                                                            %Crea un vector fila de tiempo [s].

y_periodica=crear_funcion_periodica(mi_funcion,T,t);        %Genera la se�al per�odica con periodo fundamental T. 
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Reconstrucci�n de la se�al peri�dica usando una serie de Fourier.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
K=10;                      %N�mero de t�rminos a utilizar en la expansi�n de series de Fourier.
                           %Puede experimentar qu� pasa cuando
                           %K=1,4,10,20,40,100,200.
y_fourier=(A*t_on/T);
for k=1:K
    y_fourier=y_fourier+(A/(pi*k))*((sin(2*pi*(t_on/T)*k)  )*(cos(k*2*pi*t/T)))-(A/(pi*k))*((cos(2*pi*(t_on/T)*k)-1)*(sin(k*2*pi*t/T)));
end
%--------------------------------------------------------------------------

h1 = figure; 
set(gcf, 'color', 'white');  

subplot(3,1,1);
plot(t,mi_funcion(t),'b');     %Grafica la se�al aperi�dica correspondiente en azul
title('Se�al aperi�dica.')
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,2)
plot(t,y_periodica,'r');       %Grafica la se�al peri�dica en rojo.
titulo=sprintf('Se�al peri�dica con per�odo fundamental T = %3.1f [s].',T);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,3)
plot(t,y_fourier,'k');       %Serie de Fourier truncada en negro.
titulo=sprintf('Reconstrucci�n de la se�al peri�dica usando la serie trigonom�trica de Fourier con K=%d t�rminos.',K);
title(titulo)
xlabel('Tiempo [s]')
ylabel('Amplitud')
grid on;                   
axis tight

hold off
%--------------------------------------------------------------------------


