#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  printf "upgrading Ubuntu-18.04 packages \n"
  sudo apt-get -y update && sudo apt-get -y dist-upgrade
  sudo apt -y install python3 
  sudo apt -y install software-properties-common
  sudo add-apt-repository ppa:deadsnakes/ppa -y

  printf "switching to python3.8 -v \n"
  sudo apt-get install python3.8 -y
  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
  sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
  sudo update-alternatives --config python3 # mark 2
  sudo apt -y install python python3-pip
  yes | pip3 install --upgrade pip


  printf "installing .... \n"
  yes | pip3 install -r requirements.txt

  printf "fix apt_pkg package"
  cd /usr/lib/python3/dist-packages
  cp apt_pkg.cpython-35m-x86_64-linux-gnu.so apt_pkg.so
  cd 


  exit

else
  printf "only works under linux-gnu Ubuntu-18.04 \n"
fi

