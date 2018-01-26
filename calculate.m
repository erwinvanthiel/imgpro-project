function calculate = calculate( image)
tic

r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

rlower = r<230;
rlower2 = r > 0.86*g;
rup = r>40;
r2 = rlower .* rup.* rlower2;

glower = g<230;
glower2 = g > 0.87*b + 50;
gup =  g>40;
g2 = gup.*glower.*glower2;

blower = b<140;
bup =  b>0;
blower2 = b < 0.9*r -15;
b2 = blower.*bup.*blower2;

calculate2 = r2 .* g2 .* b2;

calculate = uint8(closing(calculate2,45));

calculate = bwareafilt(logical(calculate),1);



calculate = cat(3,image(:,:,1).*uint8(calculate), image(:,:,2).*uint8(calculate), image(:,:,3).*uint8(calculate));

calculate = rgb2gray(uint8(calculate));
if double(max(calculate(:)))==0 
        calculate = zeros(100,100);
   return
end   
calculate = (double(calculate)./double(max(calculate(:)))).*255; 
calculate(all(~calculate,2),:) = [];
calculate(:,all(~calculate,1)) = []; 
calculate = threshold(calculate,'fixed',140);
if size(calculate,1) < 21 | size(calculate,2) < 21
    calculate = zeros(100,100);
   return
end
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
calculate = uint8(opening(uint8(calculate),3));
rowbound = floor(size(calculate,1)/6);
columnbound = floor(size(calculate,1)/9);
calculate = calculate(rowbound:size(calculate,1)-rowbound, columnbound:size(calculate,2)-columnbound);
calculate = bwareafilt(~logical(calculate),8);
% blankimage = ones(size(calculate)).*255;
% calculate = cat(3,uint8(blankimage).*calculate,uint8(blankimage).*calculate,uint8(blankimage).*calculate);
toc
end

