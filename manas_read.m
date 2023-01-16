clc;
close all;
clear all;
%reading the image
I = imread('image.png');
figure();
imshow(I);
%converting to grayscale by taking only a single layer
Im = I;
Im = Im(:,:,1);
figure();
imshow(Im);
%showing all the red colored components of the image
I_r = I;
I_r(:,:,2) = 0;
I_r(:,:,3) = 0;
figure();
imshow(I_r);
%showing all the green colored components of the image
I_g = I;
I_g(:,:,1) = 0;
I_g(:,:,3) = 0;
figure();
imshow(I_g);
%showing all the blue colored components of the image
I_b = I;
I_b(:,:,1) = 0;
I_b(:,:,2) = 0;
figure();
imshow(I_b);
%calcualting the average RGB values of the above image
IRavg = uint8((sum(sum(I_r)))./((size(I_r,1)).*(size(I_r,2))));
imshow(IRavg);
figure();
IGavg = uint8((sum(sum(I_g)))./((size(I_g,1)).*(size(I_g,2))));
imshow(IGavg);
figure();
IBavg = uint8((sum(sum(I_b)))./((size(I_b,1)).*(size(I_b,2))));
imshow(IBavg);
figure();