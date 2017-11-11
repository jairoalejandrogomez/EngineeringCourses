%--------------------------------------------------------------------------
% funci�n en Matlab que toma como argumentos una imagen en escala de grises de tama�o
% arbitrario, y una serie de argumentos variables (usando los comandos:
% varargin, nargin de Matlab) que definen tanto el tipo de funci�n de ajuste a utilizar as� como
% los par�metros requeridos por dicha funci�n de ajuste. 
% El cuerpo de la funci�n aplica el ajuste de intensidad a cada pixel de la imagen de entrada.
% La funci�n permite aplicar transformaciones de intensidad lineal, logar�tmica, y ley de potencia
% seg�n lo requiera el usuario.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%Tipo: 'lineal':         s= mr+b          ENTONCES par�metro1=m, par�metro2=b
%      'log':            s=c*log10(1+r)   ENTONCES par�metro1=c, 
%      'potencia':       s=c*r^gamma      ENTONCES par�metro1=c, par�metro2=gamma

%I2:   Imagen de salida. 
%--------------------------------------------------------------------------
function I2=trans_intensidad(I,tipo,varargin)
%--------------------------------------------------------------------------

I1=double(I);          %Convierto la imagen de entrada a double.

I2=[];                 %Defino la variable y la inicializo vac�a.

switch lower(tipo)
    case 'lineal'         
        
        if nargin==4
            m=varargin{1};    %pendiente
            b=varargin{2};    %corte
            I2=m*I1+b;
        else
            disp('N�mero incorrecto de par�metros')
        end
            
        
        
    case 'log'
        if nargin==3
            c=varargin{1};    %Constante
            I2=c*log10(1+I1);
        else
            disp('N�mero incorrecto de par�metros')
        end
        
    case 'potencia'
        
        if nargin==4
            c=varargin{1};     %Constante
            gamma=varargin{2}; %Gamma
            I2=c*I1.^gamma;
        else
            disp('N�mero incorrecto de par�metros')
        end
            
    otherwise
        disp('Transformaci�n de intensidad desconocida.')
end


