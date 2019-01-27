if length(Starts)>length(Ends)
    Ends = [Ends,x];
end

yi = length(Starts);
y = [];
for m = 1:yi
   y = [y;moves(Starts(m):Ends(m))];   
end

% for k = 1:17
% stats(k,ind) = sum(y==k);
% end



