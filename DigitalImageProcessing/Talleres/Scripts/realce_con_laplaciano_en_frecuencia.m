%--------------------------------------------------------------------------
%Parámetros de entrada.
%--------------------------------------------------------------------------
%I              :  Imagen de entrada.
%show_plots     :  Si es igual a 1 muestra las imágenes intermedias.
%                  Si es igual a 0 no muestra ninguna imagen intermedia.
%--------------------------------------------------------------------------
%Variable de salida
%--------------------------------------------------------------------------
%I7              :  Imagen de salida filtrada
%--------------------------------------------------------------------------

function Isalida=realce_con_laplaciano_en_frecuencia(I0,show_plots)

[M,N]=size(I0);

P=2*M;
Q=2*N;

%--------------------------------------------------------------------------
%Escalo la imagen de entrada a [0,1]
Iescalado=escalar_imagen(I0,1,1);

%--------------------------------------------------------------------------
%Relleno la imagen original con ceros.
I2=zeros(P,Q);
I2(1:M,1:N)=Iescalado;

%--------------------------------------------------------------------------
%Multiplico la imagen por (-1)^(x+y) para que centre el espectro en
%frecuencia. 
I3=aplicar_menos_1_a_la_x_mas_y(I2);

%--------------------------------------------------------------------------
%Aplico la DFT en 2 dimensiones.
F=fft2(I3);
%--------------------------------------------------------------------------

%Ajusto filtro a las dimensiones de salida 
H=laplaciano_en_frecuencia(P,Q);

%--------------------------------------------------------------------------
%Filtro en frecuencia. 
F_filt=F.*H;

%--------------------------------------------------------------------------
%Imagen en el dominio espacial
I4=ifft2(F_filt);

%--------------------------------------------------------------------------
%Recupere solo los valores reales y enteros. 
I5=round(real(I4));

%--------------------------------------------------------------------------
%Multiplico la imagen por (-1)^(x+y) para volver a organizar el espectro.
I6=aplicar_menos_1_a_la_x_mas_y(I5);

%--------------------------------------------------------------------------
%Recuper la porción superior izquierda (es decir remover los ceros). 
I7=I6(1:M,1:N);
%--------------------------------------------------------------------------
%Escalar el laplaciano a [-1,1] 
maxI7=max(max(abs(I7)));
laplaciano_escalado=double( I7/maxI7);

%--------------------------------------------------------------------------
%Realce con el Laplaciano

c=-1; %Nota:  si c es igual a -1, las regiones negras de la imagen de entrada no se van a ver negras en la imagen de salida final.
              %A medida que c se acerca a cero, la importancia relativa del
              %Laplaciano disiminuye pero los negros se conservan. 
I8=double(Iescalado)+c*laplaciano_escalado;

%--------------------------------------------------------------------------
%Escale la imagen de salida al mismo nivel de intensidad que la imagen de
%entrada. 

Isalida=escalar_imagen(I8,255,0);

%--------------------------------------------------------------------------


%Grafique
if show_plots==1    %Muestre las imágenes intermedias.

figure
imshow(I0,'InitialMagnification', 'fit')
title('Imagen de entrada')

figure
imshow(I2,[],'InitialMagnification', 'fit')
title('Imagen con zero padding')

figure
imshow(I3,[],'InitialMagnification', 'fit')
title('Imagen con zero padding multiplicada por (-1)^{(x+y)}')

figure
imshow(log10(1+abs(F)),[],'InitialMagnification', 'fit')
title('Espectro de magnitud en escala logarítmica')

figure
imshow(H,[],'InitialMagnification', 'fit')
title('Respuesta del filtro')

figure
imshow(log10(1+abs(F_filt)),[],'InitialMagnification', 'fit')
title('Espectro de magnitud en escala logarítmica de la imagen filtrada en frecuencia')

figure
imshow(I5,[],'InitialMagnification', 'fit')
title('Imagen de salida con valores REALES y ENTEROS')

figure
imshow(I6,[],'InitialMagnification', 'fit')
title('Imagen de salida luego de multiplicar la anterior por (-1)^{(x+y)}')

figure
imshow(I7,[],'InitialMagnification', 'fit')
title(strcat('Laplaciano escalado a [-1,1]'))

figure
imshow(Isalida,[],'InitialMagnification', 'fit')
title(strcat('Imagen luego del realce con el Laplaciano en frecuencia.'))

end
%--------------------------------------------------------------------------