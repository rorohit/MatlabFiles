filename = 'F:/Muse Data 2016/Madhuri/Drowsy/EEG.csv';
filenameFinal = 'F:/Muse Data 2016/Madhuri/Drowsy/GaussianFilteredEEG.csv';
Data = dlmread(filename,',');

sigma = 3;
size = 160;

x = linspace(-size / 2, size / 2, size);
gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter); % normalize

newData = Data(:,2) - mean(Data(:,2));
newData2 = [];
length(Data)
for i = 1:length(Data)
    if Data(i,2) > (mean(Data(:,2))+sigma*(size/2))
        newData2 = [newData2;mean(Data(:,2))];
    elseif Data(i,2) < (mean(Data(:,2))-sigma*(size/2))
        newData2 = [newData2;mean(Data(:,2))];
    else
        newData2 = [newData2;Data(i,2)];
    end
end
        
%yfilt = conv (newData, gaussFilter, 'same');

newData = [Data(:,2) newData newData2];

csvwrite(filenameFinal,newData);
