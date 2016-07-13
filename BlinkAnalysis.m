filename = 'F:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename2 = 'F:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
filename3 = 'BlinkMinuteAverage';
filename4 = 'BlinkMinuteFrequency';

Participants = char('Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Suma','Shrikant','Ali','Haresh','Rohit','Sravan','Shweta','znana','Shruthi');

for k = 1:length(Participants)
    F1 = '';
    F2 = '';
    F3 = '';
    F4 = '';
    Participants(k,:)
    
    F1 = strcat(filename,Participants(k,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename2,Participants(k,:),'/Fresh/BlinkMinuteAnalysis.csv');
    F3 = strcat(filename3,Participants(k,:),'.jpg');
    F4 = strcat(filename4,Participants(k,:),'.jpg');
    DataDrowsy = dlmread(F1,',');
    DataFresh = dlmread(F2,',');

    AvgBlink = [DataDrowsy(1:55,1)/220 DataFresh(1:55,1)/220];
    BlinkFreq = [DataDrowsy(1:55,2) DataFresh(1:55,2)];

    bar(AvgBlink);
    xlabel('Minute');
    ylabel('Average Blink Rate(s)');
    title('Average Blink Rate Per Minute');
    
    saveas(gcf,F3);
    %print(F3,'-djpeg');
    
    bar(BlinkFreq);
    xlabel('Minute');
    ylabel('Average Blink Frequency');
    title('Average Blink Frequency Per Minute');
    
    saveas(gcf,F4);
    %print(F4,'-djpeg');
end