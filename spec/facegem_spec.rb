require "facegem"
require "webmock/rspec"

include WebMock::API

describe GraphAPI do

  before do
    stub_request(:get, "https://graph.facebook.com//me?access_token=").
    to_return(:status => 200, :body => "", :headers => {})

  end

  it "instantiates correctly" do
    GraphAPI.new
  end

  it "I should be able to GET" do

    graph = GraphAPI.new(access_token="")
    graph.get('/me')
  end

  it "I should be able GET request specific fields" do
  end

  it "" do
  end
end
