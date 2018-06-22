maxx = 1;
maxy = 1;
maxl = foodlevel(100,50);

for i = 1:150
    for j = 1:60
        if foodlevel( i,j )>0
             if foodlevel( i,j) < maxl
             maxx = i;
             maxy = j;
             maxl = foodlevel(i,j);
            end
        end
    end
end

fprintf('%d ; %d : %d ',maxx,maxy,foodlevel(maxx,maxy))