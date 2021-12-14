#Cert:

 

##Import the certificate under cacerts file

./keytool -keystore /opt/Websphere/Appserver/java/jre/lib/security/cacerts -importcert -alias remoteserverCA -file /temp/remoteservercert.cer

 

 

##List the certificate under cacerts file.

./keytool -list -v -keystore /opt/Websphere/Appserver/java/jre/lib/security/cacerts
