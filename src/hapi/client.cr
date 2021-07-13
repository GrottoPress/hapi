module Hapi::Client
  macro included
    forward_missing_to http_client

    def self.uri : ::URI
    end

    private def http_client : ::HTTP::Client
      @http_client ||= ::HTTP::Client.new(self.class.uri)
    end
  end
end
