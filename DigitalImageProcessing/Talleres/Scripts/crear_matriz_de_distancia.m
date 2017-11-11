%--------------------------------------------------------------------------
%Descripción: Esta función calcula una matriz de salida de dimensiones PxQ
%que contiene en cada elemento la distancia al centro de la matriz. 
%--------------------------------------------------------------------------
%Parámetros de entrada.
%--------------------------------------------------------------------------
%P              :  Número de filas.
%Q              :  Número de columnas.
%--------------------------------------------------------------------------
%Variable de salida
%--------------------------------------------------------------------------
%D              :  Matriz de salida que contiene la distancia de cada
%                  elemento al centro de la matriz. 
%--------------------------------------------------------------------------

function D = crear_matriz_de_distancia(P,Q)

D=zeros(P,Q);

%El floor en las siguientes dos líneas es para garantizar que la distancia
%que se coloca en el pixel central sea cero.
Pmedios=floor(P/2);
Qmedios=floor(Q/2);

for u=0:P-1
    
   for v=0:Q-1
    
       D(u+1,v+1)=sqrt((u-Pmedios)^2+(v-Qmedios)^2);
       
   end
       
end


