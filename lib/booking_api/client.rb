module BookingApi
  class Client

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    def get_hotel_availabillity(request_parameters: {})
      default_parameters = {
        room1: "A,A",
      }
      http_service.request_post("/json/getHotelAvailabilityV2", default_parameters.merge(request_parameters))
    end

    def hotel_description_photos(hotel_ids: [], request_parameters: {})
      raise ArgumentError if hotel_ids.empty?
      default_parameters = {
        hotel_ids: hotel_ids.join(",")
      }
      response = http_service.request_post("/json/bookings.getHotelDescriptionPhotos", default_parameters.merge(request_parameters))
      Images::ResponseList.new(response)
    end

    private

  end
end


__END__

params = {
  checkin: Time.now.strftime("%F"),
  checkout: (Time.now + (60 * 60 * 24 * 7 * 2)).strftime("%F"),
  hotel_ids: [303762]
}
response = BookingApi::Client.new.get_hotel_availabillity(request_parameters: params)

puts response.body
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
