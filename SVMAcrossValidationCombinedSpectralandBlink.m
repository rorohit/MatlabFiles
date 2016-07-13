filenamex = 'AllVsAmplitudeper10_old_';
filename = 'E:/Muse Data 2016/'; %Madhuri/Drowsy/BlinkMinuteAnalysis.csv';
filename6 = 'E:/Muse Data 2016/'; %Madhuri/Fresh/BlinkMinuteAnalysis.csv';
indexes = 55;
testlabledataD = [];
testlabledataF = [];
FinaltestlabeldataD = [];
FinaltestlabeldataF = [];
lablecheck = [];
labledata = [];
matrix_avg = [];
finallablecheck1min = [];
finallabledata1min = [];
finallablecheck5min = [];
finallabledata5min = [];
finallablecheck3min = [];
finallabledata3min = [];
finallablecheck2min = [];
finallabledata2min = [];
finallablecheck4min = [];
finallabledata4min = [];
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;

Participants = char('Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Shobhit','Suma','Shrikant','Ali','Haresh','Krishna','Rohit','Sravan','Tarun','Shweta','drvlad','Deepak','znana','Piyesh','Shruthi','Aliya','Niel','Gopi');

FinalAccuracy = [];
FinalAccuracy2 = [];
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
        F2 = strcat(filename6,Participants(trainingind(z),:),'/Fresh/BlinkMinuteAnalysis.csv');
    
        DataDrowsy = dlmread(F1,',');
        DataFresh = dlmread(F2,',');
    
        AvgBlink = [[DataDrowsy(1:indexes,1)/220 DataDrowsy(1:indexes,2)];[DataFresh(1:indexes,1)/220 DataFresh(1:indexes,2)]];
        AvgBlink = [AvgBlink(1:50,:);AvgBlink(56:105,:)];
        %X = [X;AvgBlink];
        
        
        
        
        
        
        X = [];
        Alldatalable = [];
        X1 = [];
        Alldatalable1 = [];

        Accuracy = [];
        ProbEst = [];

        trainingindexes = setxor(1:length(NamesSubject),k)
        testingindexes = k;
        %for z = 1:length(trainingindexes)
        filename1 = strcat(filenamex,'fresh_',NamesSubject(trainingindexes(z),:));
        filename2 = strcat(filenamex,'Drowsy_',NamesSubject(trainingindexes(z),:));
        Y = csvread(filename1,1,1,[1,1,3000,3]);
        Z = csvread(filename2,1,1,[1,1,3000,3]);
        F = csvread(filename1,1,5,[1,5,3000,5]);
        W = csvread(filename2,1,5,[1,5,3000,5]);
        Q = csvread(filename1,1,7,[1,7,3000,9]);
        R = csvread(filename2,1,7,[1,7,3000,9]);
        S = csvread(filename1,1,11,[1,11,3000,15]);
        T = csvread(filename2,1,11,[1,11,3000,15]);
        n = 60;
        matrix_avg = [[S Q F Y];[T R W Z]];
        tmp = reshape(matrix_avg, [n prod(size(matrix_avg))/n]);
        tmp = mean(tmp);
        matrix_avg = reshape(tmp, [ size(matrix_avg,1)/n size(matrix_avg,2) ]);

        matrix_avg = [matrix_avg AvgBlink];
        
        X = [X;matrix_avg];

        
        for kk=1:100
            if kk<=50
                Alldatalable = [Alldatalable;1];
            else
                Alldatalable = [Alldatalable;2];
            end
        end
        %end
    
    
    %order = randperm(length(testing13));
    %testing13 = testing13(order,:);
    %testinglablenew13 = testinglablenew13(order,:);

        
        
        
        
        
        
        
        for i = 1:length(AvgBlink)
            if i<= indexes
                Label1 = [Label1;1];
            else
                Label1 = [Label1;2];
            end
        end
        Label2 = [Label2;Label1];
    end

    
    filename3 = strcat(filenamex,'fresh_',NamesSubject(testingindexes,:));
    filename4 = strcat(filenamex,'Drowsy_',NamesSubject(testingindexes,:));
    Y1 = csvread(filename3,1,1,[1,1,3000,3]);
    Z1 = csvread(filename4,1,1,[1,1,3000,3]);
    F1 = csvread(filename3,1,5,[1,5,3000,5]);
    W1 = csvread(filename4,1,5,[1,5,3000,5]);
    Q1 = csvread(filename3,1,7,[1,7,3000,9]);
    R1 = csvread(filename4,1,7,[1,7,3000,9]);
    S1 = csvread(filename3,1,11,[1,11,3000,15]);
    T1 = csvread(filename4,1,11,[1,11,3000,15]);

    X1 = [[S1 Q1 F1 Y1];[T1 R1 W1 Z1]];

    n = 60;
    tmp = reshape(X1, [n prod(size(X1))/n]);
    tmp = mean(tmp);
    X1 = reshape(tmp, [ size(X1,1)/n size(X1,2) ]);

    for kk=1:100
        if kk<=50
            Alldatalable1 = [Alldatalable1;1];
        else
            Alldatalable1 = [Alldatalable1;2];
        end
    end

    
    
    
    F1 = strcat(filename,Participants(testingind,:),'/Drowsy/BlinkMinuteAnalysis.csv');
    F2 = strcat(filename6,Participants(testingind,:),'/Fresh/BlinkMinuteAnalysis.csv');
    
    
    DataDrowsy2 = dlmread(F1,',');
    DataFresh2 = dlmread(F2,',');
    
    AvgBlink2 = [[DataDrowsy2(1:indexes,1)/220 DataDrowsy2(1:indexes,2)];[DataFresh2(1:indexes,1)/220 DataFresh2(1:indexes,2)]];
    AvgBlink2 = [AvgBlink2(1:50,:);AvgBlink2(56:105,:)];

    X1 = [X1 AvgBlink2];
    for i = 1:length(AvgBlink2)
        if i<= indexes
            Label3 = [Label3;1];
        else
            Label3 = [Label3;2];
        end
    end
    

    
        training13 = X;
        testing13 = X1;

        traininglablenew13 = Alldatalable;
        testinglablenew13 = Alldatalable1;

    
    
    
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

    Accuracy = (1 - (sum(abs(testinglablenew13 - predict_label))/length(predict_label)))*100;
    %userAccuracy = [userAccuracy;Accuracy];
    FinalAccuracy = [FinalAccuracy Accuracy];
    FinalAccuracy2 = [FinalAccuracy2 accuracy];
    %AvgBlink = [DataDrowsy(1:55,1)/220 DataFresh(1:55,1)/220];
    %BlinkFreq = [DataDrowsy(1:55,2) DataFresh(1:55,2)];
    testlabledataD = [];
    testlabledataF = [];
    for t = 1:50
        if(abs(predict_label(t) - testinglablenew13(t))>0)
            testlabledataF = [testlabledataF;1];
        else
            testlabledataF = [testlabledataF;0];
        end
        if(abs(predict_label(t+50) - testinglablenew13(t+50))>0)
            testlabledataD = [testlabledataD;1];
        else
            testlabledataD = [testlabledataD;0];
        end
    end
    
    FinaltestlabeldataD = [FinaltestlabeldataD testlabledataD];
    FinaltestlabeldataF = [FinaltestlabeldataF testlabledataF];
    
   
end
%csvwrite('SVMFinalAccuracyBlinkCrossValidation.csv',FinalAccuracy);
%csvwrite('SVMFinalLabelBlinkCrossValidationD.csv',FinaltestlabeldataD);
%csvwrite('SVMFinalLabelBlinkCrossValidationF.csv',FinaltestlabeldataF);

%bar(FinalAccuracy);

%set(gca,'XTickLabel',{'Shashank','Pravija','Masahiro','Madhuri','Bhaskar','Suma','Shrikant','Ali','Haresh','Rohit','Sravan','Shweta','znana','Shruthi'});
%,{}

%ylabel('Percentages');

%xlabel('Participants');
%title('CrossValidation SVM Results');
%saveas(gcf,'BlinksCrossValidation.jpg')
