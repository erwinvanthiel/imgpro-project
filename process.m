function process = process( image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
image2 = threshold(image, 'fixed', 100)
image3 = dilation(image2) - image2;
image4 = image - erosion(image);
image5 = label(image<80) - label(image < 40)
image6 = image5==1;
process = image5 - image6
end

