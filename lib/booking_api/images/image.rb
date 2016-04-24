module BookingApi
  # functionality related to handling images.
  module Images
    class Image
      attr_reader :raw_data

      def initialize(raw_data = {})
        @raw_data = raw_data.with_indifferent_access
      end

      def hotel_id
        @raw_data[:hotel_id].to_i
      end

      def photo_id
        @raw_data[:photo_id].to_i
      end

      def largest_file_url
        @raw_data[:url_original].gsub("max500", "840x460")
      end

      def is_default_image?
        @raw_data[:descriptiontype_id].to_i == 10
      end
    end
  end
end
