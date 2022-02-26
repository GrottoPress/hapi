struct MyApiClient::SomeResource::List
  include Response

  getter data : Array(SomeResource)?
end
