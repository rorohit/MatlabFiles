filename = 'AllVsAmplitudeper10_old_';
NamesSubject = [];
NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Gopi.csv','Niel.csv') ;
% 'Piyesh.csv','znana.csv','Deepak.csv',
X = [];
Alldatalable = [];
AccuracyLDANew = [];

for i = 1:length(NamesSubject)
    filename1 = strcat(filename,'fresh_',NamesSubject(i,:));
    filename2 = strcat(filename,'Drowsy_',NamesSubject(i,:));
    Y = csvread(filename1,1,1,[1,1,3000,11]);
    Z = csvread(filename2,1,1,[1,1,3000,11]);
    F = csvread(filename1,1,3,[1,3,3000,5]);
    W = csvread(filename2,1,3,[1,3,3000,5]);
    Q = csvread(filename1,1,13,[1,13,3000,15]);
    R = csvread(filename2,1,13,[1,13,3000,15]);
    X = [X;[[Q Y];[R Z]]];
    %length(Y)
    %length(X)
    length(NamesSubject)    
    for kk=1:6000
        if kk<=length(Y)
            Alldatalable = [Alldatalable;1];
        else
            Alldatalable = [Alldatalable;2];
        end
    end
end

% filename = 'AllVsAmplitudeper10_old_fresh_Shashank.csv';
% filename2 = 'AllVsAmplitudeper10_old_Drowsy_Shashank.csv';
% filename3 = 'AllVsAmplitudeper10_old_fresh_Tarun.csv';
% filename4 = 'AllVsAmplitudeper10_old_Drowsy_Tarun.csv';
% filename5 = 'AllVsAmplitudeper10_old_fresh_Masahiro.csv';
% filename6 = 'AllVsAmplitudeper10_old_Drowsy_Masahiro.csv';
% filename7 = 'AllVsAmplitudeper10_old_fresh_Madhuri.csv';
% filename8 = 'AllVsAmplitudeper10_old_Drowsy_Madhuri.csv';
% filename9 = 'AllVsAmplitudeper10_old_fresh_vlad.csv';
% filename10 = 'AllVsAmplitudeper10_old_Drowsy_vlad.csv';
% filename11 = 'AllVsAmplitudeper10_old_fresh_Bhaskar.csv';
% filename12 = 'AllVsAmplitudeper10_old_Drowsy_Bhaskar.csv';
% filename13 = 'AllVsAmplitudeper10_old_fresh_Piyesh.csv';
% filename14 = 'AllVsAmplitudeper10_old_Drowsy_Piyesh_2.csv';
% filename15 = 'AllVsAmplitudeper10_old_fresh_Shobhit.csv';
% filename16 = 'AllVsAmplitudeper10_old_Drowsy_Shobhit.csv';
% filename17 = 'AllVsAmplitudeper10_old_fresh_Suma.csv';
% filename18 = 'AllVsAmplitudeper10_old_Drowsy_Suma.csv';
% filename19 = 'AllVsAmplitudeper10_old_fresh_Deepak.csv';
% filename20 = 'AllVsAmplitudeper10_old_Drowsy_Deepak.csv';
% filename21 = 'AllVsAmplitudeper10_old_fresh_znana.csv';
% filename22 = 'AllVsAmplitudeper10_old_Drowsy_znana.csv';
% filename23 = 'AllVsAmplitudeper10_old_fresh_Shrikant.csv';
% filename24 = 'AllVsAmplitudeper10_old_Drowsy_Shrikant.csv';
% 
% 
% Y = csvread(filename,1,1,[1,1,3000,11]);
% Z = csvread(filename2,1,1,[1,1,3000,11]);
% F = csvread(filename,1,3,[1,3,3000,5]);
% W = csvread(filename2,1,3,[1,3,3000,5]);
% Q = csvread(filename,1,13,[1,13,3000,15]);
% R = csvread(filename2,1,13,[1,13,3000,15]);
% 
% YY = csvread(filename5,1,1,[1,1,3000,11]);
% ZZ = csvread(filename6,1,1,[1,1,3000,11]);
% FF = csvread(filename5,1,3,[1,3,3000,5]);
% WW = csvread(filename6,1,3,[1,3,3000,5]);
% QQ = csvread(filename5,1,13,[1,13,3000,15]);
% RR = csvread(filename6,1,13,[1,13,3000,15]);
% 
% YYY = csvread(filename7,1,1,[1,1,3000,11]);
% ZZZ = csvread(filename8,1,1,[1,1,3000,11]);
% FFF = csvread(filename7,1,3,[1,3,3000,5]);
% WWW = csvread(filename8,1,3,[1,3,3000,5]);
% QQQ = csvread(filename7,1,13,[1,13,3000,15]);
% RRR = csvread(filename8,1,13,[1,13,3000,15]);
% 
% YYYY = csvread(filename9,1,1,[1,1,3000,11]);
% ZZZZ = csvread(filename10,1,1,[1,1,3000,11]);
% FFFF = csvread(filename9,1,3,[1,3,3000,5]);
% WWWW = csvread(filename10,1,3,[1,3,3000,5]);
% QQQQ = csvread(filename9,1,13,[1,13,3000,15]);
% RRRR = csvread(filename10,1,13,[1,13,3000,15]);
% 
% YYYYY = csvread(filename11,1,1,[1,1,3000,11]);
% ZZZZZ = csvread(filename12,1,1,[1,1,3000,11]);
% FFFFF = csvread(filename11,1,3,[1,3,3000,5]);
% WWWWW = csvread(filename12,1,3,[1,3,3000,5]);
% QQQQQ = csvread(filename11,1,13,[1,13,3000,15]);
% RRRRR = csvread(filename12,1,13,[1,13,3000,15]);
% 
% YYYYYY = csvread(filename13,1,1,[1,1,3000,11]);
% ZZZZZZ = csvread(filename14,1,1,[1,1,3000,11]);
% FFFFFF = csvread(filename13,1,3,[1,3,3000,5]);
% WWWWWW = csvread(filename14,1,3,[1,3,3000,5]);
% QQQQQQ = csvread(filename13,1,13,[1,13,3000,15]);
% RRRRRR = csvread(filename14,1,13,[1,13,3000,15]);
% 
% YYYYYYY = csvread(filename15,1,1,[1,1,3000,11]);
% ZZZZZZZ = csvread(filename16,1,1,[1,1,3000,11]);
% FFFFFFF = csvread(filename15,1,3,[1,3,3000,5]);
% WWWWWWW = csvread(filename16,1,3,[1,3,3000,5]);
% QQQQQQQ = csvread(filename15,1,13,[1,13,3000,15]);
% RRRRRRR = csvread(filename16,1,13,[1,13,3000,15]);
% 
% YYYYYYYY = csvread(filename17,1,1,[1,1,3000,11]);
% ZZZZZZZZ = csvread(filename18,1,1,[1,1,3000,11]);
% FFFFFFFF = csvread(filename17,1,3,[1,3,3000,5]);
% WWWWWWWW = csvread(filename18,1,3,[1,3,3000,5]);
% QQQQQQQQ = csvread(filename17,1,13,[1,13,3000,15]);
% RRRRRRRR = csvread(filename18,1,13,[1,13,3000,15]);
% 
% 
% YYYYYYYYY = csvread(filename19,1,1,[1,1,3000,11]);
% ZZZZZZZZZ = csvread(filename20,1,1,[1,1,3000,11]);
% FFFFFFFFF = csvread(filename19,1,3,[1,3,3000,5]);
% WWWWWWWWW = csvread(filename20,1,3,[1,3,3000,5]);
% QQQQQQQQQ = csvread(filename19,1,13,[1,13,3000,15]);
% RRRRRRRRR = csvread(filename20,1,13,[1,13,3000,15]);
% 
% 
% YYYYYYYYYY = csvread(filename21,1,1,[1,1,3000,11]);
% ZZZZZZZZZZ = csvread(filename22,1,1,[1,1,3000,11]);
% FFFFFFFFFF = csvread(filename21,1,3,[1,3,3000,5]);
% WWWWWWWWWW = csvread(filename22,1,3,[1,3,3000,5]);
% QQQQQQQQQQ = csvread(filename21,1,13,[1,13,3000,15]);
% RRRRRRRRRR = csvread(filename22,1,13,[1,13,3000,15]);
% 
% 
% YYYYYYYYYYY = csvread(filename23,1,1,[1,1,3000,11]);
% ZZZZZZZZZZZ = csvread(filename24,1,1,[1,1,3000,11]);
% FFFFFFFFFFF = csvread(filename23,1,3,[1,3,3000,5]);
% WWWWWWWWWWW = csvread(filename24,1,3,[1,3,3000,5]);
% QQQQQQQQQQQ = csvread(filename23,1,13,[1,13,3000,15]);
% RRRRRRRRRRR = csvread(filename24,1,13,[1,13,3000,15]);
% 
% AccuracySVMNew = [];
% 
% Y1 = csvread(filename3,1,1,[1,1,3000,11]);
% Z1 = csvread(filename4,1,1,[1,1,3000,11]);
% F1 = csvread(filename3,1,3,[1,3,3000,5]);
% W1 = csvread(filename4,1,3,[1,3,3000,5]);
% Q1 = csvread(filename3,1,13,[1,13,3000,15]);
% R1 = csvread(filename4,1,13,[1,13,3000,15]);
% 
% X = [[Q1 Y1];[R1 Z1];[QQQQQQQQQQQ YYYYYYYYYYY];[RRRRRRRRRRR ZZZZZZZZZZZ];[QQQ YYY];[RRR ZZZ];[QQQQ YYYY];[RRRR ZZZZ];[QQQQQ YYYYY];[RRRRR ZZZZZ];[QQQQQQ YYYYYY];[RRRRRR ZZZZZZ];[QQQQQQQQQ YYYYYYYYY];[RRRRRRRRR ZZZZZZZZZ];[QQQQQQQ YYYYYYY];[RRRRRRR ZZZZZZZ]];
% X1 = [[Q Y];[R Z];[QQQQQQQQQQ YYYYYYYYYY];[RRRRRRRRRR ZZZZZZZZZZ];[QQQQQQQQ YYYYYYYY];[RRRRRRRR ZZZZZZZZ];;[QQ YY];[RR ZZ]];
% 
% Alldatalable = [];
% for k=1:length(X)
%     if k<=length(Y)
%         Alldatalable = [Alldatalable;1];
%     else
%         Alldatalable = [Alldatalable;2];
%     end
% end
% 
% Alldatalable1 = [];
% for k=1:length(X1)
%     if k<=length(Y1)
%         Alldatalable1 = [Alldatalable1;1];
%     else
%         Alldatalable1 = [Alldatalable1;2];
%     end
% end

