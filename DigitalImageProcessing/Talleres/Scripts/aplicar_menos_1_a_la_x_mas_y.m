function I3=aplicar_menos_1_a_la_x_mas_y(I);
[M,N]=size(I);
I2=double(I);    %Copia local. 
I3=zeros(M,N);   

for x=0:M-1
  for y=0:N-1
      I3(x+1,y+1)=I2(x+1,y+1)*(-1)^(x+y);     
  end
end