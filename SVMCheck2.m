ADATA_X = [];
CDDDD = [];
CFFFF = [];
ADATA_Y = [];
A = [];
B = [];
value = 0;
count_drowsy = 0;
count_fresh = 0;
for i=1:length(finallablecheck(1,:))
    for k=1:length(finallablecheck)/2
        if(finallablecheck(k,i)==1)
            count_fresh = count_fresh + 1;
        end
        if(finallablecheck(k+3000,i)==1)
            count_drowsy = count_drowsy + 1;
        end
        value = value + 1;
        if(value==300)
            A = [A;count_fresh];
            B = [B;count_drowsy];
            count_fresh = 0;
            count_drowsy = 0;
            value = 0;
        end
    end
    
    ADATA_X = [ADATA_X A];
    ADATA_Y = [ADATA_Y B];
    A = [];
    B = [];
end

countf = 0;
countd = 0;
percentf = 0;
percentd = 0;
for i=1:length(ADATA_X(1,:))
    for k=1:length(ADATA_X(:,1))
        if(ADATA_X(k,i)<150)
            countf = countf + 1;
        end
        if(ADATA_Y(k,i)<150)
            countd = countd + 1;
        end
    end
    percentf = countf*100/10;
    percentd = countd*100/10;
    CFFFF = [CFFFF percentf];
    CDDDD = [CDDDD percentd];
    countf = 0;
    countd = 0;
    percentf = 0;
    percentd = 0;
    
end
