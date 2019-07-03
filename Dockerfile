FROM tomcat:8
# Take the war and copy to webapps of tomcat
# ANooruddh - This is what i added before stash
COPY /opt/jenkins/workspace/docker-build/target/*.war /usr/local/tomcat/webapps/
