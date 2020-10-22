FROM python:3.7-slim
RUN mkdir -p /cd_insights && mkdir -p /var/log/cd_insights
WORKDIR /cd_insights
COPY . .
RUN pip3 install -r requirements.txt && chmod +x entrypoint.sh && chmod -R +x config/env
ENTRYPOINT ["/cd_insights/entrypoint.sh"]