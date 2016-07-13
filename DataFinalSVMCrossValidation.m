NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
finallabledata5min = csvread('SVMFinalLabel5MinAggregation1.csv',0,0,[0,0,19,22]);
finallabledata3min = csvread('SVMFinalLabel3MinAggregation1.csv',0,0,[0,0,32,22]);
finallabledata1min = csvread('SVMFinalLabel1MinAggregation1.csv',0,0,[0,0,99,22]);
finallabledata2min = csvread('SVMFinalLabel2MinAggregation1.csv',0,0,[0,0,49,22]);
finallabledata4min = csvread('SVMFinalLabel4MinAggregation1.csv',0,0,[0,0,24,22]);

FiveMinCorrectClassificationSVM = [];
EveryIteration = [];
for i=1:length(finallabledata5min(:,1))
    EveryIteration = [];
    for k = 1:length(NamesSubject)
        x = finallabledata5min(i,k);
        if finallabledata5min(i,k)<=150
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    FiveMinCorrectClassificationSVM = [FiveMinCorrectClassificationSVM;EveryIteration];
end

ClassificationFresh5MinSVM = [];
ClassificationDrowsy5MinSVM = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(FiveMinCorrectClassificationSVM(:,1))/2)
        if FiveMinCorrectClassificationSVM(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if FiveMinCorrectClassificationSVM(10+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh5MinSVM = [ClassificationFresh5MinSVM classification_fresh];
    ClassificationDrowsy5MinSVM = [ClassificationDrowsy5MinSVM classification_drowsy];
    check = 0;
end
    





ThreeMinCorrectClassificationSVM = [];
EveryIteration = [];
for i=1:length(finallabledata3min(:,1))
    EveryIteration = [];
    for k = 1:length(NamesSubject)
        x = finallabledata3min(i,k);
        if finallabledata3min(i,k)<=90
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    ThreeMinCorrectClassificationSVM = [ThreeMinCorrectClassificationSVM;EveryIteration];
end

ClassificationFresh3MinSVM = [];
ClassificationDrowsy3MinSVM = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ThreeMinCorrectClassificationSVM(:,1))/2)
        if ThreeMinCorrectClassificationSVM(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ThreeMinCorrectClassificationSVM(10+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh3MinSVM = [ClassificationFresh3MinSVM classification_fresh];
    ClassificationDrowsy3MinSVM = [ClassificationDrowsy3MinSVM classification_drowsy];
    check = 0;
end
    



OneMinCorrectClassificationSVM = [];
EveryIteration = [];
for i=1:length(finallabledata1min(:,1))
    EveryIteration = [];
    for k = 1:length(NamesSubject)
        x = finallabledata1min(i,k);
        if finallabledata1min(i,k)<=30
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    OneMinCorrectClassificationSVM = [OneMinCorrectClassificationSVM;EveryIteration];
end

ClassificationFresh1MinSVM = [];
ClassificationDrowsy1MinSVM = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(OneMinCorrectClassificationSVM(:,1))/2)
        if OneMinCorrectClassificationSVM(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if OneMinCorrectClassificationSVM(10+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh1MinSVM = [ClassificationFresh1MinSVM classification_fresh];
    ClassificationDrowsy1MinSVM = [ClassificationDrowsy1MinSVM classification_drowsy];
    check = 0;
end





TwoMinCorrectClassificationSVM = [];
EveryIteration = [];
for i=1:length(finallabledata2min(:,1))
    EveryIteration = [];
    for k = 1:length(NamesSubject)
        x = finallabledata2min(i,k);
        if finallabledata2min(i,k)<=60
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    TwoMinCorrectClassificationSVM = [TwoMinCorrectClassificationSVM;EveryIteration];
end

ClassificationFresh2MinSVM = [];
ClassificationDrowsy2MinSVM = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(TwoMinCorrectClassificationSVM(:,1))/2)
        if TwoMinCorrectClassificationSVM(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if TwoMinCorrectClassificationSVM(25+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh2MinSVM = [ClassificationFresh2MinSVM classification_fresh];
    ClassificationDrowsy2MinSVM = [ClassificationDrowsy2MinSVM classification_drowsy];
    check = 0;
end







FourMinCorrectClassificationSVM = [];
EveryIteration = [];
for i=1:length(finallabledata4min(:,1))
    EveryIteration = [];
    for k = 1:length(NamesSubject)
        x = finallabledata4min(i,k);
        if finallabledata4min(i,k)<=30
            EveryIteration = [EveryIteration 1];
        else
            EveryIteration = [EveryIteration 2];
        end
    end
    FourMinCorrectClassificationSVM = [FourMinCorrectClassificationSVM;EveryIteration];
end

ClassificationFresh4MinSVM = [];
ClassificationDrowsy4MinSVM = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(FourMinCorrectClassificationSVM(:,1))/2)
        if FourMinCorrectClassificationSVM(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if FourMinCorrectClassificationSVM(10+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    ClassificationFresh4MinSVM = [ClassificationFresh4MinSVM classification_fresh];
    ClassificationDrowsy4MinSVM = [ClassificationDrowsy4MinSVM classification_drowsy];
    check = 0;
end


csvwrite('SVMCrossValidationFinalLabelFresh1min1.csv',ClassificationFresh1MinSVM);
csvwrite('SVMCrossValidationFinalLabelDrowsy1min1.csv',ClassificationDrowsy1MinSVM);
csvwrite('SVMCrossValidationFinalLabelFresh2min1.csv',ClassificationFresh2MinSVM);
csvwrite('SVMCrossValidationFinalLabelDrowsy2min1.csv',ClassificationDrowsy2MinSVM);
csvwrite('SVMCrossValidationFinalLabelFresh3min1.csv',ClassificationFresh3MinSVM);
csvwrite('SVMCrossValidationFinalLabelDrowsy3min1.csv',ClassificationDrowsy3MinSVM);
csvwrite('SVMCrossValidationFinalLabelFresh4min1.csv',ClassificationFresh4MinSVM);
csvwrite('SVMCrossValidationFinalLabelDrowsy4min1.csv',ClassificationDrowsy4MinSVM);
csvwrite('SVMCrossValidationFinalLabelFresh5min1.csv',ClassificationFresh5MinSVM);
csvwrite('SVMCrossValidationFinalLabelDrowsy5min1.csv',ClassificationDrowsy5MinSVM);




csvwrite('ClassificationFresh1MinSVM1.csv',ClassificationFresh1MinSVM);
csvwrite('ClassificationFresh3MinSVM1.csv',ClassificationFresh3MinSVM);
csvwrite('ClassificationFresh5MinSVM1.csv',ClassificationFresh5MinSVM);
csvwrite('ClassificationFresh2MinSVM1.csv',ClassificationFresh2MinSVM);
csvwrite('ClassificationFresh4MinSVM1.csv',ClassificationFresh4MinSVM);

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
        
