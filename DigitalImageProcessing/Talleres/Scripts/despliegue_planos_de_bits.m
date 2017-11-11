%--------------------------------------------------------------------------
% Función que despliega en pantalla, usando ventanas diferentes, todos los planos de bits
% de una imagen de entrada. Nota: use la función que diseñó en el punto 6.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%--------------------------------------------------------------------------
function despliegue_planos_de_bits(I)
%--------------------------------------------------------------------------
I1=double(I);          %Convierto la imagen de entrada a double. 

max_intensidad=max(max(I1));
n=ceil(log10(max_intensidad+1)/log10(2));  %Cuántos bits se requieren para codificar Vmax.

for bit=0:n-1
 
    I2=planos_de_bits(I1,bit);
    
    figure
    imshow(escalar_imagen(I2,255,0),'InitialMagnification', 'fit')
    titulo=strcat('Imagen de salida correspondiente al plano de bits número ',' ',num2str(bit));
    title(titulo)
    
end
%--------------------------------------------------------------------------

   


