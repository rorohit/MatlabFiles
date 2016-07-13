filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
%,
length(NamesSubject)
lablecheck = [];
labledata = [];
finallablecheck1minLDA = [];
finallabledata1minLDA = [];
finallablecheck5minLDA = [];
finallabledata5minLDA = [];
finallablecheck3minLDA = [];
finallabledata3minLDA = [];
finallablecheck2minLDA = [];
finallabledata2minLDA = [];
finallablecheck4minLDA = [];
finallabledata4minLDA = [];

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
        Y = csvread(filename1,1,1,[1,1,3000,3]);
        Z = csvread(filename2,1,1,[1,1,3000,3]);
        F = csvread(filename1,1,5,[1,5,3000,5]);
        W = csvread(filename2,1,5,[1,5,3000,5]);
        Q = csvread(filename1,1,7,[1,7,3000,9]);
        R = csvread(filename2,1,7,[1,7,3000,9]);
        S = csvread(filename1,1,11,[1,11,3000,15]);
        T = csvread(filename2,1,11,[1,11,3000,15]);
        
        X = [X;[[S Q F Y];[T R W Z]]];
        
        
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
    Y1 = csvread(filename3,1,1,[1,1,3000,3]);
    Z1 = csvread(filename4,1,1,[1,1,3000,3]);
    F1 = csvread(filename3,1,5,[1,5,3000,5]);
    W1 = csvread(filename4,1,5,[1,5,3000,5]);
    Q1 = csvread(filename3,1,7,[1,7,3000,9]);
    R1 = csvread(filename4,1,7,[1,7,3000,9]);
    S1 = csvread(filename3,1,11,[1,11,3000,15]);
    T1 = csvread(filename4,1,11,[1,11,3000,15]);
        
    X1 = [[S1 Q1 F1 Y1];[T1 R1 W1 Z1]];
     
        
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

%     order = randperm(length(training13));
%     training13 = training13(order,:);
%     traininglablenew13 = traininglablenew13(order,:);
%     
%     AW = 1:100;
%     
%     AW = AW(randperm(length(AW)));
%     
%     
%     
%     testing_ind = [];
%     for i = 1:length(AW)
%         for j = 1:60
%             testing_ind = [testing_ind,((AW(i)-1)*60+j)];
%         end
%     end
% 
%     testing13 = testing13(testing_ind,:);
%     testinglablenew13 = testinglablenew13(testing_ind,:);
%     
    %order = randperm(length(testing13));
    %testing13 = testing13(order,:);
    %testinglablenew13 = testinglablenew13(order,:);
    
    Attributes = training13(:,1:12);
    Classes = traininglablenew13(:,1);

    Attributes1 = testing13(:,1:12);
    Classes1 = testinglablenew13(:,1);

    train = 1:length(training13);
    test = 1:length(testing13);

    %obj = fitcdiscr(Attributes(train,:),Classes(train),'DiscrimType','pseudolinear');
    obj = fitcdiscr(Attributes,Classes,'DiscrimType','pseudolinear');
    %obj.DiscrimType = 'quadratic';
    
    %[predict_label,score,cost] = predict(obj,Attributes1(test,:));
    [predict_label,score,cost] = predict(obj,Attributes1);
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
        if count == 300
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck5minLDA = [finallablecheck5minLDA lablecheck];
    finallabledata5minLDA = [finallabledata5minLDA labledata];

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
    finallablecheck1minLDA = [finallablecheck1minLDA lablecheck];
    finallabledata1minLDA = [finallabledata1minLDA labledata];

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
        if count == 180
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck3minLDA = [finallablecheck3minLDA lablecheck];
    finallabledata3minLDA = [finallabledata3minLDA labledata];

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
        if count == 120
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck2minLDA = [finallablecheck2minLDA lablecheck];
    finallabledata2minLDA = [finallabledata2minLDA labledata];

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
        if count == 240
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck4minLDA = [finallablecheck4minLDA lablecheck];
    finallabledata4minLDA = [finallabledata4minLDA labledata];

    
    
    
% Correct Classification @ more than 70% is True Positive
% Correct Classification @ more than 30% and less than 70% is Not
% Conclusive
%Correct Classification @ less than 30% is False Positive

%
end


csvwrite('LDAFinalLabel5MinAggregation1.csv',finallabledata5minLDA);
csvwrite('LDAFinalLabel4MinAggregation1.csv',finallabledata4minLDA);
csvwrite('LDAFinalLabel3MinAggregation1.csv',finallabledata3minLDA);
csvwrite('LDAFinalLabel2MinAggregation1.csv',finallabledata2minLDA);
csvwrite('LDAFinalLabel1MinAggregation1.csv',finallabledata1minLDA);



csvwrite('LDAFinalLabelCheck5MinAggregation1.csv',finallablecheck5minLDA);
csvwrite('LDAFinalLabelCheck4MinAggregation1.csv',finallablecheck4minLDA);
csvwrite('LDAFinalLabelCheck3MinAggregation1.csv',finallablecheck3minLDA);
csvwrite('LDAFinalLabelCheck2MinAggregation1.csv',finallablecheck2minLDA);
csvwrite('LDAFinalLabelCheck1MinAggregation1.csv',finallablecheck1minLDA);



