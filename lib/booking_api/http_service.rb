module BookingApi
  class HttpService
    def initialize
      @auth_username = BookingApi.username
      @auth_password = BookingApi.password
    end

    def connection
      @connection ||= begin
        Faraday.new(:url => 'https://distribution-xml.booking.com') do |faraday|
          faraday.basic_auth @auth_username, @auth_password
          faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
          faraday.response :json, :content_type => /\bjson$/
        end
      end
    end

    def request_post(url, data)
      connection.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.body = data.to_json
      end
    end

  end
end
