require "httparty"

class GraphAPI
  attr_accessor :token, :url

  # should include HTTParty mixin here
  # include HTTParty

  def initialize(token=false)
    @token = token
    @url = 'https://graph.facebook.com'
  end

  def get(path='')
    url = "#{self.url}/#{path}"
    response = HTTParty.get(url, :query => {:access_token => self.token})
    puts response.body, response.code

    # TODO: parse body as JSON
  end
end
