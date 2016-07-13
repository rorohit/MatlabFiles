AccuracyLDANew = [];

    obj = fitcdiscr(training13,traininglablenew13,'DiscrimType','pseudolinear');
    %obj.DiscrimType = 'quadratic';
    
    [label,score,cost] = predict(obj,testing13);
    Accuracy = 100 - sum(abs(label - testinglablenew13))*100/length(testing13)
    AccuracyLDANew = [AccuracyLDANew;Accuracy];

    