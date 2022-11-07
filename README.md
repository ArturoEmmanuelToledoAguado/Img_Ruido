# Introducción 📖
Se propone realizar un programa que pueda agregar ruido Gaussiano, impulsivo y uniforme a imagenes, pero antes de comenzar:

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
* Nota.- Menos amplitud = menor afectación

El efecto de este ruido es que se generan valores aleatorios que varián poco respecto al valor original del pixel. La mayor parte de los valores establecidos quedaran similares al original, por lo cual sólo se percibirá alguna modificacion en los elementos.

### RUIDO IMPULSIVO (SAL Y PIMIENTA) 🧂 🌶
* El valor que toma el pixel no tiene relación con el valor ideal sino que toma valores muy altos o muy bajos **(no hay intermedios)**
* Toma el valor máximo **(sal)** o el minimo **(pimienta)**
* No afecta a todos los pixeles
* El ruido eléctrico interfiere en el canal de comunicaciones y afecta el cableado de distribución eléctrica que es especialmente suceptible al mismo, éste afecta la transmisión de datos disminuyendo la capacidad del canal para transportar información. A diferencia de las líneas de transmisión convencionales donde el ruido blanco Gaussiano aditivo es la principal fuente de interferencia, los cables de conexión eléctrica se ven afectados por diferentes tipos de ruido en especial el impulsivo, el cual puede ser sincrono (periodico) o asíncrono (repentino)
* Se produce normalmente en la cuantificación que se realiza en el proceso de digitalización
* Matemáticamente este ruido se modela con una función de distribución no Gaussiana o escalón como la mostrada en la figura
  // Agregar foto

### RUIDO UNIFORME
* El ruido que afecta a la imagen sigue una distribución uniforme
* La probabilidad de tomar cualquier valor gris dentro de un intervalo definido es constante, es decir, equiprobable

#### Ruido uniforme frecuencial
La imagen obtenida es la real más una interferencia de señal periódica (senoide, cosenoide).

#### Ruido uniforme multiplicativo
La señal obtenida es fruto de la multiplicación de dos señales.

//Agregar imagen

* Nota.- Afecta a toda la imagen
* Nota.- El multiplicativo **NO** siempre afecta menos que el ruido Gaussiano, todo depende del rango de los valores

## PRACTICA
Una vez cubiera la teoria necesaria te estaras preguntando: ¿y como agrego el ruido en Matlab?🤷‍♀️🤷‍♂️

La respuesta es muy sencilla, se usa la función <a href="https://la.mathworks.com/help/images/ref/imnoise.html">**imnoise**</a>, la cual puede agregar ruido a una imagen en Matlab

<h5 align="center"><code>Imruido=imnoise(img, tipo de ruido, variable);</code></h5>

* Nota.- El termino **variable** puede ser la media, varianza o densidad del ruido dependiendo del tipo de ruido a usar
  
#### Ruido uniforme frecuencial
Ya que la función <a href="https://la.mathworks.com/help/images/ref/imnoise.html">**imnoise**</a> no cuenta con la opción para este tipo de ruido se propuso lo siguiente:

~~~
    [f c]=size(img);
    x=0:2*pi/(f*(c/3)):2*pi;
    rui=100*cos(x);
    cont=1;
    for i=1:f
        for j=1:c/3
            imgR(i,j)=rui(cont);
            cont=cont+1;
        end
    end
~~~

Si recordamos la teoria y el hecho de que Matlab opera con matrices, se propuso realizar una matriz que contenga la información de una senoidal (en este caso el coseno) y tenga las mismas dimenciones que la imagen; se usa $\frac{c}{3}$ ya que al usar imagenes a color las columnas se multiplican por 3

#### Resultados

//imagenes

<a href="https://github.com/ArturoEmmanuelToledoAguado/Img_Ruido/blob/main/Img_Ruido.m">Código</a>