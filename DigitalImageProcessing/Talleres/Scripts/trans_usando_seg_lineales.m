%--------------------------------------------------------------------------
% Funci�n en Matlab que toma como argumentos una imagen en escala de grises de tama�o
% arbitrario y una matriz entera de la forma M=[x y], donde x e y son vectores columna. Cada fila de la
% matriz M corresponde a los valores de intensidad de entrada y salida que especifican los puntos de
% inter�s de una transformaci�n de intensidad definida por segmentos lineales. Nota: El primer valor del
% vector x debe ser 0 y el �ltimo valor del vector x debe ser L-1.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%M:    matriz entera de la forma M=[vector_columna_x vector_columna_y]

%I2:   Imagen de salida. 
%--------------------------------------------------------------------------
function I2=trans_usando_seg_lineales(I,M)
%--------------------------------------------------------------------------
%C�LCULO DEL "LOOK UP TABLE" A PARTIR DE LOS PUNTOS QUE DEFINEN LOS
%SEGMENTOS LINEALES
%--------------------------------------------------------------------------
npuntos=size(M,1);     %N�mero de puntos de la matriz M.
max_intensidad_entrada=max(max(I));

if npuntos==0 || npuntos==1 || M(1,1)~=0 || M(npuntos,1)<max_intensidad_entrada
    disp('Transformaci�n de intensidad desconocida.')
else
    
    T=zeros(max_intensidad_entrada+1,1);   %Look up table. El +1 es por los �ndices en Matlab.

    
    for i=1:npuntos-1
            
        j=i+1;
        
        
            %Coordenadas del primer punto (x0,y1) y del segundo punto (x1,y1)
            %de cada segmento.
            x0=M(i,1);
            y0=M(i,2);
                        
            x1=M(j,1);
            y1=M(j,2);
       
            if x0~=x1                %Si no es una recta vertical
                m=(y1-y0)/(x1-x0);
                b=y0-m*x0;
                
                for k=x0:x1
                T(k+1)=m*k+b;
                end
                
            else                     %Si es una recta vertical
               T(x0)=y0; 
                
            end
    end
end

%T
%--------------------------------------------------------------------------
%APLICACI�N DEL LOOK UP TABLE
%--------------------------------------------------------------------------
I1=double(I);          %Convierto la imagen de entrada a double. 
I2=[];                 %Defino la variable y la inicializo vac�a. 

[mfilas,ncolumnas]=size(I1); 
for i=1:mfilas
    for j=1:ncolumnas
    I2(i,j)=T(I1(i,j)+1);     %El +1 es por los �ndices en Matlab.
    end
end
%--------------------------------------------------------------------------


