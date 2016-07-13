NamesSubject = char('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10','S11','S12','S13','S14','S15','S16','S17','S18','S19','S20','S21','S22','S23') ;
FinaldataSVMIndividual = csvread('FinaldataSVMIndividualLinear.csv',0,0,[0,0,22,3]);
FinaldataSVMIndividualP = csvread('FinaldataSVMIndividualPoly.csv',0,0,[0,0,22,3]);
FinaldataSVMIndividualR = csvread('FinaldataSVMIndividualRBF.csv',0,0,[0,0,22,3]);

FinaldataSVMIndividual = FinaldataSVMIndividual';
FinaldataSVMIndividualP = FinaldataSVMIndividualP';
FinaldataSVMIndividualR = FinaldataSVMIndividualR';

PrecisionSVM = FinaldataSVMIndividual(1,:);
PrecisionSVM2 = [max(PrecisionSVM) median(PrecisionSVM) min(PrecisionSVM)];
RecallSVM = FinaldataSVMIndividual(2,:);
RecallSVM2 = [max(RecallSVM) median(RecallSVM) min(RecallSVM)];
AccuracySVM = FinaldataSVMIndividual(4,:);
AccuracySVM2 = [max(AccuracySVM) median(AccuracySVM) min(AccuracySVM)];

PrecisionSVMP = FinaldataSVMIndividualP(1,:);
PrecisionSVMP2 = [max(PrecisionSVMP) median(PrecisionSVMP) min(PrecisionSVMP)];
RecallSVMP = FinaldataSVMIndividualP(2,:);
RecallSVMP2 = [max(RecallSVMP) median(RecallSVMP) min(RecallSVMP)];
AccuracySVMP = FinaldataSVMIndividualP(4,:);
AccuracySVMP2 = [max(AccuracySVMP) median(AccuracySVMP) min(AccuracySVMP)];

% bar(AccuracySVM','r');
% set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
% %set(gca,'XTickLabel',{'S1','','S12','','S23'});
% 
% %xlim(['S1','S23']);
% ylabel('Percentage Accuracy');
% xlabel('Users');
% set(gca,'fontsize',20);
% axis([-inf,inf,0,100]);
% saveas(gcf,'AccuracySVMIndividualSVMLinear-Poly.bmp');



PrecisionSVMR = FinaldataSVMIndividualR(1,:);
PrecisionSVMR2 = [max(PrecisionSVMR) median(PrecisionSVMR) min(PrecisionSVMR)];
RecallSVMR = FinaldataSVMIndividualR(2,:);
RecallSVMR2 = [max(RecallSVMR) median(RecallSVMR) min(RecallSVMR)];
AccuracySVMR = FinaldataSVMIndividualR(4,:);
AccuracySVMR2 = [max(AccuracySVMR) median(AccuracySVMR) min(AccuracySVMR)];

% bar(AccuracySVM','r');
% set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
% %set(gca,'XTickLabel',{'S1','','S12','','S23'});
% 
% %xlim(['S1','S23']);
% ylabel('Percentage Accuracy');
% xlabel('Users');
% set(gca,'fontsize',20);
% axis([-inf,inf,0,100]);
% saveas(gcf,'AccuracySVMIndividualSVMLinear-Poly.bmp');
% 
% 
% 
% bar(AccuracySVMR','b');
% set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
% %set(gca,'XTickLabel',{'S1','','S12','','S23'});
% set(gca,'fontsize',20);
% %xlim(['S1','S23']);
% ylabel('Percentage Accuracy');
% xlabel('Users');
% axis([-inf,inf,0,100]);
% saveas(gcf,'AccuracySVMPIndividualSVMLinear-Poly.bmp');

DataLabel = [repmat({'Precision'},1,3),repmat({'Recall'},1,3), repmat({'Accuracy'},1,3)];
%DataLabel2 = [repmat({'SVM'},1,3),repmat({'SVMP'},1,3)];
DataLabel2 = repmat({'SVM' 'SVMP' 'SVMR'},1,3);
color = ['g','g','g','b','b','b','r','r','r'];

boxplot([PrecisionSVM', PrecisionSVMP', PrecisionSVMR',RecallSVM', RecallSVMP', RecallSVMR', AccuracySVM',  AccuracySVMP',  AccuracySVMR'],{DataLabel2,DataLabel},'factorgap',[5 2],'labelverbosity','minor');

h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

%set(gca,'XTickLabel',{'S1','S2','S3','S4','S5','S6'});
axis([0.5,12,68,95]);
set(gca,'fontsize',12);
set(findobj(gca,'Type','text'),'FontSize',12); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')
ylabel('Percentages');

%xlabel('SVM','SVMP');
saveas(gcf,'BoxPlotComarisionIndividualSVMLinear-Poly2.bmp');


bar([AccuracySVM' AccuracySVMP' AccuracySVMR']);%,'r'
set(gca,'Xtick',1:23,'XTickLabel',{'S1','','','','','S6','','','','','','S12','','','','','','S18','','','','','S23'});
%set(gca,'XTickLabel',{'S1','','S12','','S23'});

%xlim(['S1','S23']);
ylabel('Percentage Accuracy');
xlabel('Users');
set(gca,'fontsize',20);
axis([-inf,inf,0,100]);
saveas(gcf,'AccuracySVMIndividualSVMLinear-Poly2.bmp');



