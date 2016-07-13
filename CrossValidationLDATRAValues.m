NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
testlabledataDrowsy = csvread('LDAFinalLabelCheck5MinAggregation1.csv',3000,0,[3000,0,5999,22]);
testlabledataFresh = csvread('LDAFinalLabelCheck5MinAggregation1.csv',0,0,[0,0,2999,22]);

TruePositive = 3000 - sum(testlabledataDrowsy);
TrueNegative = 3000 - sum(testlabledataFresh);
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
csvwrite('FinalDataLDACrossValidation1.csv',FinalData);

