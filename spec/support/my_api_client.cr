class MyApiClient
  include Hapi::Client

  def initialize(token)
    set_headers(token)
  end

  def some_resources
    @some_resource ||= SomeResource::Endpoint.new(self)
  end

  def self.uri : URI
    URI.parse("https://api.example.com/some-path")
  end

  private def set_headers(token)
    http_client.before_request do |request|
      set_content_type(request.headers)
      set_user_agent(request.headers)
      set_authorization(request.headers, token)
    end
  end

  private def set_content_type(headers)
    headers["Content-Type"] = "application/json; charset=UTF-8"
  end

  private def set_user_agent(headers)
    headers["User-Agent"] = "Hapi/#{Hapi::VERSION} \
      (+https://github.com/GrottoPress/hapi)"
  end

  private def set_authorization(headers, token)
    headers["Authorization"] = "Bearer #{token}"
  end
end
