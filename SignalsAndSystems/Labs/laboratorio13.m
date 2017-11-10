%--------------------------------------------------------------------------
%Laboratorio 13 en Matlab/Octave de la asignatura "señales y sistemas".
%
%Objetivos: 
%   1. Realizar la expansión en fracciones parciales de una función
%   racional.
%   2. Aprender a validar en Matlab los resultados de expansiones en fracciones
%   parciales hechos a mano.
%--------------------------------------------------------------------------
close all
clear all
clc
%--------------------------------------------------------------------------
%Primera parte.
%--------------------------------------------------------------------------
%Paso 1: encontrar la función racional de interés.
%Y(s)=(s+2)/(s*((s+3)^3));

%Paso 2: expandir las expresiones para formar los polinomios del numerador
%y del denominador.
%Y(s)=(s+2)/(s^3+6s^2+9s+0);

%Paso 3: Extraer los coeficientes que caracterizan los polinomios del
%numerador y del denominador.
num=[1 2]                 %Coeficientes del numerador en orden decreciente de potencia.
den=[1 6 9 0]             %Coeficientes del denominador en orden decreciente de potencia.

%Paso 4: Usar la función residue de Matlab.
[r,p,k]=residue(num,den)   %Esta función retorna los residuos r, asociados a los polos p, y los términos independientes k.


%Los resultados de Matlab son:
% r = -0.2222
%      0.3333
%      0.2222
% 
% p =  -3     %Nota: este polo es de orden 1.
%      -3     %Nota: este polo es de orden 2
%       0     %Nota: este polo es de orden 1.
% 
% k =  []

%Luego, la expansión en fracciones parciales puede escribirse como:
%Y(s)=  -0.2222/(s+3)+0.3333/((s+3)^2)+0.2222/s.

%--------------------------------------------------------------------------
%Segunda parte.
%--------------------------------------------------------------------------
disp('Ahora vamos a verificar un ejercicio hecho a mano....');

%En Matlab es posible verificar los resultados de las expansiones en 
%fraccions parciales que se han encontrado manualmente. Para el ejemplo
%anterior se encontró usando lápiz y papel que:
r_manual=[2/9; -2/9; 1/3]
p_manual=[0; -3; -3]
k_manual=[]               %Esto se hace para indicar que no hay términos independientes

%Ahora se usa el mismo comando residue, pero se cambian los argumentos de
%entrada y de salida
[b_resultante,a_resultante] = residue(r_manual,p_manual,k_manual)

% Con lo cual Matlab arroja:
% b_resultante =      0     1     2
% a_resultante =      1     6     9     0

% Es decir                        Y(s)=(0*s^2+1*s+2)/(1*s^3+6*s^2+9*s+0);
% Que simplificando corresponde a Y(s)=(s+2)/(s^3+6s^2+9s+0);
% Como puede apreciarse, se llegó a la expresión inicial, indicando que la 
% expansión está bien hecha.
%--------------------------------------------------------------------------






