require 'net/http'
require 'json'
require_relative 'secrets'

class MarqetaAPI
  include Secrets

  def marqeta_post(endpoint, body)
    uri = URI.parse("#{Shared_environment_base_URL}#{endpoint}")
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(Application_Token, Master_Access_Token)
    request.content_type = "application/json"
    request.body = JSON.dump(body)

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    response
  end
end

require_relative 'card_product'
require_relative 'funding_source'
require_relative 'user'
require_relative 'card'
require_relative 'gpaorder'
require_relative 'authorization'
