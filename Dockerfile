FROM gradle
RUN mkdir /home/gradle/app
WORKDIR /home/gradle/
COPY ./src/ /home/gradle/src
COPY requirements.txt /home/gradle/
COPY build.gradle /home/gradle/

RUN apt update && apt install python3 python3-pip -y
RUN cat build.gradle
RUN gradle purge
RUN gradle dependances
RUN gradle quality
RUN gradle packageDistribution


