require 'test_helper'

describe BookingApi::Client do
  describe "#http_service" do
    it "returns a http service" do
      assert_equal BookingApi::HttpService, BookingApi::Client.new.http_service.class
    end
  end
end
