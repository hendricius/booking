module BookingApi
  # functionality related to handling images.
  module Images
    class Image
      attr_reader :raw_data
      def initialize(raw_data = {})
        @raw_data = raw_data
      end
    end
  end
end
