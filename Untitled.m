image3 = imread('images/sc1.JPG');
image4 = bilateralf(imread('images/sc2.JPG'));
image5 = bilateralf(imread('images/sc3.JPG'));
image6 = imread('images/sc4.JPG');

blackwhite = calculate(imread('images/sc1.JPG'));
subplot(2,2,1);
imagesc(uint8(blackwhite));

%sc2
blackwhite = calculate(imread('images/sc2.JPG'));
subplot(2,2,2);
imagesc(uint8(blackwhite));

%sc3
blackwhite = calculate(imread('images/vier.JPG'));
subplot(2,2,3);
imagesc(uint8(blackwhite));

%sc4
blackwhite = calculate(imread('images/sc3.JPG'));
subplot(2,2,4);
imagesc(uint8(blackwhite));