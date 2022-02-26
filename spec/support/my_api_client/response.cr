module MyApiClient::Response
  macro included
    include Hapi::Resource

    getter message : String
    getter? success : Bool
  end
end
