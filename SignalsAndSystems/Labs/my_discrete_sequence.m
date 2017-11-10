%--------------------------------------------------------------------------
%Descripción: Esta función en Matlab genera una señal x[n] en tiempo discreto
%a partir de un vector v de longitud N, que está definido para k>=0 y
%k<=(N-1). La señal x[k] es igual a cero para k<0 y para k>(N-1)
%--------------------------------------------------------------------------
function x=my_discrete_sequence(v,n)
N=length(v);           %Longitud de la secuencia v.
x=0*n;                 %Inicializa un vector con las mismas dimensiones que n 

for k=1:length(n)                  %Para todas los índices en n:
    if n(k)>=0 && n(k)<=(N-1)  
       x(k)=v(1+n(k));             %Nota: Recuerde que los índices en Matlab inician en 1 no en 0. 
                                   %Aplique el Look Up Table (LUT)
    else
      x(k)=0;                      %La señal se define en ceros por fuera del intervalo de interés [0,N-1]
    end
end

%--------------------------------------------------------------------------