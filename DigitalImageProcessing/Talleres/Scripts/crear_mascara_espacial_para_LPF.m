% Implementar una función que automáticamente genere las máscaras correspondientes a filtros
% pasobajo tipo promedio, promedio ponderado, y paso bajo Gaussiano, a partir del tamaño de la
% máscara M,N. Donde M y N son enteros impares. Puede asumir que las máscaras se van a utilizar en un
% proceso de correlación (no es necesario rotar la máscara).
%--------------------------------------------------------------------------
function mascara=crear_mascara_espacial_para_LPF(M,N,tipo,varargin)

D = crear_matriz_de_distancia(M,N);

switch tipo
            case 'promedio'            
                 mascara=(1/(M*N))*ones(M,N);
            case 'promedio_ponderado'
                 maximo=max([M N]);
                 mascara=maximo-D;                      %El elemento central con distancia cero tiene el valor más alto, y de allí todos decrecen hasta cero
                 mascara=mascara/(sum(sum(mascara)));   %para normalizar
                 
            case 'Gaussiano'
                 if (nargin==4)
                      D0=varargin{1};
                      mascara=exp((-D.^2)/(2*D0^2));
                      mascara=mascara/(sum(sum(mascara)));   %para normalizar
                 else
                      disp('Ingrese la desviación estándar cuando invoque la función.')    
                 end
                 
    
            otherwise
                disp('Operador incorrecto.')
end
%--------------------------------------------------------------------------