require 'centrifuge/request'

module Centrifuge
  class Builder
    attr_accessor :method, :data, :client

    def initialize(method, data, client)
      @method, @data, @client = method, data, client
    end

    def process
      body = json(method, data)
      Centrifuge::Request.new(client.client, 'POST', client.url, nil, body, client.headers).send
    end

    private

    def json(method, params)
      MultiJson.dump(method: method, params: params)
    end
  end
end
