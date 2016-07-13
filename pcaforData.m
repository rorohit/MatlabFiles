clc;
close all;
clear all;
filename = 'Raw_fft0.csv';
Y = csvread(filename,1,1,[1,1,37000,128]);
%Label = csvread(filename,0,1,[0,1,0,20]);
[coff,scores,pcvars] = pca(Y');
x = zscore(scores(:,1));
y = zscore(scores(:,2));
z = zscore(scores(:,3));

gscatter3(x,y,z,subtypes,{'b','g','m'},{'.','.','.'},15);
xlabel(['PC1-(',num2str(round(pcvars(1)/sum(pcvars)*100)),'%)']);
ylabel(['PC2-(',num2str(round(pcvars(2)/sum(pcvars)*100)),'%)']);
zlabel(['PC3-(',num2str(round(pcvars(3)/sum(pcvars)*100)),'%)']);
