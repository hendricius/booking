require 'test_helper'

describe BookingApi::Images::Image do
  let(:klass) { BookingApi::Images::Image }
  describe "#initialize" do
    it "returns an image" do
      assert_equal klass, klass.new.class
    end
    it "accepts a hash of raw data" do
      assert_equal Hash, klass.new({}).raw_data.class
      assert_equal Hash.new, klass.new.raw_data
    end
  end
end
