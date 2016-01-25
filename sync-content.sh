#!/bin/bash

##################################################
# Created by: Andrew Dahms
# Created on: 25 Jan, 2016
#
# Updates the content of a single guide on the
# specified l10n branch.
#
##################################################

echo '=================================================='
echo 'Content Synchronizer                              '
echo '=================================================='
echo ''

function printHelp() {

  echo 'Usage: sh sync-content.sh <guide name> <target branch>'
  echo ''
  echo 'E.g. sh sync-content.sh doc-General_Config 4.0-l10n'
  echo ''

  exit 1

}

if [ "$1" == "" ]; then

  echo 'No guide name supplied - exiting...'
  echo ''

  printHelp

fi

if [ "$2" == "" ]; then

  echo 'No target branch name supplied - exiting...'
  echo ''

  printHelp

fi

FROM_BRANCH=`git rev-parse --abbrev-ref HEAD`
TO_BRANCH=$2

echo 'Checking branches...'
echo ''

sleep 1.0

git checkout $TO_BRANCH
git checkout $FROM_BRANCH

echo ''
echo 'Creating patch...'
echo ''

ANCESTOR=`git merge-base $FROM_BRANCH $TO_BRANCH`
TIP=`git log -n 2 --pretty=oneline --follow $2 | awk '{print $1}'`

git diff-index $ANCESTOR --binary --follow $1 > mypatch.patch

sleep 1.0

echo 'Applying patch to target branch...'
echo ''

git checkout $TO_BRANCH

git apply mypatch.patch

git add $1

echo ''
echo 'Commiting changes...'
echo ''

sleep 1.0

git commit

echo ''

git checkout $FROM_BRANCH

echo ''
