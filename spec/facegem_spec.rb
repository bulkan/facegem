require "facegem"
require "webmock/rspec"

describe GraphAPI do
  before do
    @graph = GraphAPI.new
  end

  it "must have the base url set to the Graph API endpoint" do
    GraphAPI.base_uri.should == 'https://graph.facebook.com'
  end

  it "I should be able to GET" do
    stub = stub_request(:get, /.*graph.facebook.com.*/).
      with(:query => {"access_token" => ""}).
      to_return(:status => 400,
                :body => File.new("spec/data/no_access_token.json"),
                :headers => {"content-type"=> "application/json; charset=UTF-8"})

    response = @graph.get()

    stub.should have_requested(:get, "https://graph.facebook.com").
      with(:query => {:access_token => ""})
  end

  it "I should be able GET request specific fields" do
      stub = stub_request(:get, /.*graph.facebook.com.*/).
        with(:query => {"access_token"=> "", "fields" => "first_name"}).
        to_return(:status => 200,
                :body => File.new("spec/data/bulkan_first_name.json"),
                :headers => {"content-type"=> "application/json; charset=UTF-8"})

    data = @graph.get("/bulkan", :query=>{:fields => "first_name"})

    stub.with(:query => hash_including({:fields => "first_name"})).should have_been_made
    data.fetch("first_name").should == "Bulkan"
  end

  it "Post request" do
    stub = stub_request(:post, /.*graph.facebook.com.*/).
      with(:query => {"access_token" => ""}).
      to_return(:status => 200,
                :headers => {"content-type"=> "application/json; charset=UTF-8"})

    @graph.post()
  end

end
