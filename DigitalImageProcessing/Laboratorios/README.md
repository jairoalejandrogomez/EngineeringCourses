--------------------------------------------------------------------------
### Laboratorio #1 de la asignatura "procesamiento digital de imágenes".

Objetivos:  
   - Recuperar las características de una imagen almacenada en el disco duro.
   - Leer una imagen del disco duro.
   - Mostrar una matriz como una imagen en Matlab
   - Aplicar una transformación de intensidad a una imagen.
   - Almacenar la imagen procesada en el disco duro.

Observación: Este archivo requiere la imagen "lena512.bmp".

--------------------------------------------------------------------------
### Laboratorio #2 de la asignatura "procesamiento digital de imágenes".

Objetivos:  
   - Leer una imagen a color del disco duro.
   - Recuperar y mostrar los planos RGB de una imagen a color.
   - Evaluar el efecto de cada plano en una imagen a color.

Observación: Este archivo requiere las imágenes "mona_lisa.jpg" y "sydney.jpg".

--------------------------------------------------------------------------
### Laboratorio #3 de la asignatura "procesamiento digital de imágenes".

Objetivos:  
   - Obtener una imagen en escala de grises a partir de una imagen a color.
   - Evaluar las transformaciones de intensidad lineales.
  -  Evalaur las transformaciones de intensidad gamma.
  -  Evalaur las transformaciones de intensidad logarítmicas.

Observación: Este archivo requiere la siguiente imagen: "paris.jpg".

--------------------------------------------------------------------------
### Laboratorio #4 de la asignatura "procesamiento digital de imágenes".

Objetivos:  
   - Evaluar algunas de las transformaciones geométricas que se pueden
     aplicar a una imagen digital.
   - Comprender el concepto de mapeo directo y mapeo inverso.
   - Aprender a aplicar las transformaciones geométricas
     respecto al centro de la imagen.

Observación: Este archivo requiere los siguientes archivos: "lena512.bmp"; "aplicar_transformacion_geometrica.m"

  En este script se asume que las transformaciones H "post multiplican"
  a un "vector fila" en coordenadas homogéneas de la forma [x, y, 1].
  Por esta razón transformaciones sucesivas se multiplican de la forma
  H0*H1*H2*....*HN, donde H0 ocurre primero que H1, H1 ocurre primero que
  H2, etc...

  Este script y la función "aplicar_transformacion_geometrica.m" usan 
  la siguiente convención para las imágenes digitales:

     |-------- y
     |
     |
     |
     x

--------------------------------------------------------------------------