struct MyApiClient::SomeResource
  include Hapi::Resource

  getter string_attribute : String
  getter integer_attribute : Int32
end
