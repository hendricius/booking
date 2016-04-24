require "faraday"
require "faraday_middleware"
require "json"
require "active_support/core_ext/hash/indifferent_access"

require "booking_api/version"
require "booking_api/client"
require "booking_api/http_service"
require "booking_api/images"
require "booking_api/images/image"
require "booking_api/images/response_list"

module BookingApi

  class << self
    attr_accessor :username, :password
  end

  self.username = self.username || ENV["BOOKING_RUBY_USERNAME"]
  self.password = self.password || ENV["BOOKING_RUBY_PASSWORD"]
end
