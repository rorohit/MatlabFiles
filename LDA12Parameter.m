filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
length(NamesSubject)
AccuracyLDAIndi1123 = [];
AccuracyLDAIndi1123Final = [];
finallablecheck2 = [];
finallabledata2 = [];
X = [];
Alldatalable = [];
X1 = [];
Alldatalable1 = [];
accuracy = [];
ProbEst = [];
testlablefinalD = [];
testlablefinalF = [];
testlabledataD = [];
testlabledataF = [];
    
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
        
        
    for kk=1:6000
        if kk<=length(Y)
            Alldatalable = [Alldatalable;1];
        else
            Alldatalable = [Alldatalable;2];
        end
    end

    for q = 1:8

        testing_ind = [];
%         for i=1:length(X)
%             if rand>0.8
%                 testing_ind = [testing_ind,i];
%             end
%         end
%         training_ind = setxor(1:length(X),testing_ind);    
%         training13 = X(training_ind,:);
%         testing13 = X(testing_ind,:);
%         traininglablenew13 = Alldatalable(training_ind,:);
%         testinglablenew13 = Alldatalable(testing_ind,:);
            
        testing_indexes_Fresh = randperm(3000,600);
        testing_indexes_Drowsy = 3000 + randperm(3000,600);
        testing_ind = [testing_indexes_Fresh;testing_indexes_Drowsy];
        training_ind = setxor(1:length(X),testing_ind);    
        training13 = X(training_ind,:);
        testing13 = X(testing_ind,:);
        traininglablenew13 = Alldatalable(training_ind,:);
        testinglablenew13 = Alldatalable(testing_ind,:);
%         order = randperm(length(testing13));
%         testing13 = testing13(order,:);
%         testinglablenew13 = testinglablenew13(order,:);

        order = randperm(length(training13));
        training13 = training13(order,:);
        traininglablenew13 = traininglablenew13(order,:);

        Attributes = training13(:,1:12);
        Classes = traininglablenew13(:,1);
        Attributes1 = testing13(:,1:12);
        Classes1 = testinglablenew13(:,1);

        train = 1:length(training13);
        test = 1:length(testing13);
        
        
        obj = fitcdiscr(Attributes(train,:), Classes(train),'DiscrimType','pseudolinear');
    %obj.DiscrimType = 'quadratic';

        [predict_label,score,cost] = predict(obj,Attributes1(test,:));

        accuracy = 100 - sum(abs(predict_label - Classes1(test,:)))*100/length(testing13);
        
       % model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0');

        %[predict_label, accuracy, prob_estimates] = svmpredict(Classes1(test),Attributes1(test,:), model);

        AccuracyLDAIndi1123 = [AccuracyLDAIndi1123 accuracy];
        
        testlabledataD = [];
        testlabledataF = [];
        for t = 1:600
            if(abs(predict_label(t) - testinglablenew13(t))>0)
                testlabledataF = [testlabledataF;1];
            else
                testlabledataF = [testlabledataF;0];
            end
            if(abs(predict_label(t+600) - testinglablenew13(t+600))>0)
                testlabledataD = [testlabledataD;1];
            else
                testlabledataD = [testlabledataD;0];
            end
        end

        
    end
    AccuracyLDAIndi1123 = AccuracyLDAIndi1123.';
    
    AccuracyLDAIndi1123Final = [AccuracyLDAIndi1123Final AccuracyLDAIndi1123(:,1)];

    testlablefinalD = [testlablefinalD testlabledataD];
    testlablefinalF = [testlablefinalF testlabledataF];

    
    AccuracyLDAIndi1123 = [];
end    






