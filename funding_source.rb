class FundingSource < MarqetaAPI
    attr_reader :name, :token

    def initialize(name)
      @name  = name
      @token = nil

      create_funding_source
    end

  private
  def create_funding_source
    endpoint = 'fundingsources/program'
    body = {
      "name" => "#{@name}"
    }

    response = marqeta_post(endpoint, body)
    response_body = JSON.parse(response.body)
    @token = response_body['token']
  end
end
