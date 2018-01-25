function license_Pro = license_Pro( image )


license_Pro = rot90(label(rot90(~threshold(rgb2gray(image)),3)));

data = measure(license_Pro);
size(data)

for i=1:length(data)
    data(i)
%     singleChar = uint8(license_Pro == i);
%     if sum(data(i)
%     singleChar(all(~singleChar,2),:) = [];
%     singleChar(:,all(~singleChar,1)) = [];
%     dip_image(singleChar)
end


end

