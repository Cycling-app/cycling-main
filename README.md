# Cycling App

This API is for the maintenance of bikes, however is also a model for multiple types of exercise activities

The use of STRAVA or some other application's API is necessary for collecting the data needed to track the wear and tear on parts of bikes or any other piece of equipment you are trying to track.

If using STRAVA I highly recommend going to get the [Strava Gem](https://github.com/jaredholdcroft/strava-api-v3), there is very good documentation here and has a very easy to use format.

You will also need to go to Strava and sign up to be a Developer on their site to be able to obtain a Client secret and a Developer Token.

## Samples for JSON handling
Sample JSON body for POST /bikes
```javascript
{
  "bike":{
    "serial_number": "aaaaabbbbbccc123",
    "model": "mountain",
    "brand": "trek",
    "client_id": 2,
    "bought_on": "2016-08-01"
  }
}
```

Sample JSON body for GET /clients
```javascript
{
  "id": 1,
  "first_name": "mike"
  "last_name": "not mike"
  "email": "email@email.email"
  "password_digest": "blahblahblah"
  "tokens": "this is a token 1234"
  "created_at": "this is a date"
  "updated_at": "also a date"
}
```

Sample JSON body for GET /bikes
```javascript
 {
   "id": 1,
   "serial_number": "abcd1234",
   "model": "mountain bike",
   "brand": "trek",
   "client_id": 1,
   "bought_on": "2016-08-17",
   "created_at": "2016-08-27T19:02:59.929Z",
   "updated_at": "2016-08-27T19:02:59.929Z"
 }
```

Sample JSON body for POST /parts
```javascript
{
  "part_type": "brakes"
  "description": "disc"
  "serial_number": "1454342asdasav"
  "bike_id": 3
  "mounted_on": "date"
  "purchased_on": "other date"
}
```

Sample JSON body for GET /parts
```javascript
{
  "id": 1,
  "part_type": "Brake",
  "description": "disc",
  "serial_number": "1234",
  "bike_id": 1,
  "mounted_on": "2016-08-18",
  "purchased_on": "2016-08-14",
  "distance_in_km": 0,
  "expected_lifetime_in_km": 750,
  "is_expired": false,
  "created_at": "2016-08-27T19:03:37.800Z",
  "updated_at": "2016-08-27T19:03:37.800Z"
}
```
## Error Handling
Sample JSON body for error messages

```javascript
{
  "errors": {
    "fields": {
      "bike_id": [
        "can't be blank"
      ]
    },
    "full_messages": [
      "Bike can't be blank"
    ]
  }
}
```
