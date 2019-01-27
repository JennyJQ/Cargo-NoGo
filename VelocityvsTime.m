[long,x]  = extract(trucks(ind),DeviceSerial,longitude);
timei  = extract(trucks(ind),DeviceSerial,time);
lat  = extract(trucks(ind),DeviceSerial,Latitude);
Dd = zeros([x-1,1]);
for y = 1:x-1
Dd(y) = (lat(y+1)-lat(y))^2 + (long(y+1)-long(y))^2;
Dd(y) = sqrt(Dd(y));
end
plot(timei(1:(x-1)),Dd,'b.');
hold on;