newX = X;
length(X)

newAlldatalable = Alldatalable;
length(newAlldatalable)
for h = 1:8
    
    testing_ind = [];
    for i=1:length(newX)
        if rand>0.8
            testing_ind = [testing_ind,i];
        end
    end
    training_ind = setxor(1:length(newX),testing_ind);

    training12 = newX(training_ind,:);
    testing12 = newX(testing_ind,:);

    traininglablenew12 = newAlldatalable(training_ind,:);
    testinglablenew12 = newAlldatalable(testing_ind,:);


%number = 1:length(testing1);
%newnumber = randperm(size(number,1)),:);
    testing11 = [];
    testinglablenew11 = [];
    order = randperm(length(training12));
    training12 = training12(order,:);
    traininglablenew12 = traininglablenew12(order,:);

    order2 = randperm(length(testing12));
    testing12 = testing12(order2,:);
    testinglablenew12 = testinglablenew12(order2,:);


    Attributes = training12(:,1:14);
    Classes = traininglablenew12(:,1);

    Attributes1 = testing12(:,1:14);
    Classes1 = testinglablenew12(:,1);

    train = 1:length(training12);
    test = 1:length(testing12);

    


    obj = fitcdiscr(Attributes(train,:),Classes(train),'DiscrimType','pseudolinear');
    %obj.DiscrimType = 'quadratic';
    
    [predict_label,score,cost] = predict(obj,Attributes1(test,:));
    count = 0;
    for i = 1:length(testinglablenew12)
        if abs(testinglablenew12(i) - predict_label(i))>0
            count = count + 1;
        end
    end
    accuracy = 100 - count*100/length(testinglablenew12)
    AccuracyLDANew = [AccuracyLDANew;accuracy];

end