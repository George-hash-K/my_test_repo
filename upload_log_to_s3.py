#!/usr/bin/python3
#################################
#   george kushner
#   jan 20 2020
#   inno test minicube crontab
#################################

import boto3
from datetime import datetime

t = datetime.now()
today = t.strftime("%B %d %Y %H:%M:%S")
print("Today's DATE:", today)


mylog = open("/var/log/innovid.log", "a")
mylog.write(today)
mylog.write("\n")
mylog.close()

# get s3
s3 = boto3.resource('s3')

# upload
s3.Bucket('my-freaking-bucket-n2').upload_file('/var/log/innovid.log', 'innovid.log.' + str(t))


