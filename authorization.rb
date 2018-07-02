class Authorization < MarqetaAPI
  attr_reader :amount, :merchant_id, :card_token, :response, :token

  def initialize(amount, merchant_id, card_token)
    @amount = amount
    @merchant_id = merchant_id
    @card_token = card_token
    @response = nil
    @token = nil

    create_gpaorder
  end

  private
  def create_gpaorder
    endpoint = 'simulate/authorization'
    body = {
      "amount": "#{@amount}",
      "mid": "#{@merchant_id}",
      "card_token": "#{@card_token}",
       }

    @response = marqeta_post(endpoint, body)
    response_body = JSON.parse(@response.body)
    @token = response_body['token']
  end
end
