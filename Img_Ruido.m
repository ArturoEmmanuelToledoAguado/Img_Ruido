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

% %Vector del coseno
% x=1:2*pi/8783350:2*pi;
% %Pasamos de uint8 a double
% img=double(img);
% %Ruido Uniforme (frecuencial)
% imgRUf=img+100*cos(x);
% %Pasamos de double a uint8
% imgRUf=uint8(imgRUf)

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
% imshow(imgRUf)
% title('Ruido Uniforme Frecuencial')