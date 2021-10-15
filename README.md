# SynackSubdomains
****updated to pull subdomains and full paths 


****full path of accepted analytics is now stored in fullpath.txt

****save the script in a different directory the first line delets all .txt files

A bash script to grab subdomains from Analytics

you will need jq to be installed

Please take care of out of scope domains.

get your auth bearer by copy pasting " sessionStorage.getItem('shared-session-com.synack.accessToken'); " in console

usage 
bash Synacksubs.sh <<token>>
  this will download the target name and subdomains from analytics
