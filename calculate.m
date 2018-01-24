function calculate = calculate( image)
tic
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

rlower = r<250;
rlower2 = r > 0.86*g;
rup = r>100;
r2 = rlower .* rup.* rlower2;

glower = g<230;
glower2 = g > 0.87*b + 50;
gup =  g>100;
g2 = gup.*glower.*glower2;

blower = b<140;
bup =  b>12;
blower2 = b < 0.9*r -15;
b2 = blower.*bup.*blower2;

calculate2 = r2 .* g2 .* b2;
calculate2 = uint8(opening(closing(calculate2,50),20));


calculate = cat(3,image(:,:,1).*uint8(calculate2), image(:,:,2).*uint8(calculate2), image(:,:,3).*uint8(calculate2));

%r = calculate(:,:,1);
%g = calculate(:,:,2);
%b = calculate(:,:,3);
%rup = r>130;
%r2 = rup;

%gup =  g>120;
%g2 = gup;

%calculate=r2.*g2.*b2;

calculate = rgb2gray(uint8(calculate));
calculate = (double(calculate)./double(max(calculate(:)))).*255;
calculate(all(~calculate,2),:) = [];
calculate(:,all(~calculate,1)) = []; 
calculate = threshold(calculate,'fixed',140);
firstC = uint8(calculate(20,:));
lastC = uint8(calculate(size(calculate,1)-20,:));
indexFirst = 0;
indexLast = 0;
for i=1:1:size(calculate,2)-1
    %firstC(i)
    if firstC(i) == 1
        indexFirst = i;
        break;
    end
end

for i=1:1:size(calculate,2)-1
    if lastC(i) == 1
        indexLast = i;
        break;
    end
end
deltay = indexLast - indexFirst;
deltax = size(calculate,1)-40;
angle = atan2(deltay,deltax)*180/pi;
calculate = imrotate(uint8(calculate),angle);
calculate(all(~calculate,2),:) = [];
calculate(:,all(~calculate,1)) = [];
calculate = label(uint8(calculate));
toc
end