FiveMinCorrectClassificationLDA = [];
EveryIteration = [];
for i=1:length(NamesSubject)
    EveryIteration = [];
    for k = 1:length(finallabledata5minLDA(:,1))
        x = finallabledata5minLDA(k,i);
        if finallabledata5minLDA(k,i)<=150
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    FiveMinCorrectClassificationLDA = [FiveMinCorrectClassificationLDA;EveryIteration];
end

ClassificationFresh5MinLDA = [];
ClassificationDrowsy5MinLDA = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(FiveMinCorrectClassificationLDA(1,:))/2)
        if FiveMinCorrectClassificationLDA(i,k)==1
            classification_fresh = classification_fresh + 1;
        end
        if FiveMinCorrectClassificationLDA(i,10+k)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh5MinLDA = [ClassificationFresh5MinLDA classification_fresh];
    ClassificationDrowsy5MinLDA = [ClassificationDrowsy5MinLDA classification_drowsy];
    check = 0;
end
    





ThreeMinCorrectClassificationLDA = [];
EveryIteration = [];
for i=1:length(NamesSubject)
    EveryIteration = [];
    for k = 1:length(finallabledata3minLDA(:,1))
        x = finallabledata3minLDA(k,i);
        if finallabledata3minLDA(k,i)<=90
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    ThreeMinCorrectClassificationLDA = [ThreeMinCorrectClassificationLDA;EveryIteration];
end

ClassificationFresh3MinLDA = [];
ClassificationDrowsy3MinLDA = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ThreeMinCorrectClassificationLDA(1,:))/2)
        if ThreeMinCorrectClassificationLDA(i,k)==1
            classification_fresh = classification_fresh + 1;
        end
        if ThreeMinCorrectClassificationLDA(i,17+k)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh3MinLDA = [ClassificationFresh3MinLDA classification_fresh];
    ClassificationDrowsy3MinLDA = [ClassificationDrowsy3MinLDA classification_drowsy];
    check = 0;
end
    



OneMinCorrectClassificationLDA = [];
EveryIteration = [];
for i=1:length(NamesSubject)
    EveryIteration = [];
    for k = 1:length(finallabledata1minLDA(:,1))
        x = finallabledata1minLDA(k,i);
        if finallabledata1minLDA(k,i)<=30
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    OneMinCorrectClassificationLDA = [OneMinCorrectClassificationLDA;EveryIteration];
end

ClassificationFresh1MinLDA = [];
ClassificationDrowsy1MinLDA = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(OneMinCorrectClassificationLDA(1,:))/2)
        if OneMinCorrectClassificationLDA(i,k)==1
            classification_fresh = classification_fresh + 1;
        end
        if OneMinCorrectClassificationLDA(i,50+k)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh1MinLDA = [ClassificationFresh1MinLDA classification_fresh];
    ClassificationDrowsy1MinLDA = [ClassificationDrowsy1MinLDA classification_drowsy];
    check = 0;
end
    






TwoMinCorrectClassificationLDA = [];
EveryIteration = [];
for i=1:length(NamesSubject)
    EveryIteration = [];
    for k = 1:length(finallabledata2minLDA(:,1))
        x = finallabledata2minLDA(k,i);
        if finallabledata2minLDA(k,i)<=60
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    TwoMinCorrectClassificationLDA = [TwoMinCorrectClassificationLDA;EveryIteration];
end

ClassificationFresh2MinLDA = [];
ClassificationDrowsy2MinLDA = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(TwoMinCorrectClassificationLDA(1,:))/2)
        if TwoMinCorrectClassificationLDA(i,k)==1
            classification_fresh = classification_fresh + 1;
        end
        if TwoMinCorrectClassificationLDA(i,25+k)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh2MinLDA = [ClassificationFresh2MinLDA classification_fresh];
    ClassificationDrowsy2MinLDA = [ClassificationDrowsy2MinLDA classification_drowsy];
    check = 0;
end
    






FourMinCorrectClassificationLDA = [];
EveryIteration = [];
for i=1:length(NamesSubject)
    EveryIteration = [];
    for k = 1:length(finallabledata4minLDA(:,1))
        x = finallabledata4minLDA(k,i);
        if finallabledata4minLDA(k,i)<=120
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    FourMinCorrectClassificationLDA = [FourMinCorrectClassificationLDA;EveryIteration];
end

ClassificationFresh4MinLDA = [];
ClassificationDrowsy4MinLDA = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(FourMinCorrectClassificationLDA(1,:))/2)
        if FourMinCorrectClassificationLDA(i,k)==1
            classification_fresh = classification_fresh + 1;
        end
        if FourMinCorrectClassificationLDA(i,13+k)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh4MinLDA = [ClassificationFresh4MinLDA classification_fresh];
    ClassificationDrowsy4MinLDA = [ClassificationDrowsy4MinLDA classification_drowsy];
    check = 0;
end
    
csvwrite('LDACrossValidationFinalLabelFresh1min1.csv',ClassificationFresh1MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy1min1.csv',ClassificationDrowsy1MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh2min1.csv',ClassificationFresh2MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy2min1.csv',ClassificationDrowsy2MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh3min1.csv',ClassificationFresh3MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy3min1.csv',ClassificationDrowsy3MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh4min1.csv',ClassificationFresh4MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy4min1.csv',ClassificationDrowsy4MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh5min1.csv',ClassificationFresh5MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy5min1.csv',ClassificationDrowsy5MinLDA);

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
        








