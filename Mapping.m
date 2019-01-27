truck1 = DeviceSerial == 1088217019;
x = length(DeviceSerial);
x1 = sum(truck1);
long1 = zeros([x1,1]);
j = 0;
for i = 1:x
    if truck1(i) == 1
        j = j+1;
        long1(j) = ReceivedTimestamp(i);
    end
    
    
end

plot(1:x1,long1);