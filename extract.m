function [info,x1] = extract(truck,Device,Data)
truckcheck = Device == truck;
x = length(Data);
x1 = sum(truckcheck);
info = zeros([x1,1]);
j = 0;
for i = 1:x
    if truckcheck(i) == 1
        j = j+1;
        info(j) = Data(i);
    end
end

end

