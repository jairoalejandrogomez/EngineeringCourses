%--------------------------------------------------------------------------
%Parámetros de entrada.
%--------------------------------------------------------------------------
%I              :  Imagen de entrada.
%H              :  Filtro en frecuencia (se asume que es una matriz real).
%show_plots     :  Si es igual a 1 muestra las imágenes intermedias.
%                  Si es igual a 0 no muestra ninguna imagen intermedia.

%--------------------------------------------------------------------------
%Variable de salida
%--------------------------------------------------------------------------
%I7              :  Imagen de salida filtrada
%--------------------------------------------------------------------------

function I7 = filtrado_en_frec_arbitrario(I0,Hin,show_plots)

[M,N]=size(I0);
[MH,NH]=size(Hin);

P=(M+MH-1);
Q=(N+NH-1);
%--------------------------------------------------------------------------
%Relleno la imagen original con ceros.
I2=zeros(P,Q);
I2(1:M,1:N)=I0;

%--------------------------------------------------------------------------
%Multiplico la imagen por (-1)^(x+y) para que centre el espectro en
%frecuencia. 
I3=aplicar_menos_1_a_la_x_mas_y(I2);

%--------------------------------------------------------------------------
%Aplico la DFT en 2 dimensiones.
F=fft2(I3);
%--------------------------------------------------------------------------

%Ajusto filtro a las dimensiones de salida y literalmente lo centro  !!!!!
H=zeros(P,Q);
u_i=floor((P-MH)/2);    %Fila inicial del filtro.   
v_i=floor((Q-NH)/2);    %Fila final del filtro.
H(u_i:u_i+MH-1,v_i:v_i+NH-1)=Hin; 
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
%Escalar imagen
I7=escalar_imagen(I7,255,0);

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
title(strcat('Imagen de salida final'))

end
%--------------------------------------------------------------------------