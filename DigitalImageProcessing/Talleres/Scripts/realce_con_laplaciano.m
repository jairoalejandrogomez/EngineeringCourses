%--------------------------------------------------------------------------
% Desarrolle una función que permita usar el Laplaciano para mejorar los detalles finos de una imagen de
% entrada en escala de grises.
%--------------------------------------------------------------------------
%I:                   Imagen de entrada
%opcion_laplaciano:   0: Laplaciano normal.  1: Laplaciano que considera
%                                               las diagonales.
%mag_c:               Magnitud de la constante pondera al laplaciano.            

%I3:   Imagen de salida. 
%--------------------------------------------------------------------------
function I3=realce_con_laplaciano(I,opcion_laplaciano,mag_c)
%--------------------------------------------------------------------------
I1=double(I);                 %Convierto la imagen de entrada a double.
I3=0*I1;                      %inicializo la matriz de salida. 

if opcion_laplaciano==0
    h=[0  1 0;
        1 -4 1;
        0  1 0];   %laplaciano sencillo  
else
    h=[1  1 1;
        1 -8 1;
        1  1 1];   %laplaciano con diagonales
end

%--------------------------------------------------------------------------
laplaciano=correlacion(I1,h,0); 

%--------------------------------------------------------------------------
c=-1*mag_c;   %El -1 es porque estoy usando laplacianos cuyo elemento central es negativo.

I3=I1+c*laplaciano;

%I3=escalar_imagen(I3,255,0); 
%--------------------------------------------------------------------------

