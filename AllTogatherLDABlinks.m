filename = 'E:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename2 = 'E:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
indexes = 55;

Participants = char('Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Suma','Shrikant','Ali','Haresh','Rohit','Sravan','Shweta','znana','Shruthi');
X = [];
Label2 = [];
FinalAccuracy = [];
for k = 1:length(Participants)
    Label1 = [];
        
    F1 = strcat(filename,Participants(k,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename2,Participants(k,:),'/Fresh/BlinkMinuteAnalysis.csv');
    
    DataDrowsy = dlmread(F1,',');
    DataFresh = dlmread(F2,',');
    
    AvgBlink = [[DataDrowsy(1:indexes,1)/220 DataDrowsy(1:indexes,2)];[DataFresh(1:indexes,1)/220 DataFresh(1:indexes,2)]];
    X = [X;AvgBlink];
    for i = 1:length(AvgBlink)
        if i<= indexes
            Label1 = [Label1;1];
        else
            Label1 = [Label1;2];
        end
    end
    Label2 = [Label2;Label1];
end
LDAAccuracy = [];
for ii = 1:8
        
    testing_ind = [];
    training_ind = [];
    for i=1:length(Label2)
        if rand>0.8
            testing_ind = [testing_ind,i];
        end
    end
    
    training_ind = setxor(1:length(Label2),testing_ind);
    training13 = X(training_ind,:);
    testing13 = X(testing_ind,:);
    traininglablenew13 = Label2(training_ind,:);
    testinglablenew13 = Label2(testing_ind,:);
    
    %order = randperm(length(testing13));

    %testing13 = testing13(order,:);

    %testinglablenew13 = testinglablenew13(order,:);


    %order = randperm(length(training13));
    %training13 = training13(order,:);
    %traininglablenew13 = traininglablenew13(order,:);

    Attributes = training13(:,1:2);
    Classes = traininglablenew13(:,1);
    Attributes1 = testing13(:,1:2);
    Classes1 = testinglablenew13(:,1);

    train = 1:length(training13);
    test = 1:length(testing13);
    obj = fitcdiscr(training13,traininglablenew13,'DiscrimType','pseudolinear');
    %obj.DiscrimType = 'quadratic';

    [predict_label,score,cost] = predict(obj,testing13);
    Accuracy = (1 - (sum(abs(testinglablenew13 - predict_label))/length(predict_label)))*100;
    LDAAccuracy = [LDAAccuracy;Accuracy];
end
%AvgBlink = [DataDrowsy(1:55,1)/220 DataFresh(1:55,1)/220];
%BlinkFreq = [DataDrowsy(1:55,2) DataFresh(1:55,2)];

   


boxplot(LDAAccuracy,{'LDA'});
ylabel('Percentages');
xlabel('Techniques');
title('All Togather LDA Results 80-20 Training & Testing');
saveas(gcf,'AllTogatherLDAResults80-20Blinks.jpg')
