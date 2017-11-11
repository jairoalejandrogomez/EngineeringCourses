%--------------------------------------------------------------------------
% Implemente una funci�n en Matlab que pueda calcular tanto la correlaci�n como la convoluci�n entre
% una imagen y una m�scara de tama�o arbitrario NxN (donde N es un entero impar). La funci�n
% debe retornar bien sea la imagen de salida completa o recortada seg�n lo requiera el usuario.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%h:    La m�scara debe tener NxN elementos
%tipo: 0: correlaci�n, 1: convoluci�n.

%I3:   Imagen de salida.
%--------------------------------------------------------------------------
function I3=correlacion(I,h,tipo)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=[];

[mfilas,ncolumnas]=size(I1);
[mfilas_h,ncolumnas_h]=size(h);

if (mfilas_h==ncolumnas_h) && (rem(mfilas_h,2)==1)   %La m�scara debe ser cuadrada y de dimensiones impares.
    
    N=mfilas_h;
    I3=zeros(mfilas,ncolumnas);   %Inicializo la matriz de salida.
    
    if tipo==0                    %calcule la correlaci�n
        mascara=h;
    else                          %calcule la convoluci�n girando la mascara.
        mascara=flipud(fliplr(h));
    end
    
    nborde=(N-1)/2;
    
    fila_inicial=nborde+1;
    fila_final=nborde+mfilas;
    columna_inicial=nborde+1;
    columna_final=nborde+ncolumnas;
    
    I2=zeros(mfilas+2*nborde,ncolumnas+2*nborde);    %matriz m�s grande que va a contener a la matriz de entrada en su centro.
    I2(fila_inicial:fila_final,columna_inicial:columna_final)=I1;
    
    sub_matriz=zeros(N,N);
    %--------------------------------------------------------------------------
    
    indice_fila=1;
    
    for i=fila_inicial:fila_final
        indice_columna=1;
        for j=columna_inicial:columna_final
            
            %Selecciono la submatriz que queda cubierta por la m�scara.
            sub_matriz=I2(i-nborde:i+nborde,j-nborde:j+nborde);
            
            %ahora multiplico por la m�scara y sumo (filtrado lineal)
            salida=sum(sum(sub_matriz.*mascara));
            
            %Coloco el resultado en la posici�n correspondiente de la matriz de salida.
            I3(indice_fila,indice_columna)=salida;
            indice_columna=indice_columna+1;
        end
        indice_fila=indice_fila+1;
    end
    
else
    disp('La m�scara debe ser cuadrada y de dimensiones impares.')
end



%--------------------------------------------------------------------------


