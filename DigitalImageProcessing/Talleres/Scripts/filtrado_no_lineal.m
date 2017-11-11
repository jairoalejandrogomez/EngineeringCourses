%--------------------------------------------------------------------------
% Diseñe una función en Matlab que permita aplicar un operador arbitrario sobre una máscara de tamaño
% n x n a una imagen de entrada en escala de grises. Siendo n un entero impar. Nota: Puede especificar el
% operador en una función auxiliar. Como ejemplos de operadores puede considerar el promedio, la
% desviación estándar, la mediana, el mínimo y el máximo.
%--------------------------------------------------------------------------
%I:        Imagen de entrada
%N:        La máscara tiene NxN elementos
%operador: puede ser   'mean','std','median','min','max','ecualizar_histograma' 
%Lmax:     (2^k)-1, donde k es el número de bits de la imagen. Esto se
%          requiere para ecualización local del histograma


%I3:   Imagen de salida. 
%--------------------------------------------------------------------------
function I3=filtrado_no_lineal(I,N,operador,varargin)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.

[mfilas,ncolumnas]=size(I1);

I3=zeros(mfilas,ncolumnas);   %matriz de salida

nborde=(N-1)/2;

I2=zeros(mfilas+2*nborde,ncolumnas+2*nborde);    %matriz más grande que va a contener a la matriz de entrada en su centro. 
sub_matriz=zeros(N,N); 

fila_inicial=nborde+1;
fila_final=nborde+mfilas;

columna_inicial=nborde+1;
columna_final=nborde+ncolumnas;

I2(fila_inicial:fila_final,columna_inicial:columna_final)=I1;
%--------------------------------------------------------------------------

indice_fila=1;

for i=fila_inicial:fila_final
    
    indice_columna=1;
    
    for j=columna_inicial:columna_final
        
        %Selecciono la submatriz que queda cubierta por la máscara.
        sub_matriz=I2(i-nborde:i+nborde,j-nborde:j+nborde);
        
        %ahora aplico el operador correcto...
        
        salida=0;
        switch operador
            case 'mean'
                salida=mean2(sub_matriz);
            case 'std'
                salida=std2(sub_matriz);
            case 'median'
                temp=reshape(sub_matriz,N*N,1);  %Convierte la matriz a un vector. También se había podido utilizar temp=sub_matriz(:)
                salida=median(temp);
            case 'min'
                salida=min(min(sub_matriz));
            case 'max'
                salida=max(max(sub_matriz));
            case 'ecualizar_histograma'
                %disp(num2str((indice_fila/mfilas)*100))
                %disp(num2str((indice_columna/ncolumnas)*100))
                
                if nargin==4
                    Lmax=varargin{1};
                    temp=ecualizar_histograma(sub_matriz,Lmax);
                    salida=temp(nborde+1,nborde+1);  %Para recuperar el pixel central de la matriz que se retornó.
                else
                    disp('Ingrese Lmax.')
                end
                               
            otherwise
                disp('Operador incorrecto.')
        end
        
        %Coloco el resultado en la posición correspondiente de la matriz de salida.
        I3(indice_fila,indice_columna)=salida;
        
        
        indice_columna=indice_columna+1;
        
    end
    
    indice_fila=indice_fila+1;
    
end

%--------------------------------------------------------------------------


