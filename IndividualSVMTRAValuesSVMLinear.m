NamesSubject = char('Shashank.csv','Pravija.csv','Masahiro.csv','Madhuri.csv','Bhaskar.csv','Shobhit.csv','Suma.csv','Shrikant.csv','Ali.csv','Haresh.csv','Krishna.csv','Rohit.csv','Sravan.csv','Tarun.csv','Shweta.csv','vlad.csv','Deepak.csv','znana.csv','Piyesh.csv','Shruthi.csv','Aliya.csv','Niel.csv','Gopi.csv') ;
testlabledataDrowsy = csvread('SVMInvidualFinalLabelsDrowsySVMLinear.csv',0,0,[0,0,599,22]);
testlabledataFresh = csvread('SVMInvidualFinalLabelsFreshSVMLinear.csv',0,0,[0,0,599,22]);

TruePositive = 600 - sum(testlabledataDrowsy);
TrueNegative = 600 - sum(testlabledataFresh);
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
csvwrite('FinalDataSVMIndividual.csv',FinalData);

