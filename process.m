function process = process( image )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
image2 = imread('images/yellow16.jpg');
image4 = imread('images/yelllow13.jpg');
image5 = imread('images/yellow12.jpg');
image6 = imread('images/yellow14.jpg');
image7 = imread('images/background3.jpg');
image3 = imread('images/sc1.JPG');

r = image3(:,:,1);
g = image3(:,:,2);
b = image3(:,:,3);

rlower = r<214;
rup = r>196;
r = rlower .* rup;

glower = g<160;
gup =  g>146;
g = gup.*glower;

blower = b<72;
bup =  b>54;
b = blower.*bup;

blackwhite = r .* g .* b;

red = image2(:,:,1);
green = image2(:,:,2);
blue = image2(:,:,3);

red4 = image4(:,:,1);
green4 = image4(:,:,2);
blue4 = image4(:,:,3);

red5 = image5(:,:,1);
green5 = image5(:,:,2);
blue5 = image5(:,:,3);

red6 = image6(:,:,1);
green6 = image6(:,:,2);
blue6 = image6(:,:,3);

redb = image7(:,:,1);
greenb = image7(:,:,2);
blueb = image7(:,:,3);

subplot(2,2,1);
scatter(red(:),blue(:),'+');
title('X: Red, Y: Blue');
hold on
scatter(red4(:),blue4(:),'+');
hold on 
scatter(red5(:),blue5(:),'+');
hold on
scatter(red6(:),blue6(:),'+');
hold on
scatter(redb(:),blueb(:),'+');
hold off


subplot(2,2,2);
scatter(green(:),red(:),'+');
title('X: Green, Y: Red');
hold on
scatter(green4(:),red4(:),'+');
hold on 
scatter(green5(:),red5(:),'+');
hold on
scatter(green6(:),red6(:),'+');
hold on
scatter(greenb(:),redb(:),'+');
hold off

subplot(2,2,3);
scatter(blue(:),green(:),'+');
title('X: Blue, Y: Green');
hold on
scatter(blue4(:),green4(:),'+');
hold on 
scatter(blue5(:),green5(:),'+');
hold on
scatter(blue6(:),green6(:),'+');
hold on
scatter(blueb(:),greenb(:),'+');
hold off


%image2 = bilateralf(image);
process = uint8(image);
end

