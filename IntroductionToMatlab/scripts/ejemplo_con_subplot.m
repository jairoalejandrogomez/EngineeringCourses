close all        %Cierra todas las ventanas.
clear all        %Borra todas las variables del workspace.
clc              %Limpia la consola.
x=0:0.5:15;                         %Vector x.
y1=2*x;                             %Vector y1.
y2=0.2*(x.^2);                      %Vector y2.
h1=figure                           %Crea el manejador de la figura
set(gcf,'color','white')            %Define que el fondo sea blanco.
%-----------------------------------------------------------------------
subplot(2,1,1)                 %Dividir la ventana en 2 filas y una columna
                               %y activar la primera ventana
plot(x,y1,'*','color','red');  %Grafique y1 vs x, usando como marcador
                               %un * rojo.
xlabel('x')                             %Texto en el eje "x".
ylabel('y_1')                           %Texto en el eje "y1".                                    
title('Gráfica y_1 vs x','FontSize',14) %Título de la gráfica.
grid on                                 %Activa la grilla.      
%-----------------------------------------------------------------------
subplot(2,1,2)                          %Activar la segunda ventana.    
plot(x,y2,'color','blue','LineWidth',2);%Grafique y2 vs x, usando una línea 
                                        %continua azul de grosor 2.
xlabel('x')                             %Texto en el eje "x".
ylabel('y_2')                           %Texto en el eje "y1".                                       
title('Gráfica y_2 vs x','FontSize',14) %Título de la gráfica.
grid on                                 %Activa la grilla.    
%-----------------------------------------------------------------------





