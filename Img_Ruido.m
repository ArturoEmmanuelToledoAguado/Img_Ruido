clc;
clear all;
close all;
%Extraccion de las imagenes
ruta={'IMG/A1.jpg','IMG/A2.jpg','IMG/A3.jpg','IMG/P1.jpg','IMG/P2.jpg','IMG/P3.jpg','IMG/Pai1.jpg','IMG/Pai2.jpg','IMG/Pai3.jpg'};

for k=1:9
    %Abrir la imagen
    img=imread(string(ruta(k)));

    %Ruidos
    [imgRG,imgRSP,imgRUm]=Ruidos(img);

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

function [imgRG,imgRSP,imgRUm]=Ruidos(img)
    %Valores predeterminados
    m=0;%Gauss (media)
    d=.05;%Sal y pimienta (densidad del ruido)
    var_speckle=.05;%Mult (varianza de ruido multiplicativo)
    dims=[1 60];
    
    for k=1:3
        if k==1
            %Interfaz "menu" para ingresar el valor de la media
            prompt1="Ingrese el valor de la media del ruido Gaussiano";
            t1="Media Ruido Gaussiano";
            definput1={'0'};
            n1=inputdlg(prompt1,t1,dims,definput1);
            m=str2double(n1);
            
            %Ruido Gaussiano
            imgRG=imnoise(img,'gaussian',m);
        elseif k==2
            %Interfaz "menu" para ingresar el valor de la media
            prompt2="Ingrese el valor de la densidad del ruido Impulsivo";
            t2="Densidad del Ruido Impulsivo";
            definput2={'.05'};
            n2=inputdlg(prompt2,t2,dims,definput2);
            d=str2double(n2);
            
            %Ruido Impulsivo (Sal y Pimienta)
            imgRSP=imnoise(img,'salt & pepper',d);
        elseif k==3
            %Interfaz "menu" para ingresar el valor de la media
            prompt3="Ingrese el valor de la varianza del ruido multiplicativo";
            t3="Densidad del Ruido Multiplicativo";
            definput3={'.05'};
            n3=inputdlg(prompt3,t3,dims,definput3);
            var_speckle=str2double(n3);
            
            %Ruido Uniforme (multiplicativo)
            imgRUm=imnoise(img,'speckle',var_speckle);
        end
    end
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