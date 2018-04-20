server=https://identity-pre.schibsted.com
client_id=$1
secret=$2
response=$(
    ### Request an OAuth token
    curl --silent -X POST -d "client_id=$client_id&client_secret=$secret&grant_type=client_credentials" $server/oauth/token
    ###
)
access_token=$(echo $response | sed -En 's/.*access_token":"([^"]+).*/\1/pg')

echo "OAuth access token: $access_token"

if [[ -z "$access_token" ]] ; then
    echo "Failed to get client credentials from OAuth server. Response was:"
    echo $response
    exit 1
fi

### Fetch API endpoints
curl --silent $server/api/2/endpoints\?oauth_token=$access_token | python -m json.tool
###
