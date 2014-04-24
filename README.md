# Using the SPiD API with cURL

This repo contains working examples for using the SPiD API straight
from the command line with cURL.

### [getting-started.sh](getting-started.sh)

This minimal example fetches the `/endpoints` endpoint, which returns
a description of all available endpoints.

```sh
./getting-started.sh <client-id> <secret>
```

Replace pointy bracketed items with your credentials.

This will print the JSON-decoded response from the server, which shows all
available endpoints along with details on how to interact with them.
