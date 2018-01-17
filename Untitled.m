image3 = imread('images/sc1.JPG');
image4 = bilateralf(imread('images/sc2.JPG'));
image5 = bilateralf(imread('images/sc3.JPG'));
image6 = imread('images/sc4.JPG');

blackwhite = calculate(imread('images/een.JPG'));
subplot(2,2,1);
imagesc(uint8(blackwhite));

%sc2
blackwhite = calculate(imread('images/twee.JPG'));
subplot(2,2,2);
imagesc(uint8(blackwhite));

%sc3
imagex = imread('images/drie.JPG');
blackwhite = calculate(imread('images/drie.JPG'));
imagexx = cat(3,imagex(:,:,1).*uint8(blackwhite), imagex(:,:,2).*uint8(blackwhite), imagex(:,:,3).*uint8(blackwhite));
subplot(2,2,3);
imagesc(uint8(imagexx));

%sc4
blackwhite = calculate(imread('images/vier.JPG'));
subplot(2,2,4);
imagesc(uint8(blackwhite));