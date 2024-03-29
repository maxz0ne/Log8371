FROM tomcat:8.0-jre8
MAINTAINER "M Rautenberg <rautenberg@uni-mainz.de>"

# Tomcat
# remove preinstalled webapps 
RUN rm -fr /usr/local/tomcat/webapps/ROOT
RUN rm -fr /usr/local/tomcat/webapps/host-manager
RUN rm -fr /usr/local/tomcat/webapps/manager
RUN rm -fr /usr/local/tomcat/webapps/docs
RUN rm -fr /usr/local/tomcat/webapps/examples

# copy and unzip the application war file
ADD target/weka_rs-0.5.0.war /usr/local/tomcat/webapps/ROOT.war
RUN unzip -d /usr/local/tomcat/webapps/ROOT /usr/local/tomcat/webapps/ROOT.war && rm -f /usr/local/tomcat/webapps/ROOT.war

# add openam certificat to tomcat's cert-store
RUN openssl s_client -showcerts -connect openam.in-silico.ch:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > /usr/local/tomcat/in-silicoch.crt
RUN keytool -keystore /etc/ssl/certs/java/cacerts -keypass changeit -storepass changeit -noprompt -importcert -alias openam.in-silico.ch -file /usr/local/tomcat/in-silicoch.crt

# Create a non-priviledged user to run Tomcat
RUN useradd -u 501 -m -g root tomcat && chown -R tomcat:root /usr/local/tomcat
# Set file permissions for that user.
RUN chown -R tomcat:root /usr/local/tomcat
# run as that user
USER 501

EXPOSE 8080

# Jprofiler
# Download jprofiler
RUN wget http://download-keycdn.ej-technologies.com/jprofiler/jprofiler_linux_10_1_5.tar.gz -P /tmp/

RUN mkdir ~/jprofiler

# Unzip the sources
RUN tar -xzf /tmp/jprofiler_linux_10_1_5.tar.gz -C ~/jprofiler
# Delete the tar archive
RUN rm /tmp/jprofiler_linux_10_1_5.tar.gz

ENV JPAGENT_PATH="-agentpath:/usr/local/jprofiler10/bin/linux-x64/libjprofilerti.so=nowait"
# Expose port so we can connect to it as a remote host from the JProfiler GUI
EXPOSE 8849



# Install expect to automatically answer script questions
USER root
RUN apt-get update
RUN apt-get install -y expect

# Start profiling agent
USER 501
COPY ./start_profiling.exp /home/tomcat
RUN mkdir -p /home/tomcat/jprofiler
RUN cp -a ~/jprofiler/. /home/tomcat/jprofiler/
