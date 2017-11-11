%--------------------------------------------------------------------------
%Laboratorio #2 de la asignatura "procesamiento digital de imágenes".
%
%Objetivos:  
%   - Leer una imagen a color del disco duro.
%   - Recuperar y mostrar los planos RGB de una imagen a color.
%   - Evaluar el efecto de cada plano en una imagen a color.
%Observación: Este archivo requiere las imágenes 
%"mona_lisa.jpg" y "sydney.jpg".
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
%Lee la imagen de entrada:
%I=imread('sydney.jpg');   
I=imread('mona_lisa.jpg');   
%--------------------------------------------------------------------------

%Determina las filas, columnas, y número de planos de color
[m,n,k]=size(I);

%Extrae el primer plano (R), el segundo plano (G), y el tercer plano (B).
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

I_R=uint8(zeros(m,n,k));   %Crea una imagen negra, y se hace un casting a uint8
I_R(:,:,1)=R;              %Se inserta el plano rojo en el primer plano.

I_G=uint8(zeros(m,n,k));   %Crea una imagen negra, y se hace un casting a uint8
I_G(:,:,2)=G;              %Se inserta el plano verde en el segundo plano.

I_B=uint8(zeros(m,n,k));   %Crea una imagen negra, y se hace un casting a uint8
I_B(:,:,3)=B;              %Se inserta el plano azul en el tercer plano.
%--------------------------------------------------------------------------
h1=figure;                 %Manejador para la primera figura.

%Ahora se recuperan los planos de color.
subplot(2,2,1)
imshow(I)         
title('Imagen de entrada')

subplot(2,2,2)
imshow(R,[0 255]) 
title('Plano R en escala de grises')

subplot(2,2,3)
imshow(G,[0 255]) 
title('Plano G en escala de grises')

subplot(2,2,4)
imshow(B,[0 255])
title('Plano B en escala de grises')
%--------------------------------------------------------------------------
h2=figure;                  %Manejador para la segunda figura.

subplot(2,2,1)
imshow(I)         
title('Imagen de entrada')

subplot(2,2,2)
imshow(I_R)
title('Componente R')

subplot(2,2,3)
imshow(I_G)
title('Componente G')

subplot(2,2,4)
imshow(I_B)
title('Componente B')
%--------------------------------------------------------------------------

%Qué pasaría si se cambia el orden de los planos de color? veamos algunos
%ejemplos:

h3=figure;                  %Manejador para la tercera figura.

I2=uint8(zeros(m,n,k)); 
I2(:,:,1)=B; 
I2(:,:,2)=G;
I2(:,:,3)=R;

I3=uint8(zeros(m,n,k)); 
I3(:,:,1)=R; 
I3(:,:,2)=B;
I3(:,:,3)=G;

I4=uint8(zeros(m,n,k)); 
I4(:,:,1)=G; 
I4(:,:,2)=R;
I4(:,:,3)=B;

subplot(2,2,1)
imshow(I) 
title('[R,G,B]')

subplot(2,2,2)
imshow(I2) 
title('[B,G,R]')

subplot(2,2,3)
imshow(I3) 
title('[R,B,G]')

subplot(2,2,4)
imshow(I4) 
title('[G,R,B]')

%--------------------------------------------------------------------------










