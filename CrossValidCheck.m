ADATA12313 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:14
        x = finallabledata(i,k)
        if finallabledata(i,k)<=25
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
for i=1:14
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
    
    CF5 = [CF5 classification_fresh];
    CD5 = [CD5 classification_drowsy];
    check = 0;
end
    





ADATA12314 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:14
        x = finallabledata(i,k)
        if finallabledata(i,k)<=20
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA12314 = [ADATA12314;A];
end

CF6 = [];
CD6 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:14
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12314)/2)
        if ADATA12314(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12314(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF6 = [CF6 classification_fresh];
    CD6 = [CD6 classification_drowsy];
    check = 0;
end





ADATA12315 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:14
        x = finallabledata(i,k)
        if finallabledata(i,k)<=15
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA12315 = [ADATA12315;A];
end

CF7 = [];
CD7 = [];
classification_fresh = 0;

classification_drowsy = 0;
for i=1:14
    check = 0;
    classification_fresh = 0;
    classification_drowsy = 0;

    for k=1:(length(ADATA12315)/2)
        if ADATA12315(k,i)==1
            classification_fresh = classification_fresh + 1;
        end
        if ADATA12315(50+k,i)==1
            classification_drowsy = classification_drowsy + 1;
        end
        check = check + 1;
    end
    classification_fresh = classification_fresh*100/check;
    classification_drowsy = classification_drowsy*100/check;
    %classification_drowsy = classification_drowsy*2;
    
    CF7 = [CF7 classification_fresh];
    CD7 = [CD7 classification_drowsy];
    check = 0;
end

        
%count=1;
%lablecheck = [];
%value=0;
%labledata = [];
%for j=1:length(testinglablenew13)
%    if abs(testinglablenew13(j) - predict_label(j))>0:
%        lablecheck = [lablecheck;1];
%        value = value + 1;
%    else
%        lablecheck = [lablecheck;0];
%    end
%    if count == 60:
%        labledata = [labledata;value];
%        value=0;
%        count=0;
%    end
%    count = count + 1;
%end
        
