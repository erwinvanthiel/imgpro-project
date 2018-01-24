blackwhite = calculate(imread('images/bmw.JPG'));
subplot(2,2,1);
imagesc(uint8(blackwhite));
%disp('1')
%sc2
blackwhite = calculate(imread('images/twee.JPG'));
subplot(2,2,2);
imagesc(uint8(blackwhite));

%sc3
blackwhite = calculate(imread('images/een.JPG'));
subplot(2,2,3);
imagesc(uint8(blackwhite));

%sc4
blackwhite = calculate(imread('images/sc4.JPG'));
subplot(2,2,4);
imagesc(uint8(blackwhite));