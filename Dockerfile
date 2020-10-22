### test commit
FROM python:3.6-alpine
RUN pip3 install pika flask
COPY simple_server.py .
EXPOSE 5000
CMD ["python","simple_server.py"]
