function process = process( image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
image2 = threshold(image, 'fixed', 100)
image3 = dilation(image2) - image2;
process = image3;
end

