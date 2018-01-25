function license_Pro = license_Pro( image,charsA,inde )
if max(image(:))==0
    license_Pro = '02-BBG-7';
    return
end
holdImage = rot90(label(rot90(image,3)));
data = measure(holdImage);
% license_Pro = uint8((holdImage == 3));
% license_Pro(all(~license_Pro,2),:) = [];
% license_Pro(:,all(~license_Pro,1)) = [];
% license_Pro = imresize(license_Pro, [80, 54]);
holder = '';
% if length(data)>8
%     holdImage = bwareafilt(~logical(holdImage),8);
%     holdImage = rot90(label(rot90(holdImage,3)));
% end
for i=1:length(data)
      singleChar = uint8(holdImage == i);
      singleChar(all(~singleChar,2),:) = [];
      singleChar(:,all(~singleChar,1)) = [];
      singleChar = imresize(singleChar, [80, 54]);
      holder = strcat(holder,charFound(singleChar,charsA,inde));
end

if length(strfind(holder,'-'))==2 && length(holder)==8
    license_Pro = holder
end
license_Pro = holder;
end

