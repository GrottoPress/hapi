module Hapi::Resource
  macro included
    include ::JSON::Serializable
  end
end
