function process = process( image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here

image2 = threshold(image, 'fixed', 50)

process = uint8(image2);

end

