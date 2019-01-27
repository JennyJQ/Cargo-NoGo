
sample = ITM20190121;

ID = table2array(sample(2:end,1));
ID = ID';

DeviceSerial = table2array(sample(2:end,2));
DeviceSerial = DeviceSerial';

Vin = table2array(ITM20190121(2:end,3));
Vin = Vin';

MessageType = table2array(sample(2:end,4));
MessageType = MessageType';

ReportType = table2array(sample(2:end,5));
ReportType = ReportType';

MsgNum = table2array(sample(2:end,6));
MsgNum = MsgNum';

TripState = table2array(sample(2:end,7));
TripState = TripState';

ReceivedTimestamp = table2array(sample(2:end,8));
ReceivedTimestamp = ReceivedTimestamp';

Latitude = table2array(sample(2:end,9));
Latitude = Latitude';

longitude = table2array(ITM20190121(2:end,10));
longitude = longitude';

MessageXML = table2array(sample(2:end,11));
MessageXML = MessageXML';

ProcessedTimestamp = table2array(sample(2:end,12));
ProcessedTimestamp = ProcessedTimestamp';

IsProcessed = table2array(sample(2:end,13));
IsProcessed = IsProcessed';

CollectionTimestamp = table2array(sample(2:end,13));
CollectionTimestamp = CollectionTimestamp';

ManufactureSerial = table2array(sample(2:end,14));
ManufactureSerial = ManufactureSerial';



