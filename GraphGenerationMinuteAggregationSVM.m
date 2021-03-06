finallabledata5min = [];
finallabledata5min = csvread('SVMFinalLabel5MinAggregation.csv',0,0,[0,0,19,22]);
finallabledata4min = csvread('SVMFinalLabel4MinAggregation.csv',0,0,[0,0,24,22]);
finallabledata3min = csvread('SVMFinalLabel3MinAggregation.csv',0,0,[0,0,32,22]);
finallabledata2min = csvread('SVMFinalLabel2MinAggregation.csv',0,0,[0,0,49,22]);
finallabledata1min = csvread('SVMFinalLabel1MinAggregation.csv',0,0,[0,0,99,22]);

finallablecheck = csvread('SVMFinalLabelCheck1MinAggregation.csv',0,0,[0,0,5999,22]);

CountfinalLabelcheck = finallablecheck == 0;

Count5min = finallabledata5min <= 150;
Count4min = finallabledata4min <= 120;
Count3min = finallabledata3min <= 90;
Count2min = finallabledata2min <= 60;
Count1min = finallabledata1min <= 30;

PerAccu5min = 100 * sum(Count5min)./20;
PerAccu2min = 100 * sum(Count2min)./50;
PerAccu1min = 100 * sum(Count1min)./100;
PerAccu4min = 100 * sum(Count4min)./25;
PerAccu3min = 100 * sum(Count3min)./33;
PerAccuracy = 100 * sum(CountfinalLabelcheck)./6000;

boxplot([PerAccuracy',PerAccu1min', PerAccu3min', PerAccu5min']);
set(gca,'XTickLabel',{'NoAgg','1Min','3Min','5Min'});
xlabel('Aggregation Duration');
ylabel('Percentage Accuracy');

color = ['r','r','r','r'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end
axis([0.5,4.8,40,100]);
set(gca,'fontsize',15);
set(findobj(gca,'Type','text'),'FontSize',15); 
set(findobj(gca,'Type','text'),'VerticalAlignment','top')

saveas(gcf,'BoxPlotMinuteAggregationComparisionSVM.bmp');