# Maven:

## Version update:

mvn versions:set -DnewVersion=2.50.1-SNAPSHOT -DprocessAllModules
 

mvn versions:set -DgenerateBackupPoms=false

 

## Maven Release Plugin:

Java-docs issue:

-Darguments="-Dmaven.javadoc.skip=true"

 

mvn versions:display-dependency-updates (mvn org.codehaus.mojo:versions-maven-plugin:2.16.0:display-dependency-updates -DallowMajorUpdates=false)

mvn versions:display-plugin-updates

mvn versions:display-property-updates

mvn versions:use-latest-versions

mvn versions:dependency-updates-report

mvn versions:plugin-updates-report

mvn versions:property-updates-report

 

## Nexus manual deploy 

mvn deploy:deploy-file -Dfile=./app.war -DrepositoryId=xxx-releases  -DgroupId=com.xxx.x -DartifactId=xxx -Dversion=6.2.6 -Dpackaging=war -Durl=<url> -e -X
 
## Run mvn plugins without being in pom.xml
mvn clean verify org.jacoco:jacoco-maven-plugin:0.8.8:report

mvn -Dmodernizer.javaVersion=17 clean compile test-compile org.gaul:modernizer-maven-plugin:2.6.0:modernizer
