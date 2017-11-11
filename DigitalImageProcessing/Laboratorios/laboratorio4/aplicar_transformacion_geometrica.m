function I2=aplicar_transformacion_geometrica(I,H,tipo_de_mapeo)

[m,n,k]=size(I);

I2=zeros(m,n,k);

%-------------------------------------------------------------------------------------------------------
%Mapeo directo
%-------------------------------------------------------------------------------------------------------
if tipo_de_mapeo==1

    for i=1:m
        for j=1:n
            v_entrada=[i,j,1];    %Vector fila de posición de entrada.
            v_salida=v_entrada*H; %Vector fila de posición de salida.

            x=round(v_salida(1,1));   %Fila de salida
            y=round(v_salida(1,2));   %Columna de salida

            if x>=1 && x<=m && y>=1 && y<=n
                    I2(x,y,:)=I(i,j,:);     %copie la intensidad de la posición de entrada en la posición de salida.
            end
        end 
    end

end




%-------------------------------------------------------------------------------------------------------
%Mapeo inverso
%-------------------------------------------------------------------------------------------------------
if tipo_de_mapeo==2
    
    H_inv=inv(H);

    for x=1:m
        for y=1:n
           
            v_salida=[x,y,1];
            v_entrada=v_salida*H_inv;
            i=round(v_entrada(1,1));
            j=round(v_entrada(1,2));
            
            if i>=1 && i<=m && j >=1 && j<=n
                    I2(x,y,:)=I(i,j,:);
            end
            
            
        end    
    end
    
    
    

end
%-------------------------------------------------------------------------------------------------------










