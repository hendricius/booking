require "faraday"
require "faraday_middleware"
require "json"
require "booking/version"
require "booking/client"
require "booking/http_service"

module Booking

  class << self
    attr_accessor :username, :password
  end

  self.username = self.username || ENV["BOOKING_RUBY_USERNAME"]
  self.password = self.password || ENV["BOOKING_RUBY_PASSWORD"]
end
