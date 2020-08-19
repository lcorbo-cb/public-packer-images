#!/bin/bash

cd ubuntu/19.10/
ubuntu1910=$(curl -s https://app.vagrantup.com/api/v1/box/corbolj/ubuntu-19.10 | jq .)
ubuntu1910=$(echo $ubuntu1910 | jq '.current_version.version') && ubuntu1910=$(sed -e 's/^"//' -e 's/"$//' <<< $ubuntu1910)
ubuntu1910ver=$( echo $ubuntu1910 + 0.01 | bc | sed 's/^\./0./' )
/mnt/c/Program\ Files/Hashicorp/packer_1.6.1_windows_amd64/packer.exe build -var "version=$ubuntu1910ver" .

cd ../../ubuntu/20.04/
ubuntu2004=$(curl -s https://app.vagrantup.com/api/v1/box/corbolj/ubuntu-20.04 | jq .)
ubuntu2004=$(echo $ubuntu2004 | jq '.current_version.version') && ubuntu2004=$(sed -e 's/^"//' -e 's/"$//' <<< $ubuntu2004)
ubuntu2004ver=$( echo $ubuntu2004 + 0.01 | bc | sed 's/^\./0./' )
/mnt/c/Program\ Files/Hashicorp/packer_1.6.1_windows_amd64/packer.exe build -var "version=$ubuntu2004ver" .

cd ../../centos/7/
centos7=$(curl -s https://app.vagrantup.com/api/v1/box/corbolj/centos-7 | jq .)
centos7=$(echo $centos7 | jq '.current_version.version') && centos7=$(sed -e 's/^"//' -e 's/"$//' <<< $centos7)
centos7ver=$( echo $centos7 + 0.01 | bc | sed 's/^\./0./' )
/mnt/c/Program\ Files/Hashicorp/packer_1.6.1_windows_amd64/packer.exe build -var "version=$centos7ver" .

cd ../../centos/8/
centos8=$(curl -s https://app.vagrantup.com/api/v1/box/corbolj/centos-8 | jq .)
centos8=$(echo $centos8 | jq '.current_version.version') && centos8=$(sed -e 's/^"//' -e 's/"$//' <<< $centos8)
centos8ver=$( echo $centos8 + 0.01 | bc | sed 's/^\./0./' )
/mnt/c/Program\ Files/Hashicorp/packer_1.6.1_windows_amd64/packer.exe build -var "version=$centos8ver" .
