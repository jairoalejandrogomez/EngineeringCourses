%--------------------------------------------------------------------------
%Descripci�n: Esta funci�n en Matlab genera una se�al x[n] en tiempo discreto
%a partir de un vector v de longitud N, que est� definido para k>=0 y
%k<=(N-1). La se�al x[k] es igual a cero para k<0 y para k>(N-1)
%--------------------------------------------------------------------------
function x=my_discrete_sequence(v,n)
N=length(v);           %Longitud de la secuencia v.
x=0*n;                 %Inicializa un vector con las mismas dimensiones que n 

for k=1:length(n)                  %Para todas los �ndices en n:
    if n(k)>=0 && n(k)<=(N-1)  
       x(k)=v(1+n(k));             %Nota: Recuerde que los �ndices en Matlab inician en 1 no en 0. 
                                   %Aplique el Look Up Table (LUT)
    else
      x(k)=0;                      %La se�al se define en ceros por fuera del intervalo de inter�s [0,N-1]
    end
end

%--------------------------------------------------------------------------