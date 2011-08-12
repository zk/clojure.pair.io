#!/bin/bash

# JDK
sudo add-apt-repository "deb http://archive.canonical.com/ natty partner"
sudo apt-get update
sudo apt-get install sun-java6-jdk

# Leiningen

sudo rm -f /usr/bin/lein

sudo wget https://github.com/technomancy/leiningen/raw/stable/bin/lein
sudo chmod a+x ./lein
sudo mv ./lein /usr/bin/

# MongoDB

## Clean
sudo rm -rf /usr/local/mongodb-1.8.2
sudo rm -f /usr/local/bin/mongo*
sudo rm -f /usr/local/bin/bsondump

sudo wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-1.8.2.tgz
sudo tar -xvf ./mongodb-linux-x86_64-1.8.2.tgz
sudo mv ./mongodb-linux-x86_64-1.8.2 /usr/local/mongodb-1.8.2
sudo cp ~/clojure.pair.io/mongod-local /usr/local/bin/
sudo chown root:root /usr/local/bin/mongod-local
sudo chmod a+x /usr/local/bin/mongod-local
sudo ln -s /usr/local/mongodb-1.8.2/bin/* /usr/local/bin/

sudo rm -rf ./mongodb-linux-x86_64-1.8.2.tgz

# Instance-User Hook

sudo rm -f /etc/pair.io/hooks/instance-user

sudo mkdir -p /etc/pair.io/hooks/
sudo cp ~/clojure.pair.io/instance-user /etc/pair.io/hooks/
sudo chmod u+x /etc/pair.io/hooks/instance-user
