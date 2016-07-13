

ADATA12313 = [];
A = [];
%length(finallabledata)
%length(finallabledata)
for i=1:length(finallabledata)
    A=[];
    for k=1:length(finallabledata(:,i))
        x = finallabledata(i,k)
        if finallabledata(i,k)<=150
            A = [A 1];
        else
            A = [A 2];
        end
    end
    ADATA12313 = [ADATA12313;A];
    
end
CF5 = [];
CD5 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:length(NamesSubject)
    check=0;
    classification_fresh=0;
    classification_drowsy=0;
    
    for k=1:(length(ADATA12313(:,1))/2)
        if ADATA12313(k,i)==1
            classification_fresh = classification_fresh+1;
        end
        if ADATA12313(10+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    
    CF5 = [CF5 classification_fresh];
    CD5 = [CD5 classification_drowsy];
    check=0;
end
