module BookingApi
  # functionality related to handling images.
  module Images
    class ResponseList
      attr_reader :response, :exception

      def initialize(response, exception: nil)
        @response   = response
        @exception  = exception
      end

      def entries
        @entries ||= parsed_entries_from_response.map {|entry| BookingApi::Images::Image.new(entry)}
      end

      def parsed_entries_from_response
        if response.body && (response.body.is_a?(Hash) || response.body.is_a?(Array))
          response.body
        else
          raise JSON::ParserError
        end
      end
    end
  end
end
