%--------------------------------------------------------------------------
%Descripci�n: Esta funci�n en Matlab genera una se�al como la que se 
%muestra a continuaci�n a partir de un vector de tiempo t suministrado
%por el usuario. 
%
%La funci�n se define como f(t)=1 para -1/2 <= t <= 1/2
%                               0 en cualquier otro caso.
%          ________ 
%         |        |
%         |        | 
% ________|        |__________  t
% 
%--------------------------------------------------------------------------
function y=funcion_rectangular(t)

%Intervalos de inter�s en el tiempo 
%(pueden interpretarse como ventanas rectangulares desplazadas):
t_on = double (( t>= -0.50  ) & ( t<=0.5 ));

%Se�al de salida
y=t_on;
%--------------------------------------------------------------------------