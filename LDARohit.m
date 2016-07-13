filename = 'bothAlphaandfreqeverything_fresh.csv';
filename2 = 'bothAlphaandfreqeverything_drowsy.csv';
Y = csvread(filename,1,1,[1,1,37000,20]);
Z = csvread(filename2,1,1,[1,1,37000,20]);
X = [Y;Z];
Alldatalable = [];
for k=1:length(X)
    if k<=length(Y)
        Alldatalable = [Alldatalable;'F'];
    else
        Alldatalable = [Alldatalable;'D'];
    end
end
testing_ind = [];
for i=1:length(X)
    if rand>0.8
        testing_ind = [testing_ind,i];
    end
end
training_ind = setxor(1:length(X),testing_ind);
[ldaClass,err,P,Logp,coeff] = classify(X(testing_ind,:),X((training_ind),:),Alldatalable(training_ind,:),'linear');
[ldaResubCM,GrpOrder] = confusionmat(Alldatalable(testing_ind,:),ldaClass);
K = coeff(1,2).const;
L = coeff(1,2).linear;
f = @(x,y) K + [x y]*L;
h2 = ezplot(f,[min(X(:,1)) max(X(:,1)) min(X(:,2)) max(X(:,2))]);

