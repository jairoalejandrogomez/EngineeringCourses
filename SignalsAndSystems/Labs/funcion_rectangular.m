%--------------------------------------------------------------------------
%Descripción: Esta función en Matlab genera una señal como la que se 
%muestra a continuación a partir de un vector de tiempo t suministrado
%por el usuario. 
%
%La función se define como f(t)=1 para -1/2 <= t <= 1/2
%                               0 en cualquier otro caso.
%          ________ 
%         |        |
%         |        | 
% ________|        |__________  t
% 
%--------------------------------------------------------------------------
function y=funcion_rectangular(t)

%Intervalos de interés en el tiempo 
%(pueden interpretarse como ventanas rectangulares desplazadas):
t_on = double (( t>= -0.50  ) & ( t<=0.5 ));

%Señal de salida
y=t_on;
%--------------------------------------------------------------------------