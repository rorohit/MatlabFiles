CF1 = [];
CD1 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:15
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12313)/2)
        if ADATA12313(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12313(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF1 = [CF1;classification_fresh];
    CD1 = [CD1;classification_drowsy];
    check = 0;
end
            