%--------------------------------------------------------------------------
% Diseñe una función en Matlab que a partir de una imagen de entrada y un histograma normalizado
% deseado de salida, aplique el algoritmo de especificación del histograma y genere la imagen de salida
% correspondiente.
%--------------------------------------------------------------------------
%I:              Imagen de entrada
%Lmax:           Número de valores diferentes de intensidades de gris - 1, 
%                Por ejemplo para 8 bits Lmax=255.
%h_norm_deseado: Histograma normalizado deseado 
%--------------------------------------------------------------------------
%I2:   Imagen de salida con el histograma ecualizado. 
%--------------------------------------------------------------------------
function I2=especificacion_del_histograma(I,Lmax,h_norm_deseado)
%--------------------------------------------------------------------------
%Calcule el histograma normalizado de la imagen de entrada.
%--------------------------------------------------------------------------
[histo,r_histo] =histograma2(I,Lmax,1);  


%--------------------------------------------------------------------------
%Calcule T(r) "ecualización del histograma".
%--------------------------------------------------------------------------
L=Lmax+1;

T=zeros(L,1);

for k=0:L-1
    
    sumatoria=0;
    for j=0:k
        sumatoria=sumatoria+histo(j+1);
    end
    
    T(k+1)=(L-1)*sumatoria;
    
end

%Se redondea T(r) a los valores enteros 
T=round(T);

figure
stem(T);
title('Mapeo de ecualización del histograma');

%--------------------------------------------------------------------------
%Calcule G(z) "ecualización del histograma".
%--------------------------------------------------------------------------

G=zeros(L,1);

for k=0:L-1
    
    sumatoria=0;
    for j=0:k
        sumatoria=sumatoria+h_norm_deseado(j+1);
    end
    
    G(k+1)=(L-1)*sumatoria;
    
end

%Se redondea G(z) a los valores enteros 
G=round(G);
%--------------------------------------------------------------------------
%Calcule la inversa de G(z)
%--------------------------------------------------------------------------

myconst=-1;          %Se sabe que este valor no aparecería normalmente en el lookuptable, por eso se escogió.
G_inverse=myconst*ones(L,1);

for z=0:L-1
    G_inverse(G(z+1)+1,1)=z;    %El +1 es por los índices de Matlab.
end

figure
stem(G);
hold on
stem(G_inverse,'r');
hold off
legend('G(z)','G^{-1}(z)')
title('Mapeo de G y de la inversa de G, CON vacíos');
%--------------------------------------------------------------------------

%Debido a la forma en que se implementó el mapeo anterior, algunos valores
%de la inversa de G van a quedar sin valor (con -1), por ello se hace el siguiente
%procedimiento
a=find(G_inverse==myconst);   %Encuentre los índices de aquellas posiciones donde NO se pudo hacer el mapeo inverso

b=find(G_inverse ~=myconst);  %Encuentre los índices de aquellas posiciones donde SI se pudo hacer el mapeo inverso


na=length(a);
nb=length(b);

matrix_distancia=zeros(na,nb);

vector_con_indices_de_vecino_cercano=zeros(na,1);

for i=1:na
    
    distancia_minima=inf;
    
    for j=1:nb
        
        matrix_distancia(i,j)=abs(a(i)-b(j));                               %Calcule la distancia a todos los puntos donde hay información
        
        if (matrix_distancia(i,j)<distancia_minima)
            distancia_minima=matrix_distancia(i,j);
            vector_con_indices_de_vecino_cercano(i,1)=b(j);                 %Encuentra el índice del vecino más cercano que contiene información.
        end
        
    end
    
    G_inverse( a(i) )=G_inverse(vector_con_indices_de_vecino_cercano(i,1));  %Llene los valores de intensidad donde no se había podido hacer la transformación inversa. 
end


figure
stem(G);
hold on
stem(G_inverse,'r');
hold off
legend('G(z)','G^{-1}(z)')
title('Mapeo de G y de la inversa de G,  SIN vacíos');

%--------------------------------------------------------------------------
%Aplique G_inverse a T(r)
%--------------------------------------------------------------------------

mapeo_final=zeros(L,1);

for r=0:L-1
    indice_T    =T(r+1,1);                           %El más 1 es por los índices de Matlab.
    intensidad_de_salida=G_inverse(indice_T+1);      %El más 1 es por los índices de Matlab.
    mapeo_final(r+1,1)=intensidad_de_salida;         %El más 1 es por los índices de Matlab.
end

figure
stem(mapeo_final);
title('Mapeo final');

%--------------------------------------------------------------------------
%Aplique La transformación anterior a la imagen de entrada.
%--------------------------------------------------------------------------
 
[M,N]=size(I);
I2=zeros(M,N);  %Inicializo la imagen de salida. 

for i=1:M
    
    for j=1:N

        r=I(i,j);
        I2(i,j)=mapeo_final(r+1,1); %El más 1 es por los índices de Matlab.
        
    end
    
end

%--------------------------------------------------------------------------
%Verificación
%--------------------------------------------------------------------------

[histo_salida,r_histo_salida] =histograma2(I2,Lmax,1);



figure
stem(h_norm_deseado);
hold on
stem(histo_salida,'r');
hold off
legend('histograma normalizado deseado','histograma normalizado de salida')
title('Histograma normalizado deseado y de salida');

%--------------------------------------------------------------------------


