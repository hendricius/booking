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
        JSON.parse(response.body)
      rescue JSON::ParserError
        []
      end
    end
  end
end
