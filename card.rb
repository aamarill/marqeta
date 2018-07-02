class Card < MarqetaAPI
  attr_reader :token, :user_token, :card_product_token

  def initialize(user_token, card_product_token)
    @user_token = user_token
    @card_product_token = card_product_token
    @token = nil

    create_card
  end

  private
  def create_card
    endpoint = 'cards?show_cvv_number=true&show_pan=true'
    body = {
      "user_token": "#{@user_token}",
      "card_product_token": "#{@card_product_token}"
    }
    response = marqeta_post(endpoint, body)
    response_body = JSON.parse(response.body)
    @token = response_body['token']
  end
end
