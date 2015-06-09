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

  if [ -d "${dir}/tmp"  ]
  then
      echo "Cleaning " $dir
      cd $dir && publican clean && cd ..
  else
      echo "No tmp directory in" $dir
      sleep 0.1
  fi

done

echo
echo "All clean!"
echo 
