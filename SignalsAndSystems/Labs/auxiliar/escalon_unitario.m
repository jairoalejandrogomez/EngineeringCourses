%--------------------------------------------------------------------------
%Descripci�n: Esta funci�n en Matlab genera una se�al escal�n unitario
%a partir de un vector de tiempo t suministrado por el usuario. 
%La funci�n u(t) se define como  u(t)=0 para t<0
%                                u(t)=1 para t>=0
%--------------------------------------------------------------------------
function u=escalon_unitario(t)
u= double (t>=0);
%--------------------------------------------------------------------------