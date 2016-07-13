Attributes = training12(:,1:12);
Classes = traininglablenew12(:,1);

Attributes1 = testing12(:,1:14);
Classes1 = testinglablenew12(:,1);

train = 1:length(training12);
test = 1:length(testing12);

AccuracySVMNew = [];


model = svmtrain(Classes(train), Attributes(train,:), '-s 0 -t 2 -h 0');
[predict_label, accuracy, prob_estimates] = svmpredict(Classes1(test),Attributes1(test,:), model);
AccuracySVMNew = [AccuracySVMNew;accuracy];
