filename = 'bothAlphaandfreqeverything_fresh.csv';
filename2 = 'bothAlphaandfreqeverything_drowsy.csv';
Y = csvread(filename,1,1,[1,1,37000,10]);
Z = csvread(filename2,1,1,[1,1,37000,10]);
Y = [Y;Z];

[IDC,C] = k_means(Y,2);
[IDC2,CC] = kmeans(Y,2);
ux = unique(IDC);
if length(ux) == 1, counts = length(ux);
else counts = hist(IDC,ux);
end

%plot(Y(IDC==1,1),Y(IDC==1,2),'r.',Y(IDC==2,1),Y(IDC==2,2),'b.', C(:,1),C(:,2),'kx');
plot(Y(IDC2==1,1),Y(IDC2==1,2),'r.',Y(IDC2==2,1),Y(IDC2==2,2),'b.', CC(:,1),CC(:,2),'kx');

% plot(Y(IDC==1,1),Y(IDC==1,2),'.',...
% Y(IDC==2,1),Y(IDC==2,2),'.',...
% Y(IDC==3,1),Y(IDC==3,2),'.',...
% C(:,1),C(:,2),'+','linewidth',2);
% figure;
% plot(Y(IDC==1,1),Y(IDC==1,2),'r.','MarkerSize',12)
% hold on
% plot(Y(IDC==2,1),Y(IDC==2,2),'b.','MarkerSize',12)
% plot(C(:,1),C(:,2),'kx',...
%      'MarkerSize',15,'LineWidth',3)
% legend('Cluster 1','Cluster 2','Centroids',...
%        'Location','NW')
% title 'Cluster Assignments and Centroids'
% hold off