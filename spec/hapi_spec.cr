require "./spec_helper"

describe Hapi do
  it "creates resource" do
    string = "Hello, World!"
    integer = 500000

    body = <<-JSON
      {
        "success": true,
        "message": "Resource created",
        "data": {
          "string_attribute": "#{string}",
          "integer_attribute": #{integer}
        }
      }
      JSON

    WebMock.stub(:post, "https://api.example.com/some-path/some-resource")
      .with(body: %({"string":"#{string}","integer":#{integer}}))
      .to_return(body: body)

    client = MyApiClient.new(token: "abcdef")

    client.some_resources.create(string: string, integer: integer) do |response|
      response.success?.should be_true
      response.data.should be_a(MyApiClient::SomeResource)

      response.data.try &.string_attribute.should eq(string)
      response.data.try &.integer_attribute.should eq(integer)
    end
  end

  it "lists resources" do
    body = <<-JSON
      {
        "success": true,
        "message": "Resources found",
        "data": [{
          "string_attribute": "Hello, World!",
          "integer_attribute": 500000
        }]
      }
      JSON

    WebMock.stub(:get, "https://api.example.com/some-path/some-resource")
      .with(query: {"count" => "10","page" => "3"})
      .to_return(body: body)

    client = MyApiClient.new(token: "abcdef")

    client.some_resources.list(count: "10", page: "3") do |response|
      response.success?.should be_true
      response.data.should be_a(Array(MyApiClient::SomeResource))
    end
  end

  it "fetches resource" do
    body = <<-JSON
      {
        "success": true,
        "message": "Resource found",
        "data": {
          "string_attribute": "Hello, World!",
          "integer_attribute": 500000
        }
      }
      JSON

    WebMock.stub(:get, "https://api.example.com/some-path/some-resource/123")
      .to_return(body: body)

    client = MyApiClient.new(token: "abcdef")

    client.some_resources.fetch(id: 123) do |response|
      response.success?.should be_true
      response.data.should be_a(MyApiClient::SomeResource)
    end
  end
end
