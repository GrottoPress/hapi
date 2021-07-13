require "spec"
require "webmock"
require "../src/hapi"
require "./support/**"

Spec.before_each do
  WebMock.reset
end
