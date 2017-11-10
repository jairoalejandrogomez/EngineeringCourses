%--------------------------------------------------------------------------
%Descripción: Esta función permite encontrar el componente par e impar de cualquier
%función y, definida sobre el vector de tiempo t.
%
%Nota 1: y debe ser un manejador a una función que implemente y=f(t).
%Nota 2: y=y_par+y_impar
%--------------------------------------------------------------------------
function [y_par,y_impar]=obtener_componente_par_e_impar_de_una_funcion(y,t)
y_par   = (1/2)*(y(t)+y(-t));
y_impar = (1/2)*(y(t)-y(-t));
%--------------------------------------------------------------------------


