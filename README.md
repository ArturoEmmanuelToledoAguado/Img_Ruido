# Introducción 📖
Se propone realizar un programa que pueda realizar pruebas utilizando la ecualización del histograma en diferentes imágenes para resaltar algún objeto

## ¿Qué es el procesamiento digital de imagenes (PDI)? 🤷‍♂️🤷‍
PDI se puede definir como el conjunto de procesamientos que se realizan sobre una imagen digital ya sea para realizar su almacenamiento, transmisión o tratamiento.

## Lectura de imágenes en matlab 👓
Para leer una imágen en matlab se utiliza la función <a href="https://la.mathworks.com/help/matlab/ref/imread.html"> **imread**</a> y se asigna a una variable que representara a la imágen.

<h5 align="center"><code>imagen = imread('ruta/nombre de la imágen.extensión');</code></h5>

## RUIDO 🔈
El ruido digital es la variación aleatoria **(que no corresponde con la realidad)** del brillo o del color de las imágenes digitales, el cual es producido por el proceso de adquisición de la imagen **(errores de los sensores)**, como el de transmisión **(interferencias en el canal de transmisión)**.

<h6 align="center"> g(x,y)=f(x,y)+r(x,y) </h6>

* Nota.- El ruido Gaussiano es el más comun en imagenes
  
Cualquier señal incluyendo las imágenes pueden tener componentes no deseados, éstos son conocidos como ruido o señales aleatorias. El ruido presente no siempre puede ser descrito únicamente en términos del modelo Gaussiano (comúnmente asumido).

Este ruido puede estar acompañado por secuencias impulsivas, caracterizadas por pícos cortos de altas energías, grandes amplitudes y gran probabilidad de ocurrencia, por dar un ejemplo.

#### Tipos de Ruido
* Gaussiano
* Impulsivo (Sal y Pimienta)
* Uniforme
  * Frecuencial
  * Multiplicativo

### RUIDO GAUSSIANO 📈
* Produce pequeñas variaciones en la imagen
* Suele ser devido a los componentes electrónicos (sensores, digitalizadores,...) o por falta de iluminación y/o altas temperaturas
* Espectro de energía constante para todas las frecuencias:
  * Afecta a la imagen completa
  * La intensidad de todos los pixeles se ve alterada en mayor o menor medida
* En el ruido de tipo Gaussiano, todos los píxeles que componen la imagen cambian su valor en base a una distribución Gaussiana
* El ruido esta centrado en el valor $z$ **(que corresponde con el valor de intensidad del pixel)** y tiene una desviación estándar de sigma ($\sigma$)

//Poner imagen 

* Nota.- El alto y ancho dependen del valor de la desviación estándar de sigma ($\sigma$)
* Menos amplitud = menor afectación

El efecto de este ruido es que se generan valores aleatorios que varián poco respecto al valor original del pixel. La mayor parte de los valores establecidos quedaran similares al original, por lo cual sólo se percibirá alguna modificacion en los elementos.

### RUIDO IMPULSIVO (SAL Y PIMIENTA) 🧂 🌶
* El valor que toma el pixel no tiene relación con el valor ideal sino que toma valores muy altos o muy bajos **(no hay intermedios)**
* Toma el valor máximo **(sal)** o el minimo **(pimienta)**
* No afecta a todos los pixeles
* El ruido eléctrico interfiere en el canal de comunicaciones y afecta 

<a href="https://github.com/ArturoEmmanuelToledoAguado/Ecu-Histograma">Código</a>