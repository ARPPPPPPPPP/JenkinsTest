FROM arp-maven
MAINTAINER ARP ""

#打包示例项目并拷贝到tomcat webapps目录
RUN mkdir /var/tmp/webapp
ADD ./ /var/tmp/webapp
RUN cd /var/tmp/webapp && mvn package -Dmaven.test.skip=true && cp /var/tmp/webapp/target/ARP.war /var/tmp/tomcat/apache-tomcat-8.0.37/webapps

EXPOSE 8080
#启动tomcat服务器
CMD ["./var/tmp/tomcat/apache-tomcat-8.0.37/bin/catalina.sh","run"]
