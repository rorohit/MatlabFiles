filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
%,
length(NamesSubject)
lablecheck = [];
labledata = [];
finallablecheck = [];
finallabledata = [];
for k = 1:length(NamesSubject)
    X = [];
    Alldatalable = [];
    X1 = [];
    Alldatalable1 = [];

    Accuracy = [];
    ProbEst = [];

    trainingindexes = setxor(1:length(NamesSubject),k)
    testingindexes = k;
    for z = 1:length(trainingindexes)
        filename1 = strcat(filename,'fresh_',NamesSubject(trainingindexes(z),:));
        filename2 = strcat(filename,'Drowsy_',NamesSubject(trainingindexes(z),:));
        Y = csvread(filename1,1,1,[1,1,3000,11]);
        Z = csvread(filename2,1,1,[1,1,3000,11]);
        %F = csvread(filename1,1,3,[1,3,3000,5]);
        %W = csvread(filename2,1,3,[1,3,3000,5]);
        Q = csvread(filename1,1,13,[1,13,3000,15]);
        R = csvread(filename2,1,13,[1,13,3000,15]);
        
        X = [X;[[Q Y];[R Z]]];
        
        
        for kk=1:6000
            if kk<=length(Y)
                Alldatalable = [Alldatalable;1];
            else
                Alldatalable = [Alldatalable;2];
            end
        end
    end
    filename3 = strcat(filename,'fresh_',NamesSubject(testingindexes,:));
    filename4 = strcat(filename,'Drowsy_',NamesSubject(testingindexes,:));
    Y1 = csvread(filename3,1,1,[1,1,3000,11]);
    Z1 = csvread(filename4,1,1,[1,1,3000,11]);
%     F1 = csvread(filename3,1,3,[1,3,3000,5]);
%     W1 = csvread(filename4,1,3,[1,3,3000,5]);
    Q1 = csvread(filename3,1,13,[1,13,3000,15]);
    R1 = csvread(filename4,1,13,[1,13,3000,15]);
        
    X1 = [[Q1 Y1];[R1 Z1]];
     
        
    for kk=1:6000
        if kk<=length(Y)
            Alldatalable1 = [Alldatalable1;1];
        else
            Alldatalable1 = [Alldatalable1;2];
        end
    end
    
    training13 = X;
    testing13 = X1;

    traininglablenew13 = Alldatalable;
    testinglablenew13 = Alldatalable1;
    
    %order = randperm(length(testing13));
    %testing13 = testing13(order,:);
    %testinglablenew13 = testinglablenew13(order,:);
    
    Attributes = training13(:,1:14);
    Classes = traininglablenew13(:,1);

    Attributes1 = testing13(:,1:14);
    Classes1 = testinglablenew13(:,1);

    train = 1:length(training13);
    test = 1:length(testing13);

    %model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0');
    
    o1 = fitNaiveBayes(Attributes(train,:),Classes(train));
    C1 = o1.predict(Attributes1(test,:));
    
    cMat1 = confusionmat(Classes1(test),C1)
    Accuracy = (cMat1(1,1)+cMat1(2,2))/(cMat1(1,1)+cMat1(1,2)+cMat1(2,1)+cMat1(2,2))

% Correct Classification @ more than 70% is True Positive
% Correct Classification @ more than 30% and less than 70% is Not
% Conclusive
%Correct Classification @ less than 30% is False Positive

%
end


        
%count=1;
%lablecheck = [];
%value=0;
%labledata = [];
%for j=1:length(testinglablenew13)
%    if abs(testinglablenew13(j) - predict_label(j))>0:
%        lablecheck = [lablecheck;1];
%        value = value + 1;
%    else
%        lablecheck = [lablecheck;0];
%    end
%    if count == 60:
%        labledata = [labledata;value];
%        value=0;
%        count=0;
%    end
%    count = count + 1;
%end
        
