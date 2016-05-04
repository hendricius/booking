# Booking

[![Build Status](https://travis-ci.org/hendricius/booking.svg?branch=master)](https://travis-ci.org/hendricius/booking)

This is a wrapper for the Booking.com API. Currently only `gethotelavailbilityV2` and `getHotelDescriptionTranslations` are supported.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'booking-ruby', require: ['booking_api']
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install booking-ruby

# Setup

Initialize the the gem by setting your username and password:

```
  BookingApi.username = 'your-username'
  BookingApi.password = 'your-password'
```

# Supported endpoints
## `get_hotel_availabillity`

```ruby
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

## `get_hotel_description_translations`
```ruby
params = { hotel_ids: [10003] }
response = BookingApi::Client.new.get_hotel_description_translations(request_parameters: params)

response.body # =>
[
  {
    "hotel_id"=>"10003",
    "descriptiontype_id"=>6,
    "description"=>
     "Das Asterisk Hotel bietet 3-Sterne-Unterkünfte in 2 renovierten Gebäuden aus dem 19. Jahrhundert im Zentrum von Amsterdam. Die Unterkunft ist 10 Minuten vom Rijksmuseum entfernt und verfügt über kostenloses WLAN in allen Bereichen.",
    "languagecode"=>"de"
  },
 {
    "languagecode"=>"en",
    "description"=>
     "Asterisk Hotel offers 3-star accommodation in 2 restored 19th century buildings in the centre of Amsterdam. It is situated 10 minutes from the Rijksmuseum and offers free WiFi in the entire property.",
    "hotel_id"=>"10003",
    "descriptiontype_id"=>6
  }
]
```




# FAQ
To get access to the API you have to signup as an affiliate for booking.com. They will then send you the API documentation with credentials to obtain data.

Check the official documentation here: https://distribution-xml.booking.com/affiliates/documentation/
