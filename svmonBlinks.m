filename = 'E:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename2 = 'E:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
indexes = 55;
testlabledataD = [];
testlabledataF = [];
FinaltestlabeldataD = [];
FinaltestlabeldataF = [];

Participants = char('Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Shobhit','Suma','Shrikant','Ali','Haresh','Krishna','Rohit','Sravan','Tarun','Shweta','drvlad','Deepak','znana','Piyesh','Shruthi','Aliya','Niel','Gopi');

FinalAccuracy = [];
FinalAccuracy2 = [];

for k = 1:length(Participants)
    Label1 = [];
    %Participants(k,:)    
    F1 = strcat(filename,Participants(k,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename2,Participants(k,:),'/Fresh/BlinkMinuteAnalysis.csv');
    
    DataDrowsy = dlmread(F1,',');
    DataFresh = dlmread(F2,',');
    
    AvgBlink = [[DataDrowsy(1:indexes,1)/220 DataDrowsy(1:indexes,2)];[DataFresh(1:indexes,1)/220 DataFresh(1:indexes,2)]];
    
    for i = 1:length(AvgBlink)
        if i<= indexes
            Label1 = [Label1;1];
        else
            Label1 = [Label1;2];
        end
    end
    
    userAccuracy = [];
    userAccuracy2 = [];
    for ii = 1:8
        
        testing_ind = [];
        training_ind = [];
%         for i=1:length(Label1)
%             if rand>0.8
%                 testing_ind = [testing_ind,i];
%             end
%         end

        testing_indexes_Fresh = randperm(55,11);
        testing_indexes_Drowsy = 55 + randperm(55,11);
        testing_ind = [testing_indexes_Fresh;testing_indexes_Drowsy];
        %training_ind = setxor(1:length(X),testing_ind);    
        %training13 = X(training_ind,:);
        %testing13 = X(testing_ind,:);
        %traininglablenew13 = Alldatalable(training_ind,:);
        %testinglablenew13 = Alldatalable(testing_ind,:);
        
        training_ind = setxor(1:length(Label1),testing_ind);
    
        training13 = AvgBlink(training_ind,:);
        testing13 = AvgBlink(testing_ind,:);
        traininglablenew13 = Label1(training_ind,:);
        testinglablenew13 = Label1(testing_ind,:);
    
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
        %obj = fitcdiscr(training13,traininglablenew13,'DiscrimType','pseudolinear');
        %obj.DiscrimType = 'quadratic';

        %[predict_label,score,cost] = predict(obj,testing13);
        
        model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0');

        [predict_label, accuracy, prob_estimates] = svmpredict(Classes1(test),Attributes1(test,:), model);
        
        
        testlabledataD = [];
        testlabledataF = [];
        for t = 1:11
            if(abs(predict_label(t) - testinglablenew13(t))>0)
                testlabledataF = [testlabledataF;1];
            else
                testlabledataF = [testlabledataF;0];
            end
            if(abs(predict_label(t+11) - testinglablenew13(t+11))>0)
                testlabledataD = [testlabledataD;1];
            else
                testlabledataD = [testlabledataD;0];
            end
        end
  
        

        Accuracy = (1 - (sum(abs(testinglablenew13 - predict_label))/length(predict_label)))*100;
        userAccuracy = [userAccuracy;Accuracy];
        userAccuracy2 = [userAccuracy;accuracy];

    end
    FinalAccuracy = [FinalAccuracy userAccuracy];
    FinalAccuracy2 = [FinalAccuracy2 userAccuracy2];
    %AvgBlink = [DataDrowsy(1:55,1)/220 DataFresh(1:55,1)/220];
    %BlinkFreq = [DataDrowsy(1:55,2) DataFresh(1:55,2)];
    FinaltestlabeldataD = [FinaltestlabeldataD testlabledataD];
    FinaltestlabeldataF = [FinaltestlabeldataF testlabledataF];
    

   
end
csvwrite('SVMFinalAccuracyBlinkIndividual.csv',FinalAccuracy);
csvwrite('SVMFinalLabelBlinkIndividualD.csv',FinaltestlabeldataD);
csvwrite('SVMFinalLabelBlinkIndividualF.csv',FinaltestlabeldataF);

boxplot(FinalAccuracy,{'Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Shobhit','Suma','Shrikant','Ali','Haresh','Krishna','Rohit','Sravan','Tarun','Shweta','drvlad','Deepak','znana','Piyesh','Shruthi','Aliya','Niel','Gopi'});
ylabel('Percentages');
xlabel('Participants');
title('Individual SVM Results 80-20 Training & Testing');
%saveas(gcf,'IndividualLDAResults80-20.jpg')
