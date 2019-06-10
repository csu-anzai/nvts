#!/bin/bash

echo '###########################################################';
echo '';
echo 'Downloading NVT feed';
echo '';
echo '###########################################################';
wget -q http://dl.greenbone.net/community-nvt-feed-current.tar.bz2

echo '###########################################################';
echo '';
echo 'Extracting NVT feed';
echo '';
echo '###########################################################';
tar -xjf community-nvt-feed-current.tar.bz2

echo '###########################################################';
echo '';
echo 'Deleting tarball';
echo '';
echo '###########################################################';
rm -rf community-nvt-feed-current.tar.bz2

echo '###########################################################';
echo '';
echo 'Adding updated NVTs to git, and pushing to repository';
echo '';
echo '###########################################################';
git add .
git commit -m "Update received from Greenbone Community feed";
git push -q
