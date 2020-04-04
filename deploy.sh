#!/bin/sh

local_path=/PATH/_site
host=ftp.MYCLUSTER.hosting.ovh.net
user=USERNAME
pwd=PASSWORD

jekyll build

lftp ftp://$user:$pwd@$host -e "
  mirror --reverse $local_path /www \
         --scan-all-first \
         --verbose ;
  quit"
