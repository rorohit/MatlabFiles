adddpath('C:/Users/sensors/Documents/MATLAB/AccuracySVM minute wise User-80-20 8 fold 50_pc')
filename = ' Information.mat';
%NamesSubject = char('Shashank.csv','Tarun.csv','Masahiro.csv','Madhuri.csv','vlad.csv','Bhaskar.csv','Piyesh.csv','Shobhit.csv','Suma.csv','Deepak.csv','znana.csv','Shrikant.csv') ;
NamesSubject = char('User1','User2','User3','User4','User5','User6','User7','User8','User9','User10','User11','User12') ;
X = [];
for k=1:12
    filename1 = strcat(NamesSubject(k,:),filename);
    S = load(filename1);
    X = [X S(1)];
end
        
