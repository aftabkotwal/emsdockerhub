#Base Image
FROM ubuntu:16.04

#Adding discription to the images
LABEL Description="This image is used for github->circleci->dockerhub->tutum->aws" Version="1.0"

# File Author / Maintainer
MAINTAINER pushpendra

RUN apt-get update 
RUN apt-get install -y openjdk-8-jdk
RUN sudo apt-get install -y tomcat7
 
ENV CATALINA_HOME /usr/share/tomcat7/
ENV CATALINA_BASE /var/lib/tomcat7/
ENV PATH $CATALINA_HOME/bin:$PATH


#RUN apt-get install -y wget

COPY ./target/*.war /var/lib/tomcat7/webapps/EmployeeApplication.war 
EXPOSE 8080
 
CMD ["catalina.sh", "run"]


