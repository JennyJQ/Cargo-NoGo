[long,x]  = extract(trucks(ind),DeviceSerial,longitude);
lat  = extract(trucks(ind),DeviceSerial,Latitude);

% plot(long,lat,'k');
% hold on;
% % plot(long(400:600),lat(400:600),'bo');
% plot(long,lat,'b.');


 
%   y = 1:floor(x/8);
%   plot(long(y),lat(y),'bo');
%    hold on
%    y = floor(x/8):floor(2*x/8);
%    plot(long(y),lat(y),'m.');
%    y = floor(2*x/8):floor(3*x/8);
%    plot(long(y),lat(y),'c.');
%    y = floor(3*x/8):floor(4*x/8);
%    plot(long(y),lat(y),'r.');
%    y = floor(4*x/8):floor(5*x/8);
%    plot(long(y),lat(y),'g.');
   y = floor(13*x/16):floor(14*x/16);
   plot(long(y),lat(y),'b.');
   hold on;
   y = floor(14*x/16):floor(15*x/16);
   plot(long(y),lat(y),'yo');
   y = floor(15*x/16):floor(16*x/16);
   plot(long(y),lat(y),'k.');


%1,9,6
