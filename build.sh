#!/bin/bash

echo "build ..."
if [ "install_all" = $1 ]; then
  mvn compile -pl apiworld-api -am -Dapigc.skip=false
  mvn compile -pl apiworld-bundle -am -Dbdgc.skip=false
  mvn compile -pl apiworld-client -am -Dclientgc.skip=false
  mvn clean install -U
elif [ "deploy_all" = $1 ]; then
  mvn compile -pl apiworld-api -am -Dapigc.skip=false
  mvn compile -pl apiworld-bundle -am -Dbdgc.skip=false
  mvn compile -pl apiworld-client -am -Dclientgc.skip=false
  mvn clean deploy -U
elif [ "package_mock_server" = $1 ]; then
  mvn clean package -U -pl apiworld-mock-server -am -Dbdmgc.skip=false
elif [ "clean_all" = $1 ]; then
  mvn clean
  rm -rf *-api/src
  rm -rf *-client/src
  rm -rf *-bundle/src
  rm -rf *-bundle-mock/src
fi
echo "build done."
