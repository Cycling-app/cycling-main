# Cycling App

Sample JSON body for POST /bikes
```javascript
{
  "bike":{
    "serial_number": "aaaaabbbbbccc123",
    "make": "mountain",
    "brand": "trek",
    "client_id": 2,
    "bought_on": "2016-08-01"
  }
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
