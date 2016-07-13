NamesSubject = char('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21','S22','S23') ;
FinalDataSVMCrossValidation = csvread('FinalDataSVMCrossValidation.csv',0,0,[0,0,22,3]);
FinalDataLDACrossValidation = csvread('FinalDataLDACrossValidation.csv',0,0,[0,0,22,3]);

FinalDataSVMCrossValidation = FinalDataSVMCrossValidation';
FinalDataLDACrossValidation = FinalDataLDACrossValidation';


PrecisionSVM = [];
PrecisionSVM2 = [];
RecallSVM = [];
RecallSVM2 = [];
AccuracySVM = [];
AccuracySVM2 = [];

PrecisionLDA = [];
PrecisionLDA2 = [];
RecallLDA = [];
RecallLDA2 = [];
AccuracyLDA = [];
AccuracyLDA2 = [];



PrecisionSVM = FinalDataSVMCrossValidation(1,:);
PrecisionSVM2 = [max(PrecisionSVM) median(PrecisionSVM) min(PrecisionSVM)];
RecallSVM = FinalDataSVMCrossValidation(2,:);
RecallSVM2 = [max(RecallSVM) median(RecallSVM) min(RecallSVM)];
AccuracySVM = FinalDataSVMCrossValidation(4,:);
AccuracySVM2 = [max(AccuracySVM) median(AccuracySVM) min(AccuracySVM)];

PrecisionLDA = FinalDataLDACrossValidation(1,:);
PrecisionLDA2 = [max(PrecisionLDA) median(PrecisionLDA) min(PrecisionLDA)];
RecallLDA = FinalDataLDACrossValidation(2,:);
RecallLDA2 = [max(RecallLDA) median(RecallLDA) min(RecallLDA)];
AccuracyLDA = FinalDataLDACrossValidation(4,:);
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
saveas(gcf,'AccuracySVMCrossValidation.bmp');

bar(AccuracyLDA','b');
set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
%set(gca,'XTickLabel',{'S1','','S12','','S23'});
%set(gca,'XTickLabelMode','auto');
%xlim(['S1','S23']);
ylabel('Percentage Accuracy');
xlabel('Users');
set(gca,'fontsize',20);
axis([-inf,inf,0,100]);
saveas(gcf,'AccuracyLDACrossValidation.bmp');

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
axis([0.5,7.2,25,92]);
set(gca,'fontsize',12);
set(findobj(gca,'Type','text'),'FontSize',12); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotComarisionCrossValidation.bmp');

