%--------------------------------------------------------------------------
%La función retorna bien sea el histograma (si h es igual a 0) o el histograma
%normalizado (si h es igual a 1). El histograma se calcula desde 0 hasta
%Lmax.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%norm:    0: Histograma, 1: Histograma normalizado.
%--------------------------------------------------------------------------
%histo:   Histograma de salida. 
%--------------------------------------------------------------------------
function [histo,varargout]=histograma2(I,Lmax,norm)
%--------------------------------------------------------------------------
[nfilas,ncolumnas]=size(I);

max_intensidad=max(max(I));

histo=zeros(Lmax+1,1);       

for i=1:nfilas
    for j=1:ncolumnas
        histo(I(i,j)+1,1)=  histo(I(i,j)+1,1)+1;   %histograma.   %el +1 dentro de los índices es por Matlab.
    end
end
%--------------------------------------------------------------------------

if norm==1  %histograma normalizado.
   histo=histo/(nfilas*ncolumnas);
end
%--------------------------------------------------------------------------   

%Esto es en caso que el usuario requiera como salida el vector de
%intensidades de entrada (por ejemplo para plotear los resultados).
if nargout==2
varargout(1)={(0:Lmax)'};   %Vector con intensidades de entrada.
end

%-------------------------------------------------------------------------- 
