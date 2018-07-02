class Gpaorder < MarqetaAPI
  attr_reader :user_token, :amount, :currency, :funding_source_token, :response, :token

  def initialize(user_token, amount, currency, funding_source_token)
    @user_token = user_token
    @amount = amount
    @currency = currency
    @funding_source_token = funding_source_token
    @response = nil
    @token = nil

    create_gpaorder
  end

  private
  def create_gpaorder
    endpoint = 'gpaorders'
    body = {
      "user_token": "#{@user_token}",
      "amount": "#{@amount}",
      "currency_code": "#{@currency}",
      "funding_source_token": "#{@funding_source_token}"
    }

    @response = marqeta_post(endpoint, body)
    response_body = JSON.parse(@response.body)
    @token = response_body['token']
  end
end
