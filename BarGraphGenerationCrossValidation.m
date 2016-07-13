Combined = [];
for i=1:23
    Combined = [Combined;(CDDD(i)+CFFF(i))/2];
end
bar(Combined);
set(gca,'XTickLabel',{'Shashank','Masahiro','Madhuri','vlad','Bhaskar','Shobhit','Suma','Tarun','Shrikant','Krishna','Ali','Haresh','Piyesh','znana','Deepak','Pravija','Rohit','Sravan','Shweta','Shruthi','Aliya','Niel','Gopi'});
xlabel('Names');
ylabel('Percentages');
title('SVM 22 fold CrossValidation with 50% Threshold(per 5 Minutes  drowsy and fresh combined)');
