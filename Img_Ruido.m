clc;
clear all;
close all;
%Extraccion de las imagenes
ruta={'IMG/A1.jpg','IMG/A2.jpg','IMG/A3.jpg','IMG/P1.jpg','IMG/P2.jpg','IMG/P3.jpg','IMG/Pai1.jpg','IMG/Pai2.jpg','IMG/Pai3.jpg'};

for k=1:9
    %Abrir la imagen
    img=imread(string(ruta(k)));

    %Ruido Gaussiano
    imgRG=imnoise(img,'gaussian');

    %Ruido Impulsivo (Sal y Pimienta)
    imgRSP=imnoise(img,'salt & pepper');

    %Ruido Uniforme (multiplicativo)
    imgRUm=imnoise(img,'speckle');

    %Ruido Uniforme (frecuencial)
    clear matR;
    matR=imagenR(img);
    %%Pasamos de uint8 a double
    img=double(img);
    imgRUf=img+matR;
    
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
end

function imgR=imagenR(img)
    %Tamaño de la imagen
    [f c]=size(img);
    %Vector del coseno
    x=0:2*pi/(f*(c/3)):2*pi;
    %Creamos la señal de ruido
    rui=100*cos(x);
    %Señal de ruido a matriz
    cont=1;
    for i=1:f
        for j=1:c/3
            imgR(i,j)=rui(cont);
            cont=cont+1;
        end
    end
end