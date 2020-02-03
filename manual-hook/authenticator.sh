#!/bin/bash

. /etc/ptisp.config
#ptisp.config
#PTISP_API_KEY="your-api-key"
#PTISP_EMAIL="your.email@example.com"



curl --user $PTISP_EMAIL:$PTISP_API_KEY -s -X POST "https://api.ptisp.pt/parking/$CERTBOT_DOMAIN/dns/add" \
     -H     "Content-Type: application/json" \
     --data '{"domain":"'"$CERTBOT_DOMAIN"'","type":"TXT","ttl":"14400","class":"IN","name":"_acme-challenge","txtdata":"'"$CERTBOT_VALIDATION"'"}' 


# Sleep to make sure the change has time to propagate over to DNS
sleep 15

