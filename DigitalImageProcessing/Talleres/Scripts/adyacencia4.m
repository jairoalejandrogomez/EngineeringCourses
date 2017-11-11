function A4=adyacencia4(fp,cp,fq,cq,v,I)

A4=0; %Inicializo la variable de salida.

[m,n]=size(I);  %Tamaño en filas y columnas de la imagen I.


if (fp>=1 && fp<=m && cp>=1 && cp<=n) &&  (fq>=1 && fq<=m && cq>=1 && cq<=n)  %Si p y q están al interior de I.
        
    vp=I(fp,cp);   %Intensidad del pixel p.
    vq=I(fq,cq);   %Intensidad del pixel q.
    
    
    %--------------------------------------------------------------------------
    %Verificar si p y q tienen valores que pertenecen a v
    
    p_pertenece_a_v=0;
    q_pertenece_a_v=0;
    
    for i=1:length(v)
        
        if v(i)==vp
            p_pertenece_a_v=1;
        end
        
        
        if v(i)==vq
            q_pertenece_a_v=1;
        end
        
    end
    
    %--------------------------------------------------------------------------
    %Verificar si p y q son 4 vecinos
    
    V4=vecindad4(fp,cp,fq,cq,I);
    
    %--------------------------------------------------------------------------
    
    if p_pertenece_a_v && q_pertenece_a_v && V4==1 %Si los pixeles p y q pertenecen a v y son 4 vecinos entonces son adyacentes 4.
        A4=1;
    end
    %--------------------------------------------------------------------------
    
    
end
