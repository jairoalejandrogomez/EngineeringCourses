%--------------------------------------------------------------------------
%Descripci�n: Esta funci�n permite crear una se�al per�odica con per�odo 
%fundamental T, usando un manejador a una funci�n que describa la funci�n
%en el intervalo [0,T].
%
%Nota 1: y debe ser un manejador a una funci�n que implemente y=f(t).
%--------------------------------------------------------------------------
function [y_periodica]=crear_funcion_periodica(y,T,t)
t2=mod(t,T);            %Residuo despu�s de la divisi�n (operaci�n m�dulo).
y_periodica = y(t2);
%--------------------------------------------------------------------------