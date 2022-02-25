require "../spec_helper"

describe Hapi::Resource do
  it "creates resource from JSON" do
    string = "Hello, World!"
    integer = 500000

    raw = {
      string_attribute: string,
      integer_attribute: integer,
      unknown_attribute: "unknown"
    }

    resource = MyApiClient::SomeResource.from_json(raw.to_json)

    resource.string_attribute.should eq(string)
    resource.integer_attribute.should eq(integer)
    resource["unknown_attribute"]?.should eq("unknown")
  end

  it "merges in other attributes" do
    string = "Hello, World!"
    integer = 500000

    raw = {
      string_attribute: string,
      integer_attribute: integer
    }

    resource = MyApiClient::SomeResource.from_json(raw.to_json)
    resource = resource.merge(other_attribute: "other")

    resource.string_attribute.should eq(string)
    resource.integer_attribute.should eq(integer)
    resource["other_attribute"]?.should eq("other")
  end

  it "merges in another serializable object" do
    raw = {
      string_attribute: "string",
      integer_attribute: 1
    }

    raw_2 = {
      string_attribute: "string_2",
      integer_attribute: 2,
      other_attribute: "other"
    }

    resource = MyApiClient::SomeResource.from_json(raw.to_json)
    resource_2 = MyApiClient::SomeResource.from_json(raw_2.to_json)
    merged = resource.merge(resource_2)

    merged.string_attribute.should eq("string_2")
    merged.integer_attribute.should eq(2)
    merged["other_attribute"]?.should eq("other")
  end
end
