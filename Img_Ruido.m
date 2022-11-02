clc;
clear all;
close all;

%Abrir la imagen
img=imread('IMG\A1.jpg');

%Ruido Gaussiano
imgRG=imnoise(img,'gaussian');

%Ruido Impulsivo (Sal y Pimienta)
imgRSP=imnoise(img,'salt & pepper');

%Ruido Uniforme (multiplicativo)
imgRUm=imnoise(img,'speckle');

%Vector del coseno
[f c]=size(img);
x=0:2*pi/(f*c/3):2*pi;
sig=100*cos(x);
cont=0;
for i=1:f
    for j=1:c/3
        cont=cont+1;
        mat(i,j)=sig(cont);
    end
end
%Pasamos de uint8 a double
img=double(img);
%Ruido Uniforme (frecuencial)
imgRUf=img+mat;
%Pasamos de double a uint8
imgRUf=uint8(imgRUf);
img=uint8(img);

%Mostrar imagenes
figure
subplot(2,3,1)
imshow(img)
title('Original')
subplot(2,3,2)
imshow(imgRG)
title('Ruido Gaussiano')
subplot(2,3,3)
imshow(imgRSP)
title('Ruido Impulsivo')
subplot(2,3,4)
imshow(imgRUm)
title('Ruido Uniforme Multiplicativo')
subplot(2,3,5)
imshow(imgRUf)
title('Ruido Uniforme Frecuencial')