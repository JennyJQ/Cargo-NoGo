[moves,x] = extract(trucks(ind),DeviceSerial,ReportType);

NMTOS = sum(moves == 7);

i = 1;
Trip = zeros([x,1]);
NMTO = 0;
Starts = [];
Ends = [];
while i<x
if moves(i) == 16
    trip = true;
    Starts = [Starts i ];
%       disp("Start Trip");
    while trip == true && i<x
        if (moves(i) == 15)
            trip = false;
            Ends = [Ends i];
%              disp("End Trip");
        end
        
        Trip(i) = Dd(i);
        i = i+1;
        if moves(i) == 7
            NMTO = NMTO+1;
        end
    end
    
end
    i = i+1;
end
plot(timei(1:x),Trip,'ko');




%  
%  switch moves(2)
%      
%      case 7 %NoMoveTimeout
%          disp("Yes");
%          
%      case 
%          
%      case
%          
%      case
%  end
%  
 