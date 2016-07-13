filename = 'AllVsAmplitudeper10_old_fresh_Masahiro.csv';
filename2 = 'AllVsAmplitudeper10_old_Drowsy_Masahiro.csv';
filename3 = 'AllVsAmplitudeper10_old_fresh_vlad.csv';
filename4 = 'AllVsAmplitudeper10_old_Drowsy_vlad.csv';


Y = csvread(filename,1,1,[1,1,3000,11]);
Z = csvread(filename2,1,1,[1,1,3000,11]);
F = csvread(filename,1,3,[1,3,3000,5]);
W = csvread(filename2,1,3,[1,3,3000,5]);
Q = csvread(filename,1,13,[1,13,3000,15]);
R = csvread(filename2,1,13,[1,13,3000,15]);


Y1 = csvread(filename3,1,1,[1,1,3000,11]);
Z1 = csvread(filename4,1,1,[1,1,3000,11]);
F1 = csvread(filename3,1,3,[1,3,3000,5]);
W1 = csvread(filename4,1,3,[1,3,3000,5]);
Q1 = csvread(filename3,1,13,[1,13,3000,15]);
R1 = csvread(filename4,1,13,[1,13,3000,15]);
Indexes = 99;
%X = [Y;Z];

%Y = [Y;Y1];
%Z = [Z;Z1];
%F = [F;F1];
%W = [W;W1];
%Q = [Q;Q1];
%R = [R;R1];

X = [[Q Y];[R Z]];
X1 = [[Q1 Y1];[R1 Z1]];
%X = [[Q Y F];[R Z W]];
Alldatalable = [];
for k=1:length(X)
    if k<=length(Y)
        Alldatalable = [Alldatalable;'1'];
    else
        Alldatalable = [Alldatalable;'2'];
    end
end

Alldatalable1 = [];
for k=1:length(X1)
    if k<=length(Y1)
        Alldatalable1 = [Alldatalable1;'1'];
    else
        Alldatalable1 = [Alldatalable1;'2'];
    end
end



testing_ind = [];
for i=1:length(X)
    if rand>0.8
        testing_ind = [testing_ind,i];
    end
end
training_ind = setxor(1:length(X),testing_ind);


testing_ind2 = [];
for i=0:Indexes
    if rand>0.8
        testing_ind2 = [testing_ind2,i];
    end
end
training_ind2 = setxor(0:99,testing_ind2);

testing_new = [];
sec = 60;
for i=1:length(testing_ind2)
    for j=1:sec
        testing_new = [testing_new,(testing_ind2(i)+j)];
    end
end
training_new2 = setxor(1:6000,testing_new);

training_new = [];
for i=1:length(training_ind2)
    for j=1:sec
        training_new = [training_new,(training_ind2(i)*60)+j];
    end
end



obj = fitcdiscr(X(training_ind,:),Alldatalable(training_ind,:),'DiscrimType','pseudolinear');
%obj.DiscrimType = 'quadratic';

[label,score,cost] = predict(obj,X(testing_ind,:));


obj2 = fitcdiscr(X(training_new,:),Alldatalable(training_new,:),'DiscrimType','pseudolinear');
%obj.DiscrimType = 'quadratic';

[label2,score2,cost2] = predict(obj,X1(testing_new,:));



absTol = 1e-3;   % You choose this value to be what you want!
relTol = 0.05;   % This one too!
absError = label(:)-Alldatalable(testing_ind,:);
relError = absError./label(:);
relError(~isfinite(relError)) = 0;   % Sets Inf and NaN to 0
same = all( (abs(absError) < absTol) & (abs(relError) < relTol) );
