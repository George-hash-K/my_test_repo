FROM python:3.7-alpine
#FROM arm64v8/python:3-alpine
#creates work dir
WORKDIR /app
#copy python script to the container folder app
COPY upload_log_to_s3.py /app/upload_log_to_s3.py
# aws credential
ENV AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXX"
ENV AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXX"
# run
RUN chmod +x /app/upload_log_to_s3.py
RUN pip3 install boto3 
#user is appuser
USER root
ENTRYPOINT ["python", "/app/upload_log_to_s3.py"]
