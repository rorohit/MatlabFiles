filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
length(NamesSubject)
AccuracySVMIndi1123 = [];
AccuracySVMIndi1123Final = [];
finallablecheck2 = [];
finallabledata2 = [];
X = [];
Alldatalable = [];
X1 = [];
Alldatalable1 = [];
Accuracy = [];
ProbEst = [];
testlablefinalD = [];
testlablefinalF = [];
testlabledataD = [];
testlabledataF = [];
filename3 = 'E:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename4 = 'E:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
indexes = 55;
testlabledataD = [];
testlabledataF = [];
FinaltestlabeldataD = [];
FinaltestlabeldataF = [];
FinalAccuracy = [];
FinalAccuracy2 = [];

    
testing_ind = [];

for k = 1:23    
    filename1 = strcat(filename,'fresh_',NamesSubject(k,:));
    filename2 = strcat(filename,'Drowsy_',NamesSubject(k,:));
    Y = csvread(filename1,1,1,[1,1,3000,3]);
    Z = csvread(filename2,1,1,[1,1,3000,3]);
    F = csvread(filename1,1,5,[1,5,3000,5]);
    W = csvread(filename2,1,5,[1,5,3000,5]);
    Q = csvread(filename1,1,7,[1,7,3000,9]);
    R = csvread(filename2,1,7,[1,7,3000,9]);
    S = csvread(filename1,1,11,[1,11,3000,15]);
    T = csvread(filename2,1,11,[1,11,3000,15]);
        
    X = [[S Q F Y];[T R W Z]];
    n = 60;
    tmp = reshape(X, [n prod(size(X))/n]);
    tmp = mean(tmp);
    matrix_avg = reshape(tmp, [ size(X,1)/n size(X,2) ]);
    
        
%     for kk=1:100
%         if kk<=50
%             Alldatalable = [Alldatalable;1];
%         else
%             Alldatalable = [Alldatalable;2];
%         end
%     end

    
    
    
    
    
    Label1 = [];
    %Participants(k,:)    
    F1 = strcat(filename3,Participants(k,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename4,Participants(k,:),'/Fresh/BlinkMinuteAnalysis.csv');
    
    DataDrowsy = dlmread(F1,',');
    DataFresh = dlmread(F2,',');
    
    AvgBlink = [[DataDrowsy(1:indexes,1)/220 DataDrowsy(1:indexes,2)];[DataFresh(1:indexes,1)/220 DataFresh(1:indexes,2)]];
    
    AvgBlink = [AvgBlink(1:50,:);AvgBlink(56:105,:)];
    AvgBlink = [matrix_avg AvgBlink];
    for i = 1:length(AvgBlink)
        if i<= 50
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

        testing_indexes_Fresh = randperm(50,10);
        testing_indexes_Drowsy = 50 + randperm(50,10);
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

        Attributes = training13(:,1:14);
        Classes = traininglablenew13(:,1);
        Attributes1 = testing13(:,1:14);
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
        for t = 1:10
            if(abs(predict_label(t) - testinglablenew13(t))>0)
                testlabledataF = [testlabledataF;1];
            else
                testlabledataF = [testlabledataF;0];
            end
            if(abs(predict_label(t+10) - testinglablenew13(t+10))>0)
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

    
    
    
    
    
    
    
    
    
%     for q = 1:8
% 
%         testing_ind = [];
% %         for i=1:length(X)
% %             if rand>0.8
% %                 testing_ind = [testing_ind,i];
% %             end
% %         end
%         testing_indexes_Fresh = randperm(3000,600);
%         testing_indexes_Drowsy = 3000 + randperm(3000,600);
%         testing_ind = [testing_indexes_Fresh;testing_indexes_Drowsy];
%         training_ind = setxor(1:length(X),testing_ind);    
%         training13 = X(training_ind,:);
%         testing13 = X(testing_ind,:);
%         traininglablenew13 = Alldatalable(training_ind,:);
%         testinglablenew13 = Alldatalable(testing_ind,:);
% 
% %         order = randperm(length(testing13));
% %         testing13 = testing13(order,:);
% %         testinglablenew13 = testinglablenew13(order,:);
% 
%         order = randperm(length(training13));
%         training13 = training13(order,:);
%         traininglablenew13 = traininglablenew13(order,:);
% 
%         Attributes = training13(:,1:12);
%         Classes = traininglablenew13(:,1);
%         Attributes1 = testing13(:,1:12);
%         Classes1 = testinglablenew13(:,1);
% 
%         train = 1:length(training13);
%         test = 1:length(testing13);
%         model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0 -g 3 -d 5');
% 
%         [predict_label, accuracy, prob_estimates] = svmpredict(Classes1(test),Attributes1(test,:), model);
%         
% %         testing_index_count_Drowsy = 0;
% %         testing_index_count_Fresh = 0;
% %         WrongClassification_Drowsy = 0;
% %         for j = 1:length(testing_ind)
% %             if(testing_ind(j)<=3000)
% %                 testing_index_count_Drowsy = testing_index_count_Drowsy + 1;
% %                 if(abs(predict_label(j) - testinglablenew13(j))>0)
% %                     WrongClassification_Drowsy = WrongClassification_Drowsy + 1;
% %                 end
% %             else
% %                 testing_index_count_Fresh = testing_index_count_Fresh + 1;
% %                 if(abs(predict_label(j) - testinglablenew13(j))>0)
% %                     WrongClassification_Fresh = WrongClassification_Fresh + 1;
% %                 end
% %             end
% %         end
% %         TruePositive = testing_index_count_Drowsy - 
%         
%         testlabledataD = [];
%         testlabledataF = [];
%         for t = 1:600
%             if(abs(predict_label(t) - testinglablenew13(t))>0)
%                 testlabledataF = [testlabledataF;1];
%             else
%                 testlabledataF = [testlabledataF;0];
%             end
%             if(abs(predict_label(t+600) - testinglablenew13(t+600))>0)
%                 testlabledataD = [testlabledataD;1];
%             else
%                 testlabledataD = [testlabledataD;0];
%             end
%         end
%         
%         
%         
%         
%         AccuracySVMIndi1123 = [AccuracySVMIndi1123 accuracy];
%     end
%     AccuracySVMIndi1123 = AccuracySVMIndi1123.';
%     
%     AccuracySVMIndi1123Final = [AccuracySVMIndi1123Final AccuracySVMIndi1123(:,1)];
%     
%     AccuracySVMIndi1123 = [];
%     
%     testlablefinalD = [testlablefinalD testlabledataD];
%     testlablefinalF = [testlablefinalF testlabledataF];
end 