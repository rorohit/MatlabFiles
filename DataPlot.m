filename1 = 'newdata33d.csv';
filename2 = 'newdata33f.csv';

X1 = csvread(filename1,1,1,[1,1,32000,1]);
X2 = csvread(filename2,1,1,[1,1,32000,1]);
X1 = X1;
X2 = X2;
Y = 1:32000;
Y = Y;
Z = X1-X2;
plot(Y,X1,Y,X2);
%plot(Y,Z);