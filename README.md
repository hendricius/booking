# Booking

This is a wrapper for the Booking.com API. Currently only the `gethotelavailbilityV2` is supported.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'booking-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install booking-ruby

## Usage

Initialize the the gem by setting your username and password:

```
  BookingApi.username = 'your-username'
  BookingApi.password = 'your-password'
```

Right now only one endpoint is supported.

```
params = {
  checkin: Time.now.strftime("%F"),
  checkout: (Time.now + (60 * 60 * 24 * 7 * 2)).strftime("%F"),
  hotel_ids: [303762]
}
response = BookingApi::Client.new.get_hotel_availabillity(request_parameters: params)

# the parsed response is in the body
=> response.body

{
  "checkout": "2016-04-04",
  "hotels": [
    {
      "room_min_price": {
        "price": "750.00"
      },
      "hotel_id": "303762",
      "hotel_currency_code": "EUR"
    }
  ],
  "checkin": "2016-03-21",
  "guest_groups": [
    {
      "guests": 2,
      "children": [

      ]
    }
  ],
  "hotel_ids": [
    "303762"
  ]
}

```

## FAQ
To get access to the API you have to signup as an affiliate for booking.com. They will then send you the API documentation with credentials to obtain data.
