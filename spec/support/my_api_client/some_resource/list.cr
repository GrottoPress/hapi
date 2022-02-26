struct MyApiClient::SomeResource::List
  include Response

  struct Resource
    getter data : Array(SomeResource)?
  end
end
