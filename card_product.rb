class CardProduct < MarqetaAPI
  attr_reader :name, :token

  def initialize(name)
    @name  = name
    @token = nil

    create_card_product
  end

  private
  def create_card_product
    endpoint = 'cardproducts'
    body = {
      "start_date" => "#{Time.now.strftime('%Y-%m-%d')}",
      "name"       => "#{@name}",
      "config"     => {
        "fulfillment" => {
          "payment_instrument" => "VIRTUAL_PAN"
        },
        "poi" => {
          "ecommerce" => true
        },
        "card_life_cycle" => {
          "activate_upon_issue" => true
        }
      }
    }
    response = marqeta_post(endpoint, body)
    response_body = JSON.parse(response.body)
    @token = response_body['token']
  end
end
