%--------------------------------------------------------------------------
% Implemente una función en Matlab que pueda calcular tanto la correlación como la convolución entre
% una imagen y una máscara de tamaño arbitrario NxN (donde N es un entero impar). La función
% debe retornar bien sea la imagen de salida completa o recortada según lo requiera el usuario.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%h:    La máscara debe tener NxN elementos
%tipo: 0: correlación, 1: convolución.

%I3:   Imagen de salida.
%--------------------------------------------------------------------------
function I3=correlacion(I,h,tipo)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];

[mfilas,ncolumnas]=size(I1);
[mfilas_h,ncolumnas_h]=size(h);

if (mfilas_h==ncolumnas_h) && (rem(mfilas_h,2)==1)   %La máscara debe ser cuadrada y de dimensiones impares.
    
    N=mfilas_h;
    I3=zeros(mfilas,ncolumnas);   %Inicializo la matriz de salida.
    
    if tipo==0                    %calcule la correlación
        mascara=h;
    else                          %calcule la convolución girando la mascara.
        mascara=flipud(fliplr(h));
    end
    
    nborde=(N-1)/2;
    
    fila_inicial=nborde+1;
    fila_final=nborde+mfilas;
    columna_inicial=nborde+1;
    columna_final=nborde+ncolumnas;
    
    I2=zeros(mfilas+2*nborde,ncolumnas+2*nborde);    %matriz más grande que va a contener a la matriz de entrada en su centro.
    I2(fila_inicial:fila_final,columna_inicial:columna_final)=I1;
    
    sub_matriz=zeros(N,N);
    %--------------------------------------------------------------------------
    
    indice_fila=1;
    
    for i=fila_inicial:fila_final
        indice_columna=1;
        for j=columna_inicial:columna_final
            
            %Selecciono la submatriz que queda cubierta por la máscara.
            sub_matriz=I2(i-nborde:i+nborde,j-nborde:j+nborde);
            
            %ahora multiplico por la máscara y sumo (filtrado lineal)
            salida=sum(sum(sub_matriz.*mascara));
            
            %Coloco el resultado en la posición correspondiente de la matriz de salida.
            I3(indice_fila,indice_columna)=salida;
            indice_columna=indice_columna+1;
        end
        indice_fila=indice_fila+1;
    end
    
else
    disp('La máscara debe ser cuadrada y de dimensiones impares.')
end



%--------------------------------------------------------------------------


