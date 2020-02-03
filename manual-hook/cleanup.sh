#!/bin/bash

. /etc/ptisp.config
#ptisp.config
#PTISP_API_KEY="your-api-key"
#PTISP_EMAIL="your.email@example.com"

# Remove the challenge TXT record from the zone
LINE=$(curl --user $PTISP_EMAIL:$PTISP_API_KEY -s -X GET "https://api.ptisp.pt/parking/$CERTBOT_DOMAIN/dns/list" | jq -c '.records[]' | while read i; do echo $i; done | grep _acme-challenge | jq '.line' )

curl  --user $PTISP_EMAIL:$PTISP_API_KEY -s -X POST "https://api.ptisp.pt/parking/$CERTBOT_DOMAIN/dns/$LINE/delete"
