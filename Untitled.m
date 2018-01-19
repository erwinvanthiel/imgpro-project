blackwhite = calculate(imread('images/sc4.JPG'));
subplot(1,2,1);
imagesc(uint8(blackwhite));

%sc2
blackwhite = calculate(imread('images/vier.JPG'));
subplot(1,2,2);
imagesc(uint8(blackwhite));

%sc3
blackwhite = calculate(imread('images/renault.JPG'));
subplot(2,2,3);
imagesc(uint8(blackwhite));

%sc4
blackwhite = calculate(imread('images/sc3.JPG'));
subplot(2,2,4);
imagesc(uint8(blackwhite));