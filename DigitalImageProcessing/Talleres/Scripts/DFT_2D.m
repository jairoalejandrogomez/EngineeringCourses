%--------------------------------------------------------------------------
% Desarrolle una función en Matlab que le aplique la transformada discreta de Fourier en 2D a una
% imagen de entrada en escala de grises. Nota: se puede referir a las ecuaciones que se presentaron en las
% diapositivas de la clase 3 para tal fin.
%--------------------------------------------------------------------------
%I:    Imagen de entrada
%T:    2D DFT de la imagen de entrada. 
%--------------------------------------------------------------------------
function T=DFT_2D(I)
%--------------------------------------------------------------------------

I1=double(I);

[M,N]=size(I1);


for u=0:M-1
    
    for v=0:N-1
        
        %------------------------------------------------------------------
        sumatoria=0;
        
        for x=0:M-1
            
            for y=0:N-1
                
                sumatoria=sumatoria+I1(x+1,y+1)*exp(-j*2*pi*((u*x/M)+(v*y/N)));
                
            end
            
        end
        
        T(u+1,v+1)=sumatoria;
        %------------------------------------------------------------------
        
    end
    
end

%--------------------------------------------------------------------------