%--------------------------------------------------------------------------
% Dise�e una funci�n en Matlab que permita extraer los planos correspondientes a cada bit en una
% imagen de tama�o arbitrario representada en una escala de grises con n bits.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%bit:  va desde 0 hasta n-1.  Donde 0 es el menos significativo

%I2:   Imagen de salida. 
%--------------------------------------------------------------------------
function I2=planos_de_bits(I,bit)
%--------------------------------------------------------------------------
I1=double(I);          %Convierto la imagen de entrada a double. 
I2=[];                 %Defino la variable y la inicializo vac�a. 

for k=0:bit
    I2=rem(I1,2);      %Residuo
    I1=fix(I1/2);      %m�dulo.
end

I2=uint8(I2);          %converi�n a entero sin signo
%--------------------------------------------------------------------------

   


