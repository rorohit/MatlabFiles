filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Tarun.csv','Masahiro.csv','Madhuri.csv','vlad.csv','Bhaskar.csv','Piyesh.csv','Shobhit.csv','Suma.csv','Deepak.csv','znana.csv','Shrikant.csv') ;
length(NamesSubject)
X = [];
Alldatalable = [];
X1 = [];
Alldatalable1 = [];
Accuracy = [];
ProbEst = [];
Information = [];

finallabledata3 = [];
finallablecheck3 = [];
CA = [];

testing_ind = [];

for k = 21:21    
    filename1 = strcat(filename,'fresh_',NamesSubject(k,:));
    filename2 = strcat(filename,'Drowsy_',NamesSubject(k,:));
    Y = csvread(filename1,1,1,[1,1,3000,11]);
    Z = csvread(filename2,1,1,[1,1,3000,11]);
    F = csvread(filename1,1,3,[1,3,3000,5]);
    W = csvread(filename2,1,3,[1,3,3000,5]);
    Q = csvread(filename1,1,13,[1,13,3000,15]);
    R = csvread(filename2,1,13,[1,13,3000,15]);
        
    X = [[Q Y];[R Z]];
        
        
    for kk=1:6000
        if kk<=length(Y)
            Alldatalable = [Alldatalable;1];
        else
            Alldatalable = [Alldatalable;2];
        end
    end
end


for iii = 1:8
    testing_ind = [];
    % Minutes selection
    minutelable = [];
    for i=1:100
        if rand>0.8
            minutelable = [minutelable,i];
        end
    end
    %Continious Minutes data being segregated in Training and Testing
    for i = 1:length(minutelable)
        for j = 1:60
            testing_ind = [testing_ind,((minutelable(i)-1)*60+j)];
        end
    end
            
    training_ind = setxor(1:length(X),testing_ind);    
    training13 = X(training_ind,:);
    testing13 = X(testing_ind,:);
    traininglablenew13 = Alldatalable(training_ind,:);
    testinglablenew13 = Alldatalable(testing_ind,:);
    
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
    model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 1 -h 0');

    [predict_label, accuracy, prob_estimates] = svmpredict(Classes1(test),Attributes1(test,:), model);

    count=1;
    lablecheck = [];
    labledata = [];
    value=0;
    for j=1:length(testinglablenew13)
        if abs(testinglablenew13(j) - predict_label(j))>0
            lablecheck = [lablecheck;1];
            value = value + 1;
        else
            lablecheck = [lablecheck;0];
        end
        if count == 60
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck3 = [finallablecheck3;lablecheck];
    finallabledata3 = [finallabledata3;labledata];

% Correct Classification @ more than 70% is True Positive
% Correct Classification @ more than 30% and less than 70% is Not
% Conclusive
%Correct Classification @ less than 30% is False Positive


    ADATA12311 = [];
    A = [];
    for i=1:length(labledata)
        A = [];
    
        %x = finallabledata(i,k)
        if labledata(i)<=15
            A = [A 1];
        else
            A = [A 2];
    
        end
        ADATA12311 = [ADATA12311;A];
    end



    
    classification = 0;

    for k=1:(length(ADATA12311))
        if ADATA12311(k)==1
            classification = classification + 1;
        end
    end
  
    CA = [CA classification]
    data1new = [classification length(ADATA12311) (classification*100/length(ADATA12311))]
    Information = [Information;data1new];
end
        
