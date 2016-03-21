module Booking
  class Client

    def initialize
      @http_service = HttpService.new
    end

    def http_service
      @http_service
    end

    def get_hotel_availabillity(opts: {})
      http_service.request_post("/json/getHotelAvailabilityV2", opts)
    end

  end
end
