%--------------------------------------------------------------------------
%Descripción: Esta función en Matlab genera una señal escalón unitario
%a partir de un vector de tiempo t suministrado por el usuario. 
%La función u(t) se define como  u(t)=0 para t<0
%                                u(t)=1 para t>=0
%--------------------------------------------------------------------------
function u=escalon_unitario(t)
u= double (t>=0);
%--------------------------------------------------------------------------