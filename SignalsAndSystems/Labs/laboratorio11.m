%--------------------------------------------------------------------------
%Laboratorio #11 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Explorar la transformada de Fourier de señales y sistemas en tiempo discreto.
%   2. Analizar la DFT y el algoritmo de FFT en Matlab.
%   2. Analizar el espectro de magnitud y fase de un sistema discreto representado 
%      por: y[n]=(1/4)x[n]+(1/2)x[n-1]+(1/4)x[n-2]
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
j=sqrt(-1);                          %Número imaginario.
n=2048;                              %Número de muestras a calcular de la respuesta en frecuencia.
delta_w=2*pi/n;                      %Resolución en frencuencia [rad].
w=-pi:delta_w:pi-delta_w;            %Vector de frecuencia discreta [rad] comprendido entre [-pi, pi)
fs=1000;                             %Frecuencia de muestreo [Hz]. En un sistema esto depende del muestreador del ADC.
f=w*fs/(2*pi);                       %Vector de frecuencia en [Hz] 

%--------------------------------------------------------------------------
%Método 1: Expandiendo la transformada de Fourier de la señal discreta, y 
%          evaluando en un número de puntos para w.
%--------------------------------------------------------------------------
H=(1/4)*(1+2*exp(-j*w)+exp(-j*w*2)); %Vector con muestras de la respuesta en frecuencia.

%--------------------------------------------------------------------------
%Método 2: Usando la DFT y centrando el espectro.
%--------------------------------------------------------------------------
% h       =[1/4,1/2,1/4];
% nh=length(h);
% h_minus_1_to_the_n       =h.*((-1).^(0:(nh-1)));                    %Esto es equivalente a desplazar el espectro en frecuencia pi radianes.
%                                                                     %Se hace para poder graficar w entre [-pi,pi) y no entre [0,pi)
% h_minus_1_to_the_n_padded=[h_minus_1_to_the_n, zeros(1,(n-nh))];    %Se rellena de ceros al final, hasta tener n muestras.
% H=fft(h_minus_1_to_the_n_padded);                                   %Nota: la implementación de Matlab no incluye el factor (1/N) 
%                                                                     %en la transformada directa como en el libro de Oppenheim, 
%                                                                     %sino en la transformada inversa !!!.
%--------------------------------------------------------------------------
mag_H=abs(H);                      %Espectro de magnitud en números.
arg_H=atan2(imag(H),real(H));      %Espectro de fase.  
mag_H_en_dB=20*log10(mag_H);       %Espectro de magnitud en dB.
%--------------------------------------------------------------------------
handler1=figure;
set(gcf,'color','white');
subplot(2,1,1);
plot(w,mag_H,'b')             
title('Espectro de magnitud |H(exp(jw))| vs. w [rad]');
ylabel('|H(exp(jw))|');
axis tight
grid on

subplot(2,1,2);
plot(w,arg_H,'k');              
title('Espectro de fase arg[H(exp(jw)] [rad] vs. w [rad]');
ylabel('arg[H(exp(jw)]');
xlabel('Frecuencia w (rad)');
axis tight
grid on
%--------------------------------------------------------------------------
handler2=figure;
set(gcf,'color','white');
subplot(2,1,1);
plot(w,mag_H_en_dB,'b');           
title('Espectro de magnitud en dB: |H(exp(jw))|_{dB} vs. w [rad]');
ylabel('|H(exp(jw))|_{dB}');
axis tight
grid on

subplot(2,1,2);
plot(w,arg_H,'k');              
title('Espectro de fase arg[H(exp(jw)] [rad] vs. w [rad]');
ylabel('arg[H(exp(jw)]');
xlabel('Frecuencia w [rad]');
axis tight
grid on
%--------------------------------------------------------------------------
handler3=figure;
set(gcf,'color','white');
subplot(2,1,1);
plot(f,mag_H_en_dB,'b');           
title('Espectro de magnitud en dB: |H(exp(jw))|_{dB} vs. f [Hz]');
ylabel('|H(exp(jw))|_{dB}');
axis tight
grid on

subplot(2,1,2);
plot(f,arg_H,'k');              
title('Espectro de fase arg[H(exp(jw)] [rad] vs. f [Hz]');
ylabel('arg[H(exp(jw)]');
xlabel('Frecuencia f [Hz]');
axis tight
grid on
%--------------------------------------------------------------------------
handler4=figure;
set(gcf,'color','white');
subplot(2,1,1);
plot(f,mag_H_en_dB,'b');           
hold on;
plot(f,-3*ones(n,1),'r')             %La línea roja que muestra -3 dB.
hold off
title('Espectro de magnitud en dB: |H(exp(jw))|_{dB} vs. frecuencia [Hz] >=0. Nota: La línea roja muestra -3dB');
ylabel('|H(exp(jw))|_{dB}');
axis tight
xlim([0 max(f)])
grid on

subplot(2,1,2);
plot(f,arg_H,'k');              
title('Espectro de fase arg[H(exp(jw)] [rad] vs. f [Hz]');
ylabel('arg[H(exp(jw)]');
xlabel('Frecuencia f [Hz]');

indice_f_0Hz=find(abs(f)==min(abs(f)));  %Esto encuentra de forma aproximada el índice para el cual f es igual a 0Hz;
indice_fmax =length(f);          %Indice para el cual f es aproximadamente fs/2.
min_arg=min(arg_H(indice_f_0Hz),arg_H(indice_fmax ));   %Valor mínimo de la fase.
max_arg=max(arg_H(indice_f_0Hz),arg_H(indice_fmax ));   %Valor máximo de la fase.
xlim([0 max(f)]);                                       %Esto es para que solo muestre frecuencias >=0 Hz.
ylim([min_arg max_arg]);                                %Esto es para que el eje vertical quede ajustado a los datos.
grid on

%--------------------------------------------------------------------------
%Método 3: Usando las herramientas de  Matlab, y los coeficientes del
%filtro directamente.
%--------------------------------------------------------------------------
n_=1024;                     %Número de muestras a calcular de la respuesta en frecuencia.
fs_=1000;                    %Frecuencia de muestreo [Hz]. En un sistema esto depende del muestreador del ADC.
a=1;                         %Filtro FIR.
b=[1/4 1/2 1/4];             %Coeficientes del filtro FIR.

[H_,f_] = freqz(b,a,n_,fs_);

handler5=figure;
set(gcf,'color','white');
subplot(2,1,1);
plot(f_,20*log10(abs(H_)),'b')        
hold on;
plot(f_,-3*ones(n_,1),'r')             %La l�nea roja que muestra -3 dB.
hold off
title('Espectro de magnitud en dB: |H(exp(jw))|_{dB} vs. frecuencia [Hz] >=0. Nota: La l�nea roja muestra -3dB')
ylabel('|H(exp(jw))|_{dB}');
axis tight
grid on

subplot(2,1,2);
plot(f_,atan2(imag(H_),real(H_)),'k');              
title('Espectro de fase arg[H(exp(jw)] [rad] vs. f [Hz]');
ylabel('arg[H(exp(jw)]');
xlabel('Frecuencia f [Hz]');
axis tight
grid on
%--------------------------------------------------------------------------






