%--------------------------------------------------------------------------
%Laboratorio #10 en Matlab/Octave de la asignatura "se�ales y sistemas".
%
%Objetivos: 
%   1. Explorar la representaci�n en series de Fourier de una
%      se�al peri�dica en tiempo discreto.
%   2. Analizar el espectro de magnitud y fase de una se�al discreta,
%      caracterizada por los coeficientes de Fourier.
%
%Observaci�n: 
%     Este laboratorio debe ir acompa�ado de los archivos: 
%     crear_funcion_periodica.m
%     secuencia_discreta.m
%--------------------------------------------------------------------------
close all                   
clear all                   
clc         
addpath(genpath('./auxiliar/')); %Incluye la carpeta auxiliar en el path.
%--------------------------------------------------------------------------
%Definici�n de un per�odo de la se�al
%--------------------------------------------------------------------------
%Nota: Los ejemplos 1, 2, y 3, corresponden a las se�ales de los ejemplo
%del libro de "Signals and Systems, 2nd Ed." de Oppenheim 3.10, 3.11 y 3.12.

%N=5;             v=sin((2*pi/N)*(0:1:N-1));                                                           %Ejemplo 1.
%N=5;             v=1+sin((2*pi/N)*(0:1:N-1))+3*cos((2*pi/N)*(0:1:N-1))+cos((4*pi/N)*(0:1:N-1)+pi/2);  %Ejemplo 2.
%N1=3; N=4*N1-1;  v=[ones(1,N1),zeros(1,2*N1),ones(1,N1)];                                             %Ejemplo 3.
N=4;             v=[0,1,2,1];                                                                          %Ejemplo 4. A desarrollar en clase.
%N=8;             v=[0,1,2,1,0,-1,-2,-1];                                                              %Ejemplo 5.
%N1=10; N=2*N1+1; v=[0:1:N1,N1-1:-1:0];                                                                %Ejemplo 6.

%--------------------------------------------------------------------------
%Creaci�n de la se�al peri�dica
%--------------------------------------------------------------------------
mi_funcion=@(n) secuencia_discreta(v,n);             %Funci�n an�nima con par�metros extra. En este caso el vector v.
n=0:1:10*N;                                            %Definici�n de la variable independiente.
                                                       %Crea un vector fila de muestras.
y_periodica=crear_funcion_periodica(mi_funcion,N,n);   %Genera la se�al per�odica con periodo fundamental N. 

%--------------------------------------------------------------------------
%Definici�n de los l�mites para k requeridos en las sumatorias de
%los coeficientes y de las series de Fourier.
%--------------------------------------------------------------------------
%   Si N es impar:    k=-(N-1)/2:1:(N-1)/2. 
%   Si N es par:      k=-(N/2)+1:1:(N/2). 
if mod(N,2)==0  %Si N es par, entonces:
    k_inicial= -(N/2)+1;
    k_final  = (N/2);
else            %Si N es impar, entonces
    k_inicial= -(N-1)/2;
    k_final  = (N-1)/2; 
end

vec_k=k_inicial:1:k_final;   %Vector con los valores de k que se van a utilizar. 
                             %Observe que no tiene dimensiones.
vec_w=vec_k*(2*pi/N);        %Vector [rad]

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%C�lculo de los coeficientes de Fourier
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Observe que la serie de Fourier de se�ales peri�dicas en tiempo discreto 
%solo requiere un n�mero finito de arm�nicos.

ak=zeros(1,N);

indice_k_matlab = 1;
for k=k_inicial:1:k_final  
    for indice_n_matematica=0:N-1
        ak(1,indice_k_matlab)=ak(1,indice_k_matlab)+(1/N)*mi_funcion(indice_n_matematica)*exp(-i*k*(2*pi/N)*indice_n_matematica);
    end
    indice_k_matlab=indice_k_matlab+1;
end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Reconstrucci�n de la se�al peri�dica en tiempo discreto usando la serie de Fourier.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
y_fourier=0;
indice_k_matlab = 1;
for k=k_inicial:k_final  
    y_fourier=y_fourier+ak(1,indice_k_matlab)*exp(i*k*2*pi*n/N);
    indice_k_matlab=indice_k_matlab+1;
end

y_fourier = real(y_fourier);   %Este comando permite eliminar las componentes
                               %imaginarias residuales del c�lculo num�rico 
                               %(por ejemplo valores como i*1E-16)

%--------------------------------------------------------------------------                               
%--------------------------------------------------------------------------
%Gr�ficas de la se�ales discretas originales, y de la se�al reconstruida
%con la serie de Fourier.
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

h1 = figure; 
set(gcf, 'color', 'white');  

subplot(3,1,1);
stem(n,mi_funcion(n),'b');     %Grafica la se�al aperi�dica correspondiente en azul
title('Se�al aperi�dica.')
xlabel('�ndice')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,2)
stem(n,y_periodica,'r');       %Grafica la se�al peri�dica en rojo.
titulo=sprintf('Se�al peri�dica con per�odo fundamental N = %3.1f.',N);
title(titulo)
xlabel('�ndice')
ylabel('Amplitud')
grid on;                   
axis tight

subplot(3,1,3)
stem(n,y_fourier,'k');       %Serie de Fourier 
titulo=sprintf('Reconstrucci�n de la se�al peri�dica en tiempo discreto usando la serie de Fourier');
title(titulo)
xlabel('�ndice')
ylabel('Amplitud')
grid on;                   
axis tight

hold off

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Magnitud y fase de los coeficientes de Fourier
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------                           

real_ak=real(ak);
imag_ak=imag(ak);
mag_ak=sqrt((real_ak.^2)+(imag_ak.^2));
arg_ak=atan2(imag_ak,real_ak);

%arg_ak=unwrap(arg_ak);
                               
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Gr�ficas del espectro de magnitud y fase 
%de los coeficientes de Fourier vs. k
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

h2 = figure; 
set(gcf, 'color', 'white'); 
subplot(2,1,1);
stem(vec_k,mag_ak,'b');     
title('Espectro de magnitud.')
ylabel('|a_{k}|')
grid on;                   
axis tight

set(gcf, 'color', 'white'); 
subplot(2,1,2);
stem(vec_k,arg_ak,'r');     
title('Espectro de fase.')
ylabel('arg(a_{k})')
xlabel('�ndice k')
grid on;                   
axis tight

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%Gr�ficas del espectro de magnitud y fase 
%de los coeficientes de Fourier vs. Wo*k
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

h3 = figure; 
set(gcf, 'color', 'white'); 
subplot(2,1,1);
stem(vec_w,mag_ak,'b');     
title('Espectro de magnitud.')
ylabel('|a_{k}|')
grid on;                   
axis tight

set(gcf, 'color', 'white'); 
subplot(2,1,2);
stem(vec_w,arg_ak,'r');     
title('Espectro de fase.')
ylabel('arg(a_{k})')
xlabel('kw_{0} [rad]')
grid on;                   
axis tight

%--------------------------------------------------------------------------
