# SynackSubdomains

**updated to pull subdomains and only paths**


**full path of accepted analytics is now stored in pathsonly** can be useful in content discovery

**save the script in a different directory the first line delets all .txt files**

A bash script to grab subdomains from Analytics

you will need jq to be installed

Please take care of out of scope domains.

get your auth bearer by copy pasting " sessionStorage.getItem('shared-session-com.synack.accessToken'); " in console

**Usage**
bash Synacksubs.sh <<yoursynacktoken>>
 
  
  this will download the target name and subdomains from analytics
