#!/bin/bash

echo "build ..."
if [ "install_all" = $1 ] ; then
    mvn clean install -U
elif [ "deploy_all" = $1 ] ; then
    mvn clean deploy -U
elif [ "package_mock_server" = $1 ] ; then
    mvn clean package -U -pl apiworld-mock-server -am
elif [ "clean_all" = $1 ] ; then
    mvn clean
    rm -rf apiworld-bundle/src
    rm -rf apiworld-bundle-mock/src
fi
echo "build done."
