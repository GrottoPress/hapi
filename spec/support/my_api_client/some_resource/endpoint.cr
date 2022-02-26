struct MyApiClient::SomeResource::Endpoint
  include Hapi::Endpoint

  def create(**params)
    yield create(**params)
  end

  def create(**params)
    response = @client.post(self.class.uri.path, body: params.to_json)
    Item.new(response)
  end

  def list(**params)
    yield list(**params)
  end

  def list(**params)
    response = @client.get(
      "#{self.class.uri.path}?#{URI::Params.encode(params)}"
    )

    List.new(response)
  end

  def fetch(id : Int)
    yield fetch(id)
  end

  def fetch(id : Int)
    response = @client.get("#{self.class.uri.path}/#{id}")
    Item.new(response)
  end

  def self.uri
    uri = MyApiClient.uri
    uri.path += "/some-resource"
    uri
  end
end
