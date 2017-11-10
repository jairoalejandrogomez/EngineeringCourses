%--------------------------------------------------------------------------
%Descripción: Esta función en Matlab genera una señal como la que se 
%muestra a continuación a partir de un vector de tiempo t suministrado
%por el usuario. 
%La función f(t) se define para 0 <=   t  <= 1.
%La función f(t) satisface     -1 <= f(t) <= 1.
%El valor máximo de la función es  1 y ocurre cuando t es igual a 0.25. 
%El valor mínimo de la función es -1 y ocurre cuando t es igual a 0.75.
%
%  /\
% /  \
%     \  /
%      \/
%--------------------------------------------------------------------------
function y=senal_de_prueba(t)

%Intervalos de interés en el tiempo 
%(pueden interpretarse como ventanas rectangulares desplazadas):
t1= double ((t>=0   ) & (t<0.25));
t2= double ((t>=0.25) & (t<0.75 ));
t3= double ((t>=0.75) & (t<=1  ));

%Función definida por segmentos. Se implementa usando 
%la multiplicación por ventanas rectangulares de altura 1.
y1 = ( 4*t  ).*t1; 
y2 = (-4*t+2).*t2;
y3 = ( 4*t-4).*t3;

%Señal de salida
y=y1+y2+y3;
%--------------------------------------------------------------------------
