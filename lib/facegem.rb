require "httparty"
require "json"

class GraphAPI
  # should include HTTParty mixin here
  include HTTParty

  attr_accessor :token

  base_uri "https://graph.facebook.com"

  def initialize(token="")
    @token = token
  end

  def get(path='', options={})

    if options.has_key? :query
      options[:query].update({:access_token=>@token})
    else
      options[:query] = {:access_token=>@token}
    end

    response = self.class.get(path, options)

    content_type = response.headers.fetch "content-type"

    if content_type.index("json")
      JSON.load response.body
    end
  end

  def post(path='', options={})

    if options.has_key? :query
      options[:query].update({:access_token=>@token})
    else
      options[:query] = {:access_token=>@token}
    end

    response = self.class.post(path, options)

    content_type = response.headers.fetch "content-type"

    if content_type.index("json") and response.body
      JSON.load response.body
    end
  end
end
