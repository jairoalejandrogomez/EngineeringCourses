function H=laplaciano_en_frecuencia(P,Q)

D = crear_matriz_de_distancia(P,Q);

H=(-4*pi^2)*(D.^2);


