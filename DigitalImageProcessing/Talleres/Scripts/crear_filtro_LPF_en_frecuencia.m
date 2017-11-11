%--------------------------------------------------------------------------
%Parámetros de entrada.
%--------------------------------------------------------------------------
%P              :  Número de filas.
%Q              :  Número de columnas.
%D0             :  Frecuencia de corte del filtro, para todos los LPF
%tipo
%         'ILPF':  Filtro paso bajo ideal.
%         'BLPF':  Filtro paso bajo Butterworth.
%         'GLPF':  Filtro paso bajo Gaussiano.
%--------------------------------------------------------------------------
%Variable de salida
%--------------------------------------------------------------------------
%H              :  Matriz de salida que contiene el filtro LPF en frecuencia espacial.         
%--------------------------------------------------------------------------

function H = crear_filtro_LPF_en_frecuencia(P,Q,D0,tipo,varargin)

H=zeros(P,Q);

D = crear_matriz_de_distancia(P,Q);   %Esta función calcula una matriz de salida de dimensiones PxQ
                                      %que contiene en cada elemento la distancia al centro de la matriz.
        
switch    (tipo)
        
          case 'ILPF'   %Filtro ideal
        
                for u=0:P-1
                                         
                   for v=0:Q-1
                                              
                                              
                       if D(u+1,v+1)<=D0
                          H(u+1,v+1)=1;
                       end
                   end
                                          
                end
              
          case 'BLPF'   %Filtro Butterworth
            
                if nargin==5
                    
                   n=varargin{5-4};   %orden del filtro
                   H=1./(1+(D/D0).^(2*n));
                else
                   disp('Debe ingresar el orden del filtro') 
                end
                
                
          case 'GLPF'   %Filtro Gaussiano
                H=exp((-D.^2)/(2*D0^2));
              
       otherwise
end   
%--------------------------------------------------------------------------