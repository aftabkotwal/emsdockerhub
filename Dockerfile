#Base Image
FROM ubuntu:16.04

#Adding discription to the images
LABEL Description="This image is used for github->circleci->dockerhub->tutum->aws" Version="1.0"

# File Author / Maintainer
MAINTAINER pushpendra

#RUN sudo apt-get install openjdk-8-jdk
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update 
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN apt-get clean
#RUN apt-get install -y --no-install-recommends openjdk-7-jdk
RUN apt-get install -y maven
RUN apt-get install -y tomcat7
 
ENV CATALINA_HOME /usr/share/tomcat7/
ENV CATALINA_BASE /var/lib/tomcat7/
ENV PATH $CATALINA_HOME/bin:$PATH
#RUN mkdir -p "$CATALINA_HOME"
#WORKDIR $CATALINA_HOME

RUN apt-get install -y wget

COPY ./target/*.war /var/lib/tomcat7/webapps/EmployeeApplication.war 
EXPOSE 8080
 
CMD ["catalina.sh", "run"]

#inastalling git jdk and maven
#RUN apt-get update && apt-get install -y git maven openjdk-7-jdk
#Setting timezone to match time zone of sonar server
#RUN echo "Asia/Kolkata" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
#adding jenkins user
#RUN adduser jenkins
#RUN echo "jenkins:jenkins" | chpasswd
#Volume Mounting (Docker custom build env plugin copy reports by itself)
#VOLUME ["/var/lib/jenkins"]
#Exposing the port
#EXPOSE 8080
#Entry point or image starting point
#ENTRYPOINT ["",""]
#frgegfrerferfrfwerferferferferferferf
