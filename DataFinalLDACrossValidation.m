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

csvwrite('LDACrossValidationFinalLabelFresh1min.csv',ClassificationFresh1MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy1min.csv',ClassificationDrowsy1MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh2min.csv',ClassificationFresh2MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy2min.csv',ClassificationDrowsy2MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh3min.csv',ClassificationFresh3MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy3min.csv',ClassificationDrowsy3MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh4min.csv',ClassificationFresh4MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy4min.csv',ClassificationDrowsy4MinLDA);
csvwrite('LDACrossValidationFinalLabelFresh5min.csv',ClassificationFresh5MinLDA);
csvwrite('LDACrossValidationFinalLabelDrowsy5min.csv',ClassificationDrowsy5MinLDA);

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
        
