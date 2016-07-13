testlabledataDrowsy = csvread('SVMFinalLabelCheck5MinAggregation.csv',3000,0,[3000,0,5999,22]);
TruePositive_NoAgg = 3000 - sum(testlabledataDrowsy);
FalseNegative_NoAgg = sum(testlabledataDrowsy);
Recall_NoAgg = TruePositive_NoAgg ./(TruePositive_NoAgg + FalseNegative_NoAgg);
Recall_NoAgg = 100 .* Recall_NoAgg;

Sum1min = [];
Sum3min = [];
Sum5min = [];

Onemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Threemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
Fivemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
count1 = 0;
count3 = 0;
count5 = 0;
for i=1:length(testlabledataDrowsy)
    count1 = count1 + 1;
    count3 = count3 + 1;
    count5 = count5 + 1;
    Onemin = Onemin + testlabledataDrowsy(i,:);
    Threemin = Threemin + testlabledataDrowsy(i,:);
    Fivemin = Fivemin + testlabledataDrowsy(i,:);
    if(count1 == 60)
        Sum1min = [Sum1min;Onemin];
        Onemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        count1 = 0;
    end
    if(count3 == 180)
        Sum3min = [Sum3min;Threemin];
        Threemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        count3 = 0;
    end
    if(count5 == 300)
        Sum5min = [Sum5min;Fivemin];
        Fivemin = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        count5 = 0;
    end
end


Truepositive5min = Sum5min <= 150;
Truepositive3min = Sum3min <= 90;
Truepositive1min = Sum1min <= 30;

Recall5min = 100 * sum(Truepositive5min) ./ 10;
Recall3min = 100 * sum(Truepositive3min) ./ 16.67;
Recall1min = 100 * sum(Truepositive1min) ./ 50;

boxplot([Recall_NoAgg', Recall1min', Recall3min',Recall5min',]);
set(gca,'XTickLabel',{'NoAgg','1Min','3Min','5Min'});
xlabel('Aggregation Duration');
ylabel('Recall');

color = ['r','r','r','r'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end
axis([0.5,4.6,15,100]);
set(gca,'fontsize',16);
set(findobj(gca,'Type','text'),'FontSize',16); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotMinuteAggregationComparisionSVM_Recall.bmp');

