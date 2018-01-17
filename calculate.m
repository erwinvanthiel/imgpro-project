function calculate = calculate( image)

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

calculate = r2 .* g2 .* b2;


end

