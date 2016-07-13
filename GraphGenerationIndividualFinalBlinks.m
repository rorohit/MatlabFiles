%NamesSubject = char('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21','S22','S23') ;
NamesSubject = char('S1','S12','S23') ;
FinalDataSVMIndividual = csvread('FinalDataSVMIndividualBlink.csv',0,0,[0,0,22,3]);
FinalDataLDAIndividual = csvread('FinalDataLDAIndividualBlink.csv',0,0,[0,0,22,3]);
FinalDataSVMIndividualSpectral = csvread('FinalDataSVMIndividual.csv',0,0,[0,0,22,3]);
FinalDataLDAIndividualSpectral = csvread('FinalDataLDAIndividual.csv',0,0,[0,0,22,3]);

FinalDataSVMIndividual = FinalDataSVMIndividual';
FinalDataLDAIndividual = FinalDataLDAIndividual';
FinalDataSVMIndividualSpectral = FinalDataSVMIndividualSpectral';
FinalDataLDAIndividualSpectral = FinalDataLDAIndividualSpectral';

PrecisionSVM = FinalDataSVMIndividual(1,:);
PrecisionSVM2 = [max(PrecisionSVM) median(PrecisionSVM) min(PrecisionSVM)];
RecallSVM = FinalDataSVMIndividual(2,:);
RecallSVM2 = [max(RecallSVM) median(RecallSVM) min(RecallSVM)];
AccuracySVM = FinalDataSVMIndividual(4,:);
AccuracySVM2 = [max(AccuracySVM) median(AccuracySVM) min(AccuracySVM)];

PrecisionSVM_2 = FinalDataSVMIndividualSpectral(1,:);
PrecisionSVM2_2 = [max(PrecisionSVM) median(PrecisionSVM) min(PrecisionSVM)];
RecallSVM_2 = FinalDataSVMIndividualSpectral(2,:);
RecallSVM2_2 = [max(RecallSVM) median(RecallSVM) min(RecallSVM)];
AccuracySVM_2 = FinalDataSVMIndividualSpectral(4,:);
AccuracySVM2_2 = [max(AccuracySVM) median(AccuracySVM) min(AccuracySVM)];


PrecisionLDA_2 = FinalDataLDAIndividualSpectral(1,:);
PrecisionLDA2_2 = [max(PrecisionSVM) median(PrecisionSVM) min(PrecisionSVM)];
RecallLDA_2 = FinalDataLDAIndividualSpectral(2,:);
length(RecallLDA_2);
RecallLDA2_2 = [max(RecallSVM) median(RecallSVM) min(RecallSVM)];
AccuracyLDA_2 = FinalDataLDAIndividualSpectral(4,:);
AccuracyLDA2_2 = [max(AccuracySVM) median(AccuracySVM) min(AccuracySVM)];




PrecisionLDA = FinalDataLDAIndividual(1,:);
PrecisionLDA2 = [max(PrecisionLDA) median(PrecisionLDA) min(PrecisionLDA)];
RecallLDA = FinalDataLDAIndividual(2,:);
RecallLDA2 = [max(RecallLDA) median(RecallLDA) min(RecallLDA)];
AccuracyLDA = FinalDataLDAIndividual(4,:);
AccuracyLDA2 = [max(AccuracyLDA) median(AccuracyLDA) min(AccuracyLDA)];

bar(AccuracySVM','r');
set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
%set(gca,'XTickLabel',{'S1','','S12','','S23'});
%set(gca,'XTickLabelMode','auto');
%xlim(['S1','S23']);


ylabel('Percentage Accuracy');
xlabel('Users');
set(gca,'fontsize',20);
axis([-inf,inf,0,100]);
saveas(gcf,'AccuracySVMIndividualBlinks.bmp');

bar(AccuracyLDA','b');
set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
%set(gca,'XTickLabel',{'S1','','S12','','S23'});
%set(gca,'XTickLabelMode','auto');
%xlim(['S1','S23']);
ylabel('Percentage Accuracy');
xlabel('Users');
set(gca,'fontsize',20);
axis([-inf,inf,0,100]);
saveas(gcf,'AccuracyLDAIndividualBlinks.bmp');

DataLabel = [repmat({'Precision'},1,2),repmat({'Recall'},1,2), repmat({'Accuracy'},1,2)];
%DataLabel2 = [repmat({'SVM'},1,3),repmat({'LDA'},1,3)];
DataLabel2 = repmat({'SVM' 'LDA'},1,3);
color = ['b','b','b','r','r','r'];
boxplot([PrecisionSVM', PrecisionLDA',RecallSVM', RecallLDA', AccuracySVM',  AccuracyLDA'],{DataLabel2,DataLabel},'factorgap',[5 2],'labelverbosity','minor');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

%set(gca,'XTickLabel',{'S1','S2','S3','S4','S5','S6'});
ylabel('Percentages');
%xlabel('SVM','LDA');
axis([0.5,7.2,20,100]);
set(gca,'fontsize',16);
set(findobj(gca,'Type','text'),'FontSize',16); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotComarisionIndividualBlinks.bmp');



DataLabel = [repmat({'Precision'},1,2),repmat({'Recall'},1,2), repmat({'Accuracy'},1,2)];
%DataLabel2 = [repmat({'SVM'},1,3),repmat({'LDA'},1,3)];
DataLabel2 = repmat({'SVM Spectral' 'SVM Blinks'},1,3);
color = ['r','r','r','r','r','r'];
boxplot([PrecisionSVM_2', PrecisionSVM',RecallSVM_2', RecallSVM', AccuracySVM_2',  AccuracySVM'],{DataLabel2,DataLabel},'factorgap',[5 2],'labelverbosity','minor');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

%set(gca,'XTickLabel',{'S1','S2','S3','S4','S5','S6'});
ylabel('Percentages');
%xlabel('SVM','LDA');
axis([0.5,7.2,35,100]);
set(gca,'fontsize',16);
set(findobj(gca,'Type','text'),'FontSize',16); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotComarisionIndividualBlinksandSpectral.bmp');


%DataLabel = [repmat({'Recall'},1,2)];
%DataLabel2 = [repmat({'SVM'},1,3),repmat({'LDA'},1,3)];
DataLabel2 = repmat({'SVM Spectral' 'SVM Blinks'},1,1);
color = ['r','r'];
boxplot([RecallSVM_2', RecallSVM'],DataLabel2,'labelverbosity','minor');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

%set(gca,'XTickLabel',{'S1','S2','S3','S4','S5','S6'});
ylabel('Percentages');
%xlabel('SVM','LDA');
axis([0.5,2.5,35,100]);
set(gca,'fontsize',20);
set(findobj(gca,'Type','text'),'FontSize',20); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotComarisionIndividualBlinksandSpectral_SVM_RECALL.bmp');


%DataLabel = [repmat({'Recall'},1,2)];
%DataLabel2 = [repmat({'SVM'},1,3),repmat({'LDA'},1,3)];
DataLabel2 = repmat({'LDA Spectral' 'LDA Blinks'},1,1);
color = ['b','b'];
length(RecallLDA_2);
boxplot([RecallLDA_2', RecallLDA'],DataLabel2,'labelverbosity','minor');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

%set(gca,'XTickLabel',{'S1','S2','S3','S4','S5','S6'});
ylabel('Percentages');
%xlabel('SVM','LDA');
axis([0.5,2.5,35,100]);
set(gca,'fontsize',20);
set(findobj(gca,'Type','text'),'FontSize',20); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotComarisionIndividualBlinksandSpectral_LDA_RECALL.bmp');
