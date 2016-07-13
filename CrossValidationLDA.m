filename = 'AllVsAmplitudeper10_old_';
NamesSubject = char('Shashank.csv','Masahiro.csv','Madhuri.csv','vlad.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Tarun.csv','Shrikant.csv','Krishna.csv','Ali.csv','Haresh.csv','Piyesh.csv','znana.csv','Deepak.csv','Pravija.csv','Rohit.csv','Sravan.csv','Shweta.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
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
        F = csvread(filename1,1,3,[1,3,3000,5]);
        W = csvread(filename2,1,3,[1,3,3000,5]);
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
    F1 = csvread(filename3,1,3,[1,3,3000,5]);
    W1 = csvread(filename4,1,3,[1,3,3000,5]);
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

    order = randperm(length(training13));
    training13 = training13(order,:);
    traininglablenew13 = traininglablenew13(order,:);
    
    AW = 1:100;
    
    AW = AW(randperm(length(AW)));
    
    
    
    testing_ind = [];
    for i = 1:length(AW)
        for j = 1:60
            testing_ind = [testing_ind,((AW(i)-1)*60+j)];
        end
    end

    testing13 = testing13(testing_ind,:);
    testinglablenew13 = testinglablenew13(testing_ind,:);
    
    %order = randperm(length(testing13));
    %testing13 = testing13(order,:);
    %testinglablenew13 = testinglablenew13(order,:);
    
    Attributes = training13(:,1:14);
    Classes = traininglablenew13(:,1);

    Attributes1 = testing13(:,1:14);
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
        if count == 60
            labledata = [labledata;value];
            value=0;
            count=0;
        end
        count = count + 1;
    end
    finallablecheck = [finallablecheck lablecheck];
    finallabledata = [finallabledata labledata];

% Correct Classification @ more than 70% is True Positive
% Correct Classification @ more than 30% and less than 70% is Not
% Conclusive
%Correct Classification @ less than 30% is False Positive

%
end

ADATA12316 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:23
        x = finallabledata(i,k)
        if finallabledata(i,k)<=25
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA12316 = [ADATA12316;A];
end

CF8 = [];
CD8 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:23
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12316)/2)
        if ADATA12316(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12316(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF8 = [CF8 classification_fresh];
    CD8 = [CD8 classification_drowsy];
    check = 0;
end
    





ADATA12317 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:23
        x = finallabledata(i,k)
        if finallabledata(i,k)<=20
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA12317 = [ADATA12317;A];
end

CF9 = [];
CD9 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:23
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12317)/2)
        if ADATA12317(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12317(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF9 = [CF9 classification_fresh];
    CD9 = [CD9 classification_drowsy];
    check = 0;
end





ADATA12318 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:23
        x = finallabledata(i,k)
        if finallabledata(i,k)<=15
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA12318 = [ADATA12318;A];
end

CF10 = [];
CD10 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:23
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12318)/2)
        if ADATA12318(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12318(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF10 = [CF10 classification_fresh];
    CD10 = [CD10 classification_drowsy];
    check = 0;
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
        
