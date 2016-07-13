t=0;
f=0;
filename = 'raw_fft0.csv';
Value = 0.859375;
%Z = [Value];
for i = 2:20
    newV = i * 0.859375;
    Value = [Value newV];
end

Y = csvread(filename,26000,0,[26000,0,33000,0]);


filename2 = 'bothAlphaandfreqeverything.csv';
Z = csvread(filename,26000,1,[26000,1,33000,20]);
%M = M';
X = csvread(filename2,26000,11,[26000,11,33000,11]);
%ax = imagesc(t,f,M);
C = del2(Z);

waterfall(Value,Y,Z);
colorbar;
%set(ax,'YDir','normal');
%plot(X);