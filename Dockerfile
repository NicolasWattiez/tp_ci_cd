FROM gradle
RUN mkdir /home/gradle/app
WORKDIR /home/gradle/
COPY ./src/app /home/gradle/app
COPY requirements.txt /home/gradle/
COPY build.gradle /home/gradle/

RUN apt update && apt install python3 python3-pip -y

RUN gradle purge
RUN gradle dependances
RUN gradle packageDistribution


