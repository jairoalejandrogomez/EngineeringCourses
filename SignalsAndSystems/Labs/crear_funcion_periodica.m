%--------------------------------------------------------------------------
%Descripción: Esta función permite crear una señal períodica con período 
%fundamental T, usando un manejador a una función que describa la función
%en el intervalo [0,T].
%
%Nota 1: y debe ser un manejador a una función que implemente y=f(t).
%--------------------------------------------------------------------------
function [y_periodica]=crear_funcion_periodica(y,T,t)
t2=mod(t,T);            %Residuo después de la división (operación módulo).
y_periodica = y(t2);
%--------------------------------------------------------------------------