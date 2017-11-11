%--------------------------------------------------------------------------
%Autor:       Dr Jairo Alejandro Gómez.
%Institución: Universidad de San Buenaventura. Cali, Colombia
%Fecha:       Abril 2012.
%--------------------------------------------------------------------------
% Implemente una función en Matlab que tome una imagen en escala de grises y un parámetro de
% entrada h. La función debe retornar bien sea el histograma (si h es igual a 0) o el histograma
% normalizado (si h es igual a 1).
%--------------------------------------------------------------------------
clear all
close all
clc
%--------------------------------------------------------------------------
nombre_imagen_con_extension1='Fig0316(1)(top_left).tif';  %Image to load.
nombre_imagen_con_extension2='Fig0316(2)(2nd_from_top).tif';  %Image to load.
nombre_imagen_con_extension3='Fig0316(3)(third_from_top).tif';  %Image to load.
nombre_imagen_con_extension4='Fig0316(4)(bottom_left).tif';  %Image to load.


I1=imread(nombre_imagen_con_extension1);     %Read image from file
I2=imread(nombre_imagen_con_extension2);     %Read image from file
I3=imread(nombre_imagen_con_extension3);     %Read image from file
I4=imread(nombre_imagen_con_extension4);     %Read image from file
%--------------------------------------------------------------------------

%Escalo las imágenes y la retorno como enteros
I1=escalar_imagen(I1,255,0);
I2=escalar_imagen(I2,255,0);
I3=escalar_imagen(I3,255,0);
I4=escalar_imagen(I4,255,0);

%--------------------------------------------------------------------------
figure
imshow(I1,'InitialMagnification', 'fit')
title('Imagen de entrada 1')

%[h1,r1]=histograma(I1,1);
[h1,r1]=histograma2(I1,255,1);


figure
stem(r1,h1)
axis([0 255 0 inf])
title('Histograma normalizado','FontSize',14);
xlabel('Intensidad de entrada','FontSize',12);
ylabel('Probabilidad','FontSize',12);
set(gcf, 'color', 'white');            %Background color = white.

%--------------------------------------------------------------------------


figure
imshow(I2,'InitialMagnification', 'fit')
title('Imagen de entrada 2')

%[h2,r2]=histograma(I2,1);
[h2,r2]=histograma2(I2,255,1);
figure
stem(r2,h2)
axis([0 255 0 inf])
title('Histograma normalizado','FontSize',14);
xlabel('Intensidad de entrada','FontSize',12);
ylabel('Probabilidad','FontSize',12);
set(gcf, 'color', 'white');            %Background color = white.

%--------------------------------------------------------------------------

figure
imshow(I3,'InitialMagnification', 'fit')
title('Imagen de entrada 3')

%[h3,r3]=histograma(I3,1);
[h3,r3]=histograma2(I3,255,1);
figure
stem(r3,h3)
axis([0 255 0 inf])
title('Histograma normalizado','FontSize',14);
xlabel('Intensidad de entrada','FontSize',12);
ylabel('Probabilidad','FontSize',12);
set(gcf, 'color', 'white');            %Background color = white.

%--------------------------------------------------------------------------

figure
imshow(I4,'InitialMagnification', 'fit')
title('Imagen de entrada 4')

%[h4,r4]=histograma(I4,1);
[h4,r4]=histograma2(I4,255,1);
figure
stem(r4,h4)
axis([0 255 0 inf])
title('Histograma normalizado','FontSize',14);
xlabel('Intensidad de entrada','FontSize',12);
ylabel('Probabilidad','FontSize',12);
set(gcf, 'color', 'white');            %Background color = white.
%--------------------------------------------------------------------------



