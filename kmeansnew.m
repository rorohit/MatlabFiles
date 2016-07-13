filename = 'Alpha_Absolute.csv';
A = csvread(filename,1,1,[1,1,37000,1]);
filename = 'Beta_Absolute.csv';
B = csvread(filename,1,1,[1,1,37000,1]);
filename = 'Theta_Absolute.csv';
T = csvread(filename,1,1,[1,1,37000,1]);
filename = 'Delta_Absolute.csv';
D = csvread(filename,1,1,[1,1,37000,1]);

Y = [D T A B];


[IDC,C] = k_means(Y,2);
IDC2 = kmeans(Y,2);
ux = unique(IDC);
if length(ux) == 1, counts = length(ux);
else counts = hist(IDC,ux);
end

plot(Y(IDC==1,1),Y(IDC==1,2),'r.',Y(IDC==2,1),Y(IDC==2,2),'b.', C(:,1),C(:,2),'kx');