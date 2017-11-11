%--------------------------------------------------------------------------
% Diseñe una función en Matlab que a partir de una imagen de entrada en escala de grises genere la
% imagen correspondiente con el histograma ecualizado.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%Lmax:    número de valores diferentes de intensidades de gris-1, por ejemplo
%      para 8 bits Lmax=255.
%I2:   Imagen de salida con el histograma ecualizado. 
%--------------------------------------------------------------------------
function I2=ecualizar_histograma(I,Lmax)
%--------------------------------------------------------------------------
%Encuentra la transformación para ecualizar el histograma. 
%--------------------------------------------------------------------------

%[histo,r]=histograma(I,1);     %Calcule el histograma normalizado.
[histo,r] =histograma2(I,Lmax,1);  %Calcule el histograma normalizado.

L=Lmax+1;

T=zeros(L,1);

for k=0:L-1
    
    sumatoria=0;
    for j=0:k
        sumatoria=sumatoria+histo(j+1);
    end
    
    T(k+1)=(L-1)*sumatoria;
    
end
%--------------------------------------------------------------------------
%Aplique la transformación.
%--------------------------------------------------------------------------

I1=double(I);          %Convierto la imagen de entrada a double. 
I2=[];                 %Defino la variable y la inicializo vacía. 

[mfilas,ncolumnas]=size(I1); 
for i=1:mfilas
    for j=1:ncolumnas
    I2(i,j)=T(I1(i,j)+1);     %El +1 es por los índices en Matlab.
    end
end

%--------------------------------------------------------------------------