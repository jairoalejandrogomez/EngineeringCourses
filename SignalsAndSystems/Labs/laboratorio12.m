%--------------------------------------------------------------------------
%Laboratorio #12 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivo: 
%   1. Filtrar una señal de audio en el dominio de la frecuencia.
%--------------------------------------------------------------------------
close all
clear all
clc
% %--------------------------------------------------------------------------
% %Cómo grabar audio en Matlab y almacenarlo en un archivo .wav?
% %--------------------------------------------------------------------------
% num_canales=2;                          %1: mono. 2: estéreo.
% fs=48000;                               %Frecuencia de muestreo [Hz].
% num_bits=16;                            %Número de bits para cuantizar la amplitud.
% tiempo_de_grabacion=3;                  %Tiempo en [s]
% objeto_de_grabacion=audiorecorder(fs,num_bits,num_canales);
% disp('Comience a hablar.')
% recordblocking(objeto_de_grabacion,tiempo_de_grabacion);
% disp('Fin de la grabación.');
% x = getaudiodata(objeto_de_grabacion);  %Extrae los datos del objeto
% audiowrite('audio_lab13.wav',x,fs)

%--------------------------------------------------------------------------
%Cómo leer un archivo de audio?
%--------------------------------------------------------------------------
[x,fs] = audioread('audio_lab13.wav'); %Se Lee la señal de audio y guarda la frecuencia de muestreo en Hz.
[n, num_canales]=size(x);              %Se determina el número de muestras y el de canales (1: mono, 2: estéreo)
                                       %Si es estéreo la primera columna en Matlab contiene el canal izquierdo, 
                                       %y la segunda columna contiene el canal derecho
ts=1/fs;                               %Período de muestreo.
t=(ts*(0:1:(n-1))).';                  %Vector de tiempo.


w=(((0:(n-1))/n)*2*pi).';              %Vector de frecuencia [rad]

%--------------------------------------------------------------------------
%Cómo visualizar el audio
%--------------------------------------------------------------------------
h1=figure;
set(gcf,'color','white')
subplot(2,1,1)
plot(t,x(:,1))
axis tight
title('Canal 1 de la señal de entrada (canal izquierdo).')
grid on
subplot(2,1,2)
plot(t,x(:,2))
axis tight
title('Canal 2 de la señal de entrada (canal derecho).')
xlabel('Tiempo [s].')
ylabel('Amplitud')
grid on


%--------------------------------------------------------------------------
%Respuesta en frecuencia del audio.
%--------------------------------------------------------------------------
X_fourier=fft(x,[],1);                 %Calcule la FFT sobre las filas (es decir sobre las muestras) para cada cada canal (columna).

%--------------------------------------------------------------------------
%Cómo crear un filtro arbitrario?
%--------------------------------------------------------------------------
frec_norm=((0:1:n-1)/n).';                                  %Vector de frecuencias normalizadas entre [0,1)
indices_mask1=find(frec_norm<=0.5);                         %Encuentre los índices para los cuales la frecuencia normalizada está entre 0 y 0.5
%Opción1: (filtro paso bajo)
wc=0.25;                                                    %Frecuencia de corte en [rad]
parte1_filtro=1./((j*w(indices_mask1)/wc).^2+1.4142*(j*w(indices_mask1)/wc)+1); %Filtro paso bajo tipo Butterworth de segundo orden: https://en.wikipedia.org/wiki/Butterworth_filter
%Tarea: explore y aplique otros filtros (por ejemplo: Chebyshev, Bessel, Butterworth de diferente orden, etc)   
parte2_filtro=flipud(parte1_filtro);                        %Porción del filtro correspondiente a las frecuencias normalizadas entre 0.5 y 1.
parte2_filtro=parte2_filtro(2:end-1);                       %Se elimina el último componente correspondiente a la frecuencia noramlizada 1.
mi_filtro = [parte1_filtro;                                 %Se concatenan las dos partes del filtro 
             parte2_filtro];

%Opción2: (eco)
% atenuacion_de_eco=0.5;
% t_eco=0.8;                                                %Tiempo de eco [s].
% n_eco=t_eco*fs;                                           %número de muestras correspondientes al retraso del eco.
% mi_filtro=( 1+atenuacion_de_eco*exp(-sqrt(-1)*w*n_eco) ); %Filtro no centrado en el dominio de la frecuencia.
                  
h2=figure;
subplot(2,1,1)
plot(w,20*log10(abs(mi_filtro)),'r');
hold on
plot(w,20*log10(abs(X_fourier(:,1))));
hold off
title('Espectro de magnitud en dB del canal 1 de audio, y espectro de magnitud en dB del filtro (en rojo)');
ylabel('Magnitud dB');
xlabel('Frecuencia w [rad]');

grid on
subplot(2,1,2)
plot(w, atan2(imag(mi_filtro),real(mi_filtro)),'r');
hold on
plot(w, atan2(imag(X_fourier(:,1)),real(X_fourier(:,1))));
hold off
title('Espectro de fase del canal 1 de audio, y espectro de fase del filtro (en rojo)');
ylabel('Fase [rad]');
xlabel('Frecuencia w [rad]');
grid on
axis tight

%--------------------------------------------------------------------------
%Cómo filtrar un archivo de audio
%--------------------------------------------------------------------------
H_fourier=[mi_filtro, mi_filtro];      %Use el mismo filtro para cada canal.

Y_fourier=X_fourier.*H_fourier;        %Filtre la señal en el dominio de la frecuencia.

y=ifft(Y_fourier,[],1);                %Recupera la señal en el tiempo.
y=real(y);                             %Esto es para eliminar partes imaginarias pequeñas resultado del cálculo numérico.
%--------------------------------------------------------------------------
%Cómo reproducir un archivo de audio
%--------------------------------------------------------------------------
%sound(x,fs);                           %Reproduzca el sonido original.
%pause(2);
sound(y,fs);                           %Reproduzca el sonido filtrado. 
%--------------------------------------------------------------------------

h3=figure;
set(gcf,'color','white')
subplot(2,1,1)
plot(t,y(:,1))
axis tight
title('Canal 1 de la señal de salida (canal izquierdo).')
grid on
subplot(2,1,2)
plot(t,y(:,2))
axis tight
title('Canal 2 de la señal de salida (canal derecho).')
xlabel('Tiempo [s].')
ylabel('Amplitud')
grid on
%--------------------------------------------------------------------------



