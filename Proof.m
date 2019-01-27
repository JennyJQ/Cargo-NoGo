i = 1;
while i<x
if moves(i) == 16
    trip = true;
    
    while trip == true && i<x
        if (moves(i) == 15)
            trip = false;
%             
        end
%         
%         Trip(i) = Dd(i);
        
        Alarm(Dd(i),trip,timei(i));
        i = i+1;
    end

end
if i<x
    Alarm(Dd(i),trip,timei(i));
    i = i+1;
end
end