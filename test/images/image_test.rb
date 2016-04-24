require 'test_helper'

describe BookingApi::Images::Image do
  let(:klass) { BookingApi::Images::Image }
  let(:sample_data) do
    {
      url_square60: "http://aff.bstatic.com/images/hotel/square60/333/33377034.jpg",
      photo_id: "33377034",
      descriptiontype_id: "10",
      url_original: "http://aff.bstatic.com/images/hotel/max500/333/33377034.jpg",
      hotel_id: "17675",
      url_max300: "http://aff.bstatic.com/images/hotel/max300/333/33377034.jpg"
    }
  end
  let(:object) { klass.new(sample_data) }
  describe "#initialize" do
    it "returns an image" do
      assert_equal klass, klass.new.class
    end
    it "accepts a hash of raw data" do
      assert_equal true, klass.new({}).raw_data.is_a?(Hash)
      assert_equal Hash.new, klass.new.raw_data
    end
  end

  describe "#raw_data" do
    it "returns the raw data by the API" do
      assert_equal sample_data.with_indifferent_access, object.raw_data.with_indifferent_access
    end
  end

  describe "#hotel_id" do
    it "returns the hotel_id" do
      assert_equal 17675, object.hotel_id
    end
  end

  describe "#photo_id" do
    it "returns the photo_id" do
      assert_equal 33377034, object.photo_id
    end
  end

  describe "#largest_file_url" do
    it "returns the url" do
      assert_equal "http://aff.bstatic.com/images/hotel/840x460/333/33377034.jpg", object.largest_file_url
    end
  end

  describe "#is_default_image?" do
    it "returns true if the api returns 10" do
      assert_equal true, object.is_default_image?
      object.raw_data[:descriptiontype_id] = "1"
      assert_equal false, object.is_default_image?
    end
  end
end
