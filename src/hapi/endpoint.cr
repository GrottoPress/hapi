module Hapi::Endpoint
  macro included
    def initialize(@client : ::Hapi::Client)
    end
  end
end
