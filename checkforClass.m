ADATA1239 = [];
A = [];
for i=1:length(finallabledata)
    A = [];
    for k = 1:12
        x = finallabledata(i,k)
        if finallabledata(i,k)<=25
            A = [A 1];
        else
            A = [A 2];
        
        end
        
    end
    ADATA1239 = [ADATA1239;A];
end