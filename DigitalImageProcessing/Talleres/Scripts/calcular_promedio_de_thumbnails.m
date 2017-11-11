function IP=calcular_promedio_de_thumbnails(I,M,N)

IP=[]; %Inicializo la matriz de salida. 

I=double(I);   %Esto se hace para evitar problemas de desbordamiento, o problemas con divisiones que puedan dar decimales.

[mI,nI,np]=size(I);   %Dimensiones de la matriz I.

if rem(mI,M)==0 && rem(nI,N)==0    %Esto garantiza que solo se procese la información si los thumbnails caben en la matriz I. 
    
    mT=mI/M;  %Número de filas de un thumbnail.  
    nT=nI/N;  %Número de columnas de un thumbnail.  
    
    num_thumbnails=M*N;
    
    IP=zeros(mT,nT,np);
    
    thumbnail_actual=zeros(mT,nT,np);
    
    for i=0:M-1
        for j=0:N-1
            
            thumbnail_actual=I(i*mT+1:(i+1)*mT,j*nT+1:(j+1)*nT,:);
            IP=IP+thumbnail_actual;
            
        end
    end
    
    IP=IP/num_thumbnails;  %IP es una matriz tipo double
    %IP=uint(IP)           %IP es una matriz tipo entero sin signo.
    
end



