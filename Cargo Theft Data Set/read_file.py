import csv
import numpy as np
import pandas as pd
#import time
from time import sleep
import sys
import random

data_path = r'C:\Users\priya\Desktop\Cargo Theft Data Set\ITM_20190121_test.csv'

with open(data_path, 'r') as f:
	reader = csv.reader(f, delimiter=',')
	headers = next(reader)
	#get all the rows as a list
	data = list(reader)
	#transform data into numpy array
	data = np.array(data)#.astype(float)

print(data.shape)
#print(data[:3])
print(data.dtype)
print(type(data))

df = pd.DataFrame(data, columns=['ID', 'DeviceSerial', 'Vin', 'MessageType', 'ReportType',  'MsgNum', 'TripState',  'ReceivedTimestamp', 'Latitude', 'Longitude', 'MessageXML',  'ProcessedTimestamp', 'IsProcessed', 'CollectionTimestamp', 'ManufacturerSerial'],)#,index=headers)

#df = pd.DataFrame(data, columns=['ID', 'DeviceSerial', 'ReceivedTimestamp', 'Latitude', 'Longitude'],)#,index=headers)

print(type(df))
print(df.dtypes)
print(df[:1])

#New_df = df[df['Latitude'].isnull()]

df = df[(df != 'NULL').all(1)]
df['Latitude'].astype('float')
#New_df['Longitude'].astype('float')
df['ReceivedTimestamp'] = pd.to_datetime(df['ReceivedTimestamp'])
filtered_df = df[df['Latitude'].notnull()]
filtered_df['Latitude'] = filtered_df['Latitude'].astype('float')
filtered_df['Longitude'] = filtered_df['Longitude'].astype('float')


print(filtered_df.dtypes)
#i = 0
#if(i%5==0):
#	filtered_df['DriverLat'][i:i+5] = filtered_df['Latitude'][i:i+5] + 0.01
#	++i
#else:
#	time.sleep(30)


#filtered_df.loc[len(filtered_df.index), i] = filtered_df.loc[len(filtered_df.index), i] + 0.01
if(random.randint(1,101) <= 50):
        filtered_df['DriverLat'] = filtered_df['Latitude'] + 0.01
else:
        filtered_df['DriverLat'] = filtered_df['Latitude']

filtered_df['DriverLong'] = filtered_df['Longitude']


print('---------------------------')
print(filtered_df.shape)
for i in range(0, 25, 5):
	filtered_df[0:i+5].to_csv('DemoData.csv', sep=',', header=True)
	
	for i in range(21):
	    sys.stdout.write('\r')
	    # the exact output you're looking for:
	    sys.stdout.write("[%-20s] %d%%" % ('='*i, 5*i))
	    sys.stdout.flush()
	    sleep(0.25)	
	# TODO: append to end of CSV
	#time.sleep(5)
	#print('*->')
