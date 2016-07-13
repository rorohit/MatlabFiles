traininglablenew = [,];
traininglable1 = cell2mat(traininglable)
for k = 1:length(traininglable)
    traininglable1(1,1)
  
    if str2num(traininglable1(k,2)) == 0
        traininglablenew = [traininglablenew;[0 1]];
    elseif str2num(traininglable1(k,2)) == 1
        traininglablenew = [traininglablenew;[1 0]];
    end
end
