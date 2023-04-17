clc;
close all;
clear all;

% Load the image
image = imread('example_image.jpg');

% Convert the image to grayscale if needed
image = rgb2gray(image);


% Calculate the probability distribution of pixel intensities
num_pixels = numel(image);
pixel_counts = zeros(1, 256); % Initialize an array to store pixel counts for each intensity level

% count the occurrences of each intensity level
for i = 1 : num_pixels
    intensity = image(i);
    pixel_counts(intensity + 1) = pixel_counts(intensity + 1) + 1;
end

% Convert pixel counts to probabilities
pixel_probs = pixel_counts / num_pixels; % Probability of each intensity

% Remove zero probabilities
pixel_probs(pixel_probs == 0) = [];

% Calculate entropy
entropy = -sum(pixel_probs .* log2(pixel_probs));

disp(['Entropy of the image: ' num2str(entropy)]);
