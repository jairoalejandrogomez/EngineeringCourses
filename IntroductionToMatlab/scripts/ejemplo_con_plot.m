%-----------------------------------------------------------------------
close all        %Cierra todas las ventanas.
clear all        %Borra todas las variables del workspace.
clc              %Limpia la consola.
%-----------------------------------------------------------------------

x=0:0.5:15;                           %Vector x.
y1=2*x;                           %Vector y1.
y2=0.2*(x.^2);                      %Vector y2.
h1=figure                           %Crea el manejador de la figura
set(gcf,'color','white')            %Define que el fondo sea blanco.
plot(x,y1,'*','color','red');       %Grafique y1 vs x, usando como marcador
                                    %un * rojo.
hold on                             %Mantiene el gráfico actual y todas las 
                                    %propiedades de la figura actual.
plot(x,y2,'color','blue','LineWidth',2);%Grafique y2 vs x, usando una línea 
                                        %continua azul de grosor 2.
hold off                                                                
xlabel('Variable independiente x')  %Texto en el eje "x".
ylabel('Variable dependiente y')    %Texto en el eje "y".
title('Gráfica y vs x')             %Título de la gráfica.
grid on                             %Activa la grilla. 

%-----------------------------------------------------------------------




