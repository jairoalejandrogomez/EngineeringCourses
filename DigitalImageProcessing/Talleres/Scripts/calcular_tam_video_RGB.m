function tamMB=calcular_tam_video_RGB(M,N,f,k,tmin)
%--------------------------------------------------------------------------
% tamMB: Tamaño del video en Mega bytes.

% M: Num filas
% N: Num columnas
% f: cuadros por segundos
% k: Número de bits por cada uno de los 3 planos de color
% tmin: Duración del video en minutos
%--------------------------------------------------------------------------

tamMB=0; %Inicializo la variable de salida

t=tmin*60;   %Tiempo en segundos

tam_bits=M*N*3*k*f*t;  %Tamaño del video en bits. 

tam_bytes=tam_bits/8;  %Tamaño del video en bytes

tamMB= tam_bytes/(2^20); %Tamaño del video en MB.

%--------------------------------------------------------------------------




