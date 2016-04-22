require 'test_helper'

describe BookingApi::Client do
  let(:client) { BookingApi::Client.new }
  describe "#http_service" do
    it "returns a http service" do
      assert_equal BookingApi::HttpService, BookingApi::Client.new.http_service.class
    end
  end

  describe "#hotel_description_photos" do
    let(:sample_response) do
      [
        {
          url_square60: "http://aff.bstatic.com/images/hotel/square60/333/33377034.jpg",
          photo_id: "33377034",
          descriptiontype_id: "10",
          url_original: "http://aff.bstatic.com/images/hotel/max500/333/33377034.jpg",
          hotel_id: "17675",
          url_max300: "http://aff.bstatic.com/images/hotel/max300/333/33377034.jpg"
        },
        {
          url_max300: "http://aff.bstatic.com/images/hotel/max300/948/9485096.jpg",
          url_original: "http://aff.bstatic.com/images/hotel/max500/948/9485096.jpg",
          hotel_id: "17675",
          descriptiontype_id: "1",
          photo_id: "9485096",
          url_square60: "http://aff.bstatic.com/images/hotel/square60/948/9485096.jpg"
        }
      ]
    end

    before(:each) do
      stub_request(:any, /.*booking.com.*/).
      to_return(:status => 200, :body => sample_response.to_json, :headers => {})
    end

    it "has a method" do
      assert_equal true, client.respond_to?(:hotel_description_photos)
    end

    it "requires an array of hotel ids" do
      assert_raises ArgumentError do
        client.hotel_description_photos
      end
      client.hotel_description_photos(hotel_ids: [1,2])
    end

    it "returns a response list" do
      assert_equal BookingApi::Images::ResponseList, client.hotel_description_photos(hotel_ids: [1,2]).class
    end

    it "returns an array of entries" do
      entries = client.hotel_description_photos(hotel_ids: [1,2]).entries
      assert_equal BookingApi::Images::Image, entries.first.class
    end
  end
end
