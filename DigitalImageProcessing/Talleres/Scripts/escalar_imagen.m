%--------------------------------------------------------------------------
% función en Matlab que retorna una imagen de salida en una escala de grises de 0 a L-1.
% La imagen de salida puede ser tipo uint o double según lo indique el usuario con un parámetro de
% entrada llamado tipo (si tipo = 0, la intensidad debe entregarse como entero sin signo, si tipo=1, la
% intensidad debe entregarse como doble). La función internamente debe escalar la imagen, y en caso
% que se deba retornar usando enteros sin signo, debe determinar automáticamente si debe usar unit8,
% uint16, uint32, o uint64.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%Vmax: Valor máximo de intensidad (1,3,7,15,31,63,127,255, etc...)
%Tipo: 0: matriz de salida tipo entero sin signo.  1: matriz de salida tipo
%doble.
%I2:   Imagen de salida. 
%--------------------------------------------------------------------------
function I2=escalar_imagen(I,Vmax,tipo)
%--------------------------------------------------------------------------
I1=double(I);          %Convierto la imagen de entrada a double.
minimo=min(min(I1));  %Calculo el mínimo de la intensidad de la imagen de entrada.
I1=I1-minimo;         %Con esto la intensidad queda entre 0 y un valor dado. 
maximo=max(max(I1));  %Calculo el máximo de I1.
if maximo==0          %Este condicional evita una división por cero.
    I1=0*I1;              %Matriz de ceros.
else
    I1=I1/maximo;         %Con esto normalizo la imagen.
end
I1=I1*Vmax;           %Con esto escalo la imagen para que quede entre 0 y Vmax.

%--------------------------------------------------------------------------

n=ceil(log10(Vmax+1)/log10(2));  %Cuántos bits se requieren para codificar Vmax.

if tipo==0               %Retornar como entero sin signo
    
    I2=round(I1);
    
    if (n<=8)
        I2=uint8(I2);
    elseif (n>8) && (n<=16)
        I2=uint16(I2);
    elseif (n>16) && (n<=32)
        I2=uint32(I2);
    elseif (n>32) && (n<=64)
        I2=uint64(I2);
    else
        I2=I1;          %En otro caso déjelo como double.
    end
    
elseif tipo==1          %Retornar como double
    
        I2=I1; %En otro caso déjelo como double.
    
end




