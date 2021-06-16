#!/bin/bash

echo "build ..."
if [ "install_all" = $1 ] ; then
    mvn clean compile -U -pl apiworld-bundle -am -Dbdgc.skip=false
    # mvn clean compile
    mvn clean install -Dbdgc.skip=true
elif [ "deploy_all" = $1 ] ; then
    mvn clean compile -U -pl apiworld-bundle -am -Dbdgc.skip=false
    mvn -U clean install org.apache.maven.plugins:maven-deploy-plugin:2.8:deploy -DskipTests -Dbdgc.skip=true
elif [ "package_mock_server" = $1 ] ; then
    # mvn clean compile -pl apiworld-bundle-mock -am -Dbdmgc.skip=false
    mvn clean package -pl apiworld-mock-server -am -Dbdmgc.skip=false
elif [ "clean_all" = $1 ] ; then
    mvn clean
    rm -rf apiworld-bundle/src
    rm -rf apiworld-bundle-mock/src
fi
echo "build done."
