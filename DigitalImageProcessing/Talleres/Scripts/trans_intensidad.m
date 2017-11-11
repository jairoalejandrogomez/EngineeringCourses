%--------------------------------------------------------------------------
% función en Matlab que toma como argumentos una imagen en escala de grises de tamaño
% arbitrario, y una serie de argumentos variables (usando los comandos:
% varargin, nargin de Matlab) que definen tanto el tipo de función de ajuste a utilizar así como
% los parámetros requeridos por dicha función de ajuste. 
% El cuerpo de la función aplica el ajuste de intensidad a cada pixel de la imagen de entrada.
% La función permite aplicar transformaciones de intensidad lineal, logarítmica, y ley de potencia
% según lo requiera el usuario.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%Tipo: 'lineal':         s= mr+b          ENTONCES parámetro1=m, parámetro2=b
%      'log':            s=c*log10(1+r)   ENTONCES parámetro1=c, 
%      'potencia':       s=c*r^gamma      ENTONCES parámetro1=c, parámetro2=gamma

%I2:   Imagen de salida. 
%--------------------------------------------------------------------------
function I2=trans_intensidad(I,tipo,varargin)
%--------------------------------------------------------------------------

I1=double(I);          %Convierto la imagen de entrada a double.

I2=[];                 %Defino la variable y la inicializo vacía.

switch lower(tipo)
    case 'lineal'         
        
        if nargin==4
            m=varargin{1};    %pendiente
            b=varargin{2};    %corte
            I2=m*I1+b;
        else
            disp('Número incorrecto de parámetros')
        end
            
        
        
    case 'log'
        if nargin==3
            c=varargin{1};    %Constante
            I2=c*log10(1+I1);
        else
            disp('Número incorrecto de parámetros')
        end
        
    case 'potencia'
        
        if nargin==4
            c=varargin{1};     %Constante
            gamma=varargin{2}; %Gamma
            I2=c*I1.^gamma;
        else
            disp('Número incorrecto de parámetros')
        end
            
    otherwise
        disp('Transformación de intensidad desconocida.')
end


