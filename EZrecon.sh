#!/bin/bash

line="---------------------------------------------------"

echo enter your target Domain:
read Domain
echo $line
echo enter file name:
read name
echo $line
echo 'SUBDOMAIN ENUM "assetfinder"'
echo $line
assetfinder -subs-only $Domain | tee $name
echo $line
echo 'FINDING ALIVE SUBDOMAINS "httpx"'
echo $line
cat $name | httpx | tee alive.$name
echo $line
echo 'FINDING VULNERABILITIES "nuclei"'
echo $line
nuclei -l alive.$name nuclei-templates/