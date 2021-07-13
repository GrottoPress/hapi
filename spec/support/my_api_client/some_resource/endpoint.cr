struct MyApiClient::SomeResource::Endpoint
  include Hapi::Endpoint

  def create(**params)
    yield create(**params)
  end

  def create(**params)
    @client.post(self.class.uri.path, body: params.to_json) do |response|
      # raise Error.from_json(response.body_io) unless response.status.success?
      Item.from_json(response.body_io)
    end
  end

  def list(**params)
    yield list(**params)
  end

  def list(**params)
    @client.get(
      "#{self.class.uri.path}?#{URI::Params.encode(params)}"
    ) do |response|
      # raise Error.from_json(response.body_io) unless response.status.success?
      List.from_json(response.body_io)
    end
  end

  def fetch(id : Int)
    yield fetch(id)
  end

  def fetch(id : Int)
    @client.get("#{self.class.uri.path}/#{id}") do |response|
      # raise Error.from_json(response.body_io) unless response.status.success?
      Item.from_json(response.body_io)
    end
  end

  def self.uri
    uri = MyApiClient.uri
    uri.path += "/some-resource"
    uri
  end
end
