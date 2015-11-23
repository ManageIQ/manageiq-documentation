#!/bin/bash

# ##################################################
# Created on: Tue, 17 Feb 2015
# Created by: Andrew Dahms
# 
# Checks each directory in the repo and cleans all
# temporary Publican files, if any.
# ##################################################

echo 
echo "Cleaning temporary publican files..."
echo 

sleep 0.5

for dir in `ls */ -d`
do

  if [ -d "${dir}/build"  ]
  then
      echo "Cleaning " $dir
      cd $dir && ccutil clean && cd ..
  else
      echo "No build directory in" $dir
      sleep 0.1
  fi

done

echo
echo "All clean!"
echo 
