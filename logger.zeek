# logs the location of http and https requests/handshakes
# first column is longitude and second is latitude

function print_location(location: geo_location)
    {
    print location$latitude, location$longitude;
    }

event http_request(c: connection, method: string, 
original_URI: string, unescaped_URI: string, version: string)
    {
    print_location(lookup_location(c$id$resp_h));
    }

event ssl_established(c: connection)
    {
    print_location(lookup_location(c$id$resp_h));
    } 