# Cycling App

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
