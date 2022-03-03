FROM ubuntu:latest
MAINTAINER "Simone Celati" 
ADD ./secretFolder.zip /tmp/
RUN useradd -u 567 -r alfio2 -m -d /home/alfio2 
RUN apt update -y && apt-get install -y zip
RUN chgrp -R 0 /home/alfio2/  
WORKDIR /home/alfio2/
RUN mv /tmp/secretFolder.zip /home/alfio2/ && unzip secretFolder.zip
RUN chmod -R 777 ./secretFolder/ && chown -R 567:567 ./secretFolder/
USER alfio2
RUN touch secretFolder/SuccessFile
ENTRYPOINT ["/bin/bash", "-c", "--"]
CMD ["while true; do sleep 100; echo Ciao; done;"]
