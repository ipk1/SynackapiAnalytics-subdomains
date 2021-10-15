rm *.txt
curl 'https://platform.synack.com/api/targets/registered_summary'   -H 'Connection: keep-alive'   -H 'Authorization: Bearer '$1''   --compressed | jq -r 'to_entries[] | " \(.value | .id)"' | tee subid.txt
curl 'https://platform.synack.com/api/targets/registered_summary'   -H 'Connection: keep-alive'   -H 'Authorization: Bearer '$1''   -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36'   -H 'Accept: */*'   -H 'Sec-Fetch-Site: same-origin'   -H 'Sec-Fetch-Mode: cors'   -H 'Sec-Fetch-Dest: empty'   -H 'Referer: https://platform.synack.com/targets'   -H 'Accept-Language: en-US,en;q=0.9'   --compressed | jq -r 'to_entries[] | " \(.value | .organization_id)"' | tee org.txt
paste subid.txt org.txt | while read m k
do

#curl 'https://platform.synack.com/api/targets/'$m''   -H 'authority: platform.synack.com'   -H 'authorization: Bearer '$1''  --compressed | jq '.codename' >> subdomains.txt
#curl 'https://platform.synack.com/api/targets/'$m'/vulnerability_category_exploitable_locations'  -H 'Connection: keep-alive'  -H 'Authorization: Bearer '$1''   --compressed | jq -r '.[] | .ExploitableLocations[] | .value' | cut -d '/' -f 3 | grep -v -e ' ' -e '>' | sort -u >> subdomains.txt

curl 'https://platform.synack.com/api/targets/'$m''   -H 'authority: platform.synack.com'   -H 'authorization: Bearer '$1''  --compressed | jq '.codename' >> subdomains.txt 
curl 'https://platform.synack.com/api/targets/'$m''   -H 'authority: platform.synack.com'   -H 'authorization: Bearer '$1''  --compressed | jq '.codename' >> pathsonly.txt
curl 'https://platform.synack.com/api/listing_analytics/categories?listing_id='$m'&status=accepted' -H 'Connection: keep-alive'  -H 'Authorization: Bearer '$1''   --compressed |  jq -r '.value[] | .exploitable_locations[] | .value' | cut -d '/' -f 3 | grep -v -e ' ' -e '>' | sort -u >> subdomains.txt
curl 'https://platform.synack.com/api/listing_analytics/categories?listing_id='$m'&status=accepted' -H 'Connection: keep-alive'  -H 'Authorization: Bearer '$1''   --compressed |  jq -r '.value[] | .exploitable_locations[] | .value' |  cut -d '/' -f4- >> pathsonly.txt
done
