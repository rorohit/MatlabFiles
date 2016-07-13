filename = 'E:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename2 = 'E:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
indexes = 55;
testlabledataD = [];
testlabledataF = [];
FinaltestlabeldataD = [];
FinaltestlabeldataF = [];


Participants = char('Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Shobhit','Suma','Shrikant','Ali','Haresh','Krishna','Rohit','Sravan','Tarun','Shweta','drvlad','Deepak','znana','Piyesh','Shruthi','Aliya','Niel','Gopi');

FinalAccuracy = [];
for k = 1:length(Participants)
    Label1 = [];
    Label2 = [];
    X = [];
    X1 = [];
    Label3 = [];
    Label4 = [];
    testingind = k;
    trainingind = setxor(1:length(Participants),k)
    
    for z = 1:length(trainingind)
        F1 = strcat(filename,Participants(trainingind(z),:),'/Drowsy/BlinkMinuteAnalysis.csv');
        F2 = strcat(filename2,Participants(trainingind(z),:),'/Fresh/BlinkMinuteAnalysis.csv');
    
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
    
    F1 = strcat(filename,Participants(testingind,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename2,Participants(testingind,:),'/Fresh/BlinkMinuteAnalysis.csv');
    
    
    DataDrowsy2 = dlmread(F1,',');
    DataFresh2 = dlmread(F2,',');
    
    AvgBlink2 = [[DataDrowsy2(1:indexes,1)/220 DataDrowsy2(1:indexes,2)];[DataFresh2(1:indexes,1)/220 DataFresh2(1:indexes,2)]];
    X1 = AvgBlink2;
    for i = 1:length(AvgBlink2)
        if i<= indexes
            Label3 = [Label3;1];
        else
            Label3 = [Label3;2];
        end
    end
    
    
    
    userAccuracy = [];
    %for ii = 1:8
        
    training13 = X(:,:);
    testing13 = X1(:,:);
    traininglablenew13 = Label2(:,:);
    testinglablenew13 = Label3(:,:);
    
    order = randperm(length(testing13));
    testing13 = testing13(order,:);

    testinglablenew13 = testinglablenew13(order,:);
    order = randperm(length(training13));
    training13 = training13(order,:);
    traininglablenew13 = traininglablenew13(order,:);

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
    %userAccuracy = [userAccuracy;Accuracy];
    FinalAccuracy = [FinalAccuracy Accuracy];
    %AvgBlink = [DataDrowsy(1:55,1)/220 DataFresh(1:55,1)/220];
    %BlinkFreq = [DataDrowsy(1:55,2) DataFresh(1:55,2)];
    testlabledataD = [];
    testlabledataF = [];
    for t = 1:55
        if(abs(predict_label(t) - testinglablenew13(t))>0)
            testlabledataF = [testlabledataF;1];
        else
            testlabledataF = [testlabledataF;0];
        end
        if(abs(predict_label(t+55) - testinglablenew13(t+55))>0)
            testlabledataD = [testlabledataD;1];
        else
            testlabledataD = [testlabledataD;0];
        end
    end
    
    FinaltestlabeldataD = [FinaltestlabeldataD testlabledataD];
    FinaltestlabeldataF = [FinaltestlabeldataF testlabledataF];
    
   
end
csvwrite('LDAFinalAccuracyBlinkCrossValidation.csv',FinalAccuracy);
csvwrite('LDAFinalLabelBlinkCrossValidationD.csv',FinaltestlabeldataD);
csvwrite('LDAFinalLabelBlinkCrossValidationF.csv',FinaltestlabeldataF);

bar(FinalAccuracy);
set(gca,'XTickLabel',{'Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Suma','Shrikant','Ali','Haresh','Rohit','Sravan','Shweta','znana','Shruthi'});
%,{}
ylabel('Percentages');
xlabel('Participants');
title('CrossValidation LDA Results');
saveas(gcf,'BlinksCrossValidation.jpg')
