%--------------------------------------------------------------------------
%Descripci�n: Esta funci�n en Matlab genera una se�al como la que se 
%muestra a continuaci�n a partir de un vector de tiempo t suministrado
%por el usuario. 
%La funci�n f(t) se define para 0 <=   t  <= 1.
%La funci�n f(t) satisface     -1 <= f(t) <= 1.
%El valor m�ximo de la funci�n es  1 y ocurre cuando t es igual a 0.25. 
%El valor m�nimo de la funci�n es -1 y ocurre cuando t es igual a 0.75.
%
%  /\
% /  \
%     \  /
%      \/
%--------------------------------------------------------------------------
function y=senal_de_prueba(t)

%Intervalos de inter�s en el tiempo 
%(pueden interpretarse como ventanas rectangulares desplazadas):
t1= double ((t>=0   ) & (t<0.25));
t2= double ((t>=0.25) & (t<0.75 ));
t3= double ((t>=0.75) & (t<=1  ));

%Funci�n definida por segmentos. Se implementa usando 
%la multiplicaci�n por ventanas rectangulares de altura 1.
y1 = ( 4*t  ).*t1; 
y2 = (-4*t+2).*t2;
y3 = ( 4*t-4).*t3;

%Se�al de salida
y=y1+y2+y3;
%--------------------------------------------------------------------------
