Combined = [];
for i=1:12
    Combined = [Combined;CD7(i) CF7(i)];
end
bar(Combined);
set(gca,'XTickLabel',{'Shashank','Tarun','Masahiro','Madhuri','vlad','Bhaskar','Piyesh','Shobhit','Suma','Deepak','znana','Shrikant'});
xlabel('Names');
ylabel('Percentages');
title('LDA 11 fold CrossValidation with 70% Threshold');
