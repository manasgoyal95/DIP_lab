clc;
close all;
clear all;
img = imread('lena512.bmp');
subplot(2,2,1);
imshow(img);
img1 = rgb2gray(img); %converts RGB to grayscale
subplot(2,2,2);
imshow(img1);
B = padarray(img1,1,0,'pre'); %pads numeric or logical images with the value 0
C = padarray(B,1,0,'post');
D1 = zeros(514,1);
C1 = horzcat(D1,C); %horizontally concatenating strings
C2 = horzcat(C1,D1);
subplot(2,2,3);
imshow(C2);
C2 = double(C2);
result = zeros(514,514);
new = zeros(3,3);
for i = 2:513
    for j = 2:513
        if C2(i,j)> C2(i-1,j-1)
        new(1,1)= 8;
        else
        new(1,1)=0;
        end
 
        if C2(i,j)> C2(i-1,j)
        new(1,2)= 4;
        else
        new(1,2)=0;
        end
 
        if C2(i,j)> C2(i+1,j+1)
        new(1,3)= 2;
        else
        new(1,3)=0;
        end
 
        if C2(i,j)> C2(i,j-1)
        new(2,1)= 16;
        else
        new(2,1)=0;
        end
 
        if C2(i,j)> C2(i,j+1)
        new(2,3)= 1;
        else
        new(2,3)=0;
        end
 
        if C2(i,j)> C2(i+1,j-1)
        new(3,1)= 32;
        else
        new(3,1)=0;
        end
 
        if C2(i,j)> C2(i+1,j)
        new(3,2)= 64;
        else
        new(3,2)=0;
        end
 
        if C2(i,j)> C2(i+1,j+1)
        new(3,3)= 128;
        else
        new(3,3)=0;
        end
 value = sum(sum(new));
 result(i,j) = value;
    end
end
subplot(2,2,4);
result = uint8(result);
imshow(result);
