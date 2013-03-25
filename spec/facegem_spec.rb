require "facegem"

describe GraphAPI do
  it "instantiates correctly" do
    GraphAPI.new
  end

  it "I should be able to GET" do
    # need to mock httparty.get... somehow

    graph = GraphAPI.new(access_token="")
    graph.get('/me')
  end

  it "I should be able GET request specific fields" do
  end

  it "" do
  end
end
