filename = 'bothAlphaandfreqeverything_fresh.csv';
filename2 = 'bothAlphaandfreqeverything_drowsy.csv';
Y = csvread(filename,1,1,[1,1,37000,20]);
Z = csvread(filename2,1,1,[1,1,37000,20]);
X = [Y;Z];

Alldatalable = [];
for k=1:length(X)
    if k<=length(Y)
        Alldatalable = [Alldatalable;1];
    else
        Alldatalable = [Alldatalable;2];
    end
end
testing_ind = [];
for i=1:length(X)
    if rand>0.8
        testing_ind = [testing_ind,i];
    end
end

%XX = X';
%L = unique(Alldatalable)';
%L = vec2ind(T')';
W = LDA(X,Alldatalable);
L = [ones(74000,1) X] * W';
P = exp(L) ./ repmat(sum(exp(L),2),[1 2]);

% [Y, W, lambda] = LDA(XX, L);
% 
% figure;
% 
% D = size(XX,2);
% for d=1:D
%     % Original Data
%     subplot(D,2,2*d-1);
%     plot(XX(:,d));
%     ylabel(['x_' num2str(d)]);
%     if d==D
%         xlabel('Sample Index');
%     end
%     if d==1
%         title('Original Data');
%     end
%     grid on;
%     
%     % Transformed Data
%     subplot(D,2,2*d);
%     plot(Y(:,d));
%     ylabel(['y_' num2str(d)]);
%     if d==D
%         xlabel('Sample Index');
%     end
%     if d==1
%         title('LDA Output');
%     end
%     grid on;
%     
% end