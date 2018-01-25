blackwhite = license_Pro(calculate(imread('images/sc4.JPG')));
subplot(2,2,1);
imagesc(uint8(blackwhite));
%sc2
blackwhite = license_Pro(calculate(imread('images/sc2.JPG')));
subplot(2,2,2);
imagesc(uint8(blackwhite));

%sc3
blackwhite = license_Pro(calculate(imread('images/een.JPG')));
subplot(2,2,3);
imagesc(uint8(blackwhite));

%sc4
blackwhite = license_Pro(calculate(imread('images/sc4.JPG')));
subplot(2,2,4);
imagesc(uint8(blackwhite));