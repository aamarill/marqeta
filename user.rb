class User < MarqetaAPI
  attr_reader :token

  def initialize
    @token = nil

    create_user
  end

  private
  def create_user
    endpoint = 'users'
    body = {}
    response = marqeta_post(endpoint, body)
    response_body = JSON.parse(response.body)
    @token = response_body['token']
  end
end
