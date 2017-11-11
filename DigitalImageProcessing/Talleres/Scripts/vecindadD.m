function VD=vecindadD(fp,cp,fq,cq,I)

VD=0; %Inicializo la variable de salida.

[m,n]=size(I);  %Tamaño en filas y columnas de la imagen I.


if (fp>=1 && fp<=m && cp>=1 && cp<=n) &&  (fq>=1 && fq<=m && cq>=1 && cq<=n)  %Si p y q están al interior de I.
    
    %----------------------------------------------------------------------
    %Creo banderas auxiliares que indican si "q" está en una posición dada 
    %respecto a "p".
    diagonal_superior_izquierda=0;
    diagonal_superior_derecha=0;
    diagonal_inferior_izquierda=0;
    diagonal_inferior_derecha=0;
    %----------------------------------------------------------------------    
    
    
    %Verifico si q está en la diagonal superior izquierda de q.
    if fq==(fp-1) && cq==(cp-1)
    diagonal_superior_izquierda=1;    
    end
        
    %Verifico si q está en la diagonal superior derecha de q.
    if fq==(fp-1) && cq==(cp+1)
    diagonal_superior_derecha=1;    
    end
    
    %Verifico si q está en la diagonal inferior izquierda de q.
    if fq==(fp+1) && cq==(cp-1)
    diagonal_inferior_izquierda=1;    
    end
    
    %Verifico si q está en la diagonal inferior derecha de q.
    if fq==(fp+1) && cq==(cp+1)
    diagonal_inferior_derecha=1;    
    end
    %----------------------------------------------------------------------   
    
    if diagonal_superior_izquierda || diagonal_superior_derecha || diagonal_inferior_izquierda || diagonal_inferior_derecha
       VD=1; 
    end
    
    %----------------------------------------------------------------------    
    
end
