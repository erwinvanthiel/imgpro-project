function charFound = charFound(image,charsA,inde)

counter = 0;
index = 0;
for i=1:length(charsA)
    charImage = ~xor(charsA{i},image);
    match = sum(charImage(:));
    if match>counter
        counter = match;
        index = i;
    end
end

charFound = inde(index);

end

