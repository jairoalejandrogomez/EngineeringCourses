%--------------------------------------------------------------------------
%Laboratorio #8 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Comprender los procesos involucrados en el cálculo de la 
%      convolución entre dos señales.
%
%Observación: 
%     Este laboratorio debe ir acompañado de los archivos: 
%     my_signal_lab3.m
%     funcion_rectangular.m
%--------------------------------------------------------------------------
close all                   %Cierra todas las ventanas.
clear all                   %Borra todas las variables.
clc                         %Limpia la consola.
%--------------------------------------------------------------------------
%Graficando las señales de entrada.
%--------------------------------------------------------------------------
h2 = figure;
set(gcf, 'color', 'white');
title('Pasos intermedios en la convolución.')

min_t    =-2.5;                       %tiempo mínimo en el que se va a calcular y(t)
max_t    =2.5;                        %tiempo máximo en el que se va a calcular y(t)
delta_tao=  0.01;
tao      = min_t:delta_tao:max_t;     %Vector de tiempo 

x=funcion_rectangular(tao);  
h=my_signal_lab3(tao); 

h1 = figure; 
set(gcf, 'color', 'white');   
            
subplot(4,1,1)
hold on
plot(tao,x,'b')
plot(tao,h,'r')
legend('x(t)','h(t)')
title('Visualización de la convolución entre dos señales.')
ylabel('Amplitud')
grid on;
axis([min_t max_t -1 1])  %límites mínimos y máximos de los ejes "x" e "y" respectivamente.
hold off
%--------------------------------------------------------------------------
%Graficando las señales intermedias y de salida
%--------------------------------------------------------------------------

indice=1;     %índice para crear la animación.

for t=min_t:delta_tao:max_t      %Valor del tiempo [s] en el que se quiere 
                                 %calcular y(t), donde: 
                                 %y(t) = x(t) convolucionado con h(t)
    %----------------------------------------------------------------------                    
    x=funcion_rectangular(tao);   
    h=my_signal_lab3(t-tao);  
    x_prod_h   = x.*h;                         %Esta señal es la que se debe integrar para obtener la convolución de x con h.
    
    y(1,indice)     = delta_tao*sum(x_prod_h); %Aproximación númérica de la integral
    t_aux(1,indice) = t; 
    %----------------------------------------------------------------------

    subplot(4,1,2)
    plot(tao,x,'b')
    hold on
    plot(tao,h,'r')
    ylabel('Amplitud')
    grid on;
    axis([min_t max_t -1 1])           %límites mínimos y máximos de los ejes "x" e "y" respectivamente.
    legend('x(tao)','h(t-tao)')
    hold off
    
    subplot(4,1,3)
    plot(tao,x_prod_h,'m')             %Línea de color magenta.
    legend('x(tao){\times}h(t-tao)')
    grid on;
    axis([min_t max_t -1 1])           %límites mínimos y máximos de los ejes "x" e "y" respectivamente.
    ylabel('Amplitud')
    
    subplot(4,1,4)
    plot( t_aux,y,'g')                 %Línea de color verde.
    legend('y(t)')
    grid on;
    axis([min_t max_t -1 1])           %límites mínimos y máximos de los ejes "x" e "y" respectivamente.
    xlabel('Tiempo [s]')
    ylabel('Amplitud')
        
    %----------------------------------------------------------------------
    pause(0.0001);                     %Esto pausa permite que se vea la animación.
    
    %----------------------------------------------------------------------
    indice=indice+1;
    
    %----------------------------------------------------------------------
end

%--------------------------------------------------------------------------
