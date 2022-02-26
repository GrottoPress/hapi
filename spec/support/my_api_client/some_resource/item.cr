struct MyApiClient::SomeResource::Item
  include Response

  struct Resource
    getter data : SomeResource?
  end
end
