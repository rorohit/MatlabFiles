testlabledataFresh = csvread('SVMFinalLabelBlinkIndividualF.csv',0,0,[0,0,10,22]);
testlabledataDrowsy = csvread('SVMFinalLabelBlinkIndividualD.csv',0,0,[0,0,10,22]);

TruePositive = 11 - sum(testlabledataDrowsy);
TrueNegative = 11 - sum(testlabledataFresh);
FalsePositive = sum(testlabledataFresh);
FalseNegative = sum(testlabledataDrowsy);

Precision = TruePositive ./(TruePositive + FalsePositive);
Recall = TruePositive ./(TruePositive + FalseNegative);
TrueNegativeRate = TrueNegative ./ (TrueNegative + FalsePositive);
Accuracy = (TruePositive + TrueNegative) ./ (TruePositive + FalsePositive + TrueNegative + FalseNegative);

Precision = 100 .* Precision;
Recall = 100 .* Recall;
TrueNegativeRate = 100 .* TrueNegativeRate;
Accuracy = 100 .* Accuracy;


FinalData = [Precision;Recall;TrueNegativeRate;Accuracy]';
csvwrite('FinalDataSVMIndividualBlink.csv',FinalData);
