#!/bin/bash

echo '###########################################################';
echo '';
echo 'Downloading NVT feed';
echo '';
echo '###########################################################';
DOWNLOAD_COMMAND="wget -q http://dl.greenbone.net/community-nvt-feed-current.tar.bz2";
echo $DOWNLOAD_COMMAND;
$DOWNLOAD_COMMAND;

echo '###########################################################';
echo '';
echo 'Extracting NVT feed';
echo '';
echo '###########################################################';
EXTRACT_COMMAND="tar -xjf community-nvt-feed-current.tar.bz2";
echo $EXTRACT_COMMAND;
$EXTRACT_COMMAND

echo '###########################################################';
echo '';
echo 'Deleting tarball';
echo '';
echo '###########################################################';
DELETE_COMMAND="rm -rf community-nvt-feed-current.tar.bz2"
echo $DELETE_COMMAND;
$DELETE_COMMAND

echo '###########################################################';
echo '';
echo 'Adding updated NVTs to git, and pushing to repository';
echo '';
echo '###########################################################';
GIT_ADD_COMMAND="git add .";
GIT_COMMIT_COMMAND='git commit -m "Update received from Greenbone Community feed"';
GIT_PUSH_COMMAND="git push -q";
echo $GIT_ADD_COMMAND;
echo $GIT_COMMIT_COMMAND;
echo $GIT_PUSH_COMMAND;
git add .
git commit -m "Update received from Greenbone Community feed";
git push -q
