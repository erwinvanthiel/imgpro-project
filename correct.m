function final = correct( plate )
indeces = strfind(plate,'8');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'alpha')==1
                    plate(indeces(i)) = 'B';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'alpha')==1
                    plate(indeces(i)) = 'B';
                end
            end
        end
        
        indeces = strfind(plate,'5');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'alpha')==1
                    plate(indeces(i)) = 'S';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'alpha')==1
                    plate(indeces(i)) = 'S';
                end
            end
        end    
        indeces = strfind(plate,'S');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'digit')==1
                    plate(indeces(i)) = '5';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'digit')==1
                    plate(indeces(i)) = '5';
                end
            end
        end 
        indeces = strfind(plate,'B');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'digit')==1
                    plate(indeces(i)) = '8';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'digit')==1
                    plate(indeces(i)) = '8';
                end
            end
        end 
        
         indeces = strfind(plate,'0');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'alpha')==1
                    plate(indeces(i)) = 'D';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'alpha')==1
                    plate(indeces(i)) = 'D';
                end
            end
        end    
        indeces = strfind(plate,'D');
        for i=1:1:length(indeces)
            if indeces(i) > 1
                if isstrprop(plate(indeces(i)-1),'digit')==1
                    plate(indeces(i)) = '0';
                end
            end
            if indeces(i) < length(plate)
                if isstrprop(plate(indeces(i)+1),'digit')==1
                    plate(indeces(i)) = '0';
                end
            end
        end 
final = plate;
end

