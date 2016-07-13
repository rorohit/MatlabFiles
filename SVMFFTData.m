filename = 'Raw_fft0';
NamesSubject = char('Masahiro','Bhaskar','Ali','Aliya') ;
length(NamesSubject)
AccuracySVMIndi233 = [];
finallablecheck2 = [];
finallabledata2 = [];
X = [];
Alldatalable = [];
X1 = [];
Alldatalable1 = [];
Accuracy = [];
ProbEst = [];
    
testing_ind = [];

for k = 1:1    
    filename1 = strcat(filename,'_',NamesSubject(k,:),'_Fresh.csv')
    filename2 = strcat(filename,'_',NamesSubject(k,:),'_Drowsy.csv')
    Y = csvread(filename1,1,1,[1,1,30000,128]);
    Z = csvread(filename2,1,1,[1,1,30000,128]);
    %F = csvread(filename1,1,3,[1,3,3000,5]);
    %W = csvread(filename2,1,3,[1,3,3000,5]);
    %Q = csvread(filename1,1,13,[1,13,3000,15]);
    %R = csvread(filename2,1,13,[1,13,3000,15]);
    Ynorm = (Y-min2(Y))/(max2(Y) - min2(Y));
    Znorm = (Z-min2(Z))/(max2(Z) - min2(Z));
    
    Ynorm2 = normc(Y);
    Znorm2 = normc(Z);
    
    
    X = [Ynorm;Znorm];
    X1  = [Ynorm2;Znorm2];
    
    X = [(X(:,1)+X(:,2)) (X(:,3)+X(:,4)) (X(:,5)+X(:,6)) (X(:,7)+X(:,8)) (X(:,9)+X(:,10)) (X(:,11)+X(:,12)) (X(:,13)+X(:,14)) (X(:,15)+X(:,16)) (X(:,17)+X(:,18)) (X(:,19)+X(:,20)) (X(:,21)+X(:,22)) (X(:,23)+X(:,24)) (X(:,25)+X(:,26)) (X(:,27)+X(:,28)) (X(:,29)+X(:,30))];
    X1 = [(X1(:,1)+X1(:,2)) (X1(:,3)+X1(:,4)) (X1(:,5)+X1(:,6)) (X1(:,7)+X1(:,8)) (X1(:,9)+X1(:,10)) (X1(:,11)+X1(:,12)) (X1(:,13)+X1(:,14)) (X1(:,15)+X1(:,16)) (X1(:,17)+X1(:,18)) (X1(:,19)+X1(:,20)) (X1(:,21)+X1(:,22)) (X1(:,23)+X1(:,24)) (X1(:,25)+X1(:,26)) (X1(:,27)+X1(:,28)) (X1(:,29)+X1(:,30))];    
        
    for kk=1:60000
        if kk<=length(Y)
            Alldatalable = [Alldatalable;1];
        else
            Alldatalable = [Alldatalable;2];
        end
    end
end
for q = 1:8
    
    testing_ind = [];
    for i=1:length(X1)
        if rand>0.8
            testing_ind = [testing_ind,i];
        end
    end
    training_ind = setxor(1:length(X1),testing_ind);    
    training13 = X1(training_ind,:);
    testing13 = X1(testing_ind,:);
    traininglablenew13 = Alldatalable(training_ind,:);
    testinglablenew13 = Alldatalable(testing_ind,:);
    
    order = randperm(length(testing13));
    testing13 = testing13(order,:);
    testinglablenew13 = testinglablenew13(order,:);

    order = randperm(length(training13));
    training13 = training13(order,:);
    traininglablenew13 = traininglablenew13(order,:);

    Attributes = training13(:,1:15);
    Classes = traininglablenew13(:,1);
    Attributes1 = testing13(:,1:15);
    Classes1 = testinglablenew13(:,1);

    train = 1:length(training13);
    test = 1:length(testing13);
    model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0');

    [predict_label1, accuracy1, prob_estimates1] = svmpredict(Classes1(test),Attributes1(test,:), model);

    AccuracySVMIndi233 = [AccuracySVMIndi233 accuracy1];
end 
    