clc;
clear ;
close all;

Q = [16 11 10 16 24 40 51 61 ;
     12 12 14 19 26 28 60 55 ;
     14 13 16 24 40 57 69 56 ;
     14 17 22 29 51 87 80 62 ;
     18 22 37 56 68 109 103 77 ;
     24 35 55 64 81 104 113 92 ;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
I = imread('lena.bmp');
ImageSize = 8*numel(I);
%converts the red, green, and blue values of an RGB image to luminance and chrominance
Y_d = rgb2ycbcr( I );
% Downsample:
Y_d(:,:,2) = 2*round(Y_d(:,:,2)/2);
Y_d(:,:,3) = 2*round(Y_d(:,:,3)/2);
% DCT compress:
A = zeros(size(Y_d));
B = A;
for channel = 1:3
    for j = 1:8:size(Y_d,1)-7
        for k = 1:8:size(Y_d,2)-7
            II = Y_d(j:j+7,k:k+7,channel);
            freq = dct2(II);
            freq = Q.*round(freq./Q);
            A(j:j+7,k:k+7,channel) = freq;
            % inverse at the same time:
            B(j:j+7,k:k+7,channel) = idct2(freq);
        end
    end
end
b = A(:);
b = b(:);
b(b==0)=[];  
b = floor(255*(b-min(b))/(max(b)-min(b)));
symbols = unique(b);
prob = histcounts(b,length(symbols))/length(b);
dict = huffmandict(symbols, prob); %generates a binary Huffman code dictionary
enco = huffmanenco(b, dict); %Create unique symbols, and assign probabilities of occurrence to them
FinalCompressedImage = length(enco);
disp('Compression Ratio is :');
CR = ImageSize/FinalCompressedImage;
fprintf(' %d bytes\n', CR);
subplot(1,2,1)
imshow(I)
title('Original Image')
subplot(1,2,2)
imshow(ycbcr2rgb(uint8(B)));
title('Compressed Image')