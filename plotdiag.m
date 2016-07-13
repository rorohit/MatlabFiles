path = 'C:/Users/sensors/Documents/MATLAB/AccuracyLDA minute wise User-80-20 8 fold 70_pc/';%/';   AccuracySVM minute wise User-80-20 8 fold 70_pc
filename = 'Information ';
NamesSubject2 = char('Shashank','Tarun','Masahiro','Madhuri','DrVlad','Bhaskar','Piyesh','Shobhit','Suma','Deepak','Znana','Shrikant') ;
NamesSubject = char(' User1',' User2',' User3',' User4',' User5',' User6',' User7',' User8',' User9',' User10',' User11',' User12') ;
X = [];
for k=1:12
    filename1 = strcat(path, filename, NamesSubject(k,:),'.mat');
    S = load(filename1);
    z = NamesSubject(k,:)
    
    if k == 14
        X = [X S.Information(:,3)];
    else
        X = [X S.Information1(:,3)];
    end
end
        
boxplot(X,NamesSubject2);
xlabel('Names');
ylabel('Percentages');
title('LDA User wise Accuracy 80-20 Data with 70% Threshold');