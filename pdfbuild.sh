#!/bin/bash

# ##################################################
# Created on: Mon, 23 Nov 2015
# Created by: Andrew Dahms
# 
# Creates a PDF version of the guides in the core
# documentation suite, and compiles them into a
# TAR file.
# ##################################################

echo ========================================
echo Appliance Docs Compiler
echo ========================================

echo 
echo "Creating temporary directory..."
echo 

TMPDIR=cfme-`date +"%Y-%m-%d"`

mkdir -p ${TMPDIR}

sleep 0.5

# Use ccutil to build PDF files for each of the core guides
for book in doc-Defining_Policies_and_Profiles doc-General_Configuration doc-Managing_Infrastructure_and_Inventory doc-Managing_Providers doc-Methods_Available_for_Automation doc-Monitoring_Alerts_and_Reporting doc-Provisioning_Virtual_Machines_and_Hosts doc-Scripting_Actions_in_CloudForms
do

 echo "Generating PDF for" ${book}...
 echo

 cd ${book}

 ccutil compile --format pdf --lang en-US > /dev/null 2>&1

 mv build/tmp/en-US/pdf/* ../${TMPDIR}

 ccutil clean > /dev/null 2>&1

 cd ..

done

# Rename PDF files to use the naming scheme specified for the appliance
echo "Renaming PDF files..."
echo

sleep 0.5

mv ${TMPDIR}/*Defining_Policies_and_Profiles-en-US.pdf ${TMPDIR}/defining_policies_profiles.pdf
mv ${TMPDIR}/*General_Configuration-en-US.pdf ${TMPDIR}/general_configuration.pdf
mv ${TMPDIR}/*Managing_Infrastructure_and_Inventory-en-US.pdf ${TMPDIR}/infrastructure_inventory.pdf
mv ${TMPDIR}/*Managing_Providers-en-US.pdf ${TMPDIR}/providers.pdf
mv ${TMPDIR}/*Methods_Available_for_Automation-en-US.pdf ${TMPDIR}/methods_for_automation.pdf
mv ${TMPDIR}/*Monitoring_Alerts_and_Reporting-en-US.pdf ${TMPDIR}/monitoring_alerts_reporting.pdf
mv ${TMPDIR}/*Provisioning_Virtual_Machines_and_Hosts-en-US.pdf ${TMPDIR}/virtual_machines_hosts.pdf
mv ${TMPDIR}/*Scripting_Actions_in_CloudForms-en-US.pdf ${TMPDIR}/scripting_actions.pdf

# Print md5sums

echo "Printing md5sums..."
echo

sleep 0.5

md5sum ${TMPDIR}/*

# Archive PDF files
echo
echo "Archiving PDF files..."
echo

sleep 0.5

tar cvf ${TMPDIR}.tar ${TMPDIR}/*

echo
echo "Successfully created archive!"
echo

echo "Cleaning up temporary directory..."
echo

sleep 0.5

rm -rf ${TMPDIR} 
