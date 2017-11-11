function V4=vecindad4(fp,cp,fq,cq,I)
V4=0; %Inicializo la variable de salida.

[m,n]=size(I);  %Tama�o en filas y columnas de la imagen I.


if (fp>=1 && fp<=m && cp>=1 && cp<=n) &&  (fq>=1 && fq<=m && cq>=1 && cq<=n)  %Si p y q est�n al interior de I.
    
    %----------------------------------------------------------------------
    %Creo banderas auxiliares que indican si "q" est� en una posici�n dada 
    %respecto a "p".
    arriba=0;
    abajo=0;
    izquierda=0;
    derecha=0;

    %----------------------------------------------------------------------
    %Verifico si q est� arriba de p.
    if cp==cq && fq==(fp-1)
        arriba=1;
    end
    
    %Verifico si q est� abajo de p.
    if cp==cq && fq==(fp+1)
        abajo=1;
    end
    
    %Verifico si q est� a la derecha de p.
    if fp==fq && cq==(cp+1)
        derecha=1;
    end
    
    %Verifico si q est� a la izquierda de p.
    if fp==fq && cq==(cp-1)
        izquierda=1;
    end
    
    %--------------------------------------------------------------------------
    
    if arriba || abajo || derecha || izquierda
        V4=1;
    end
    
    %--------------------------------------------------------------------------
end


