# frozen_string_literal: true

require 'gameopedia'
require 'gameopedia/configuration'
require 'gameopedia/response'
require 'typhoeus'

module Gameopedia
  class Client # :nodoc:
    BASE_URI = 'https://api.gameopedia.com/consumer/api/data/europe/GB/retail2'

    def initialize(http_client: Typhoeus)
      @http_client = http_client
    end

    def get_full_dump(page:)
      get('/dump/full.json', params: { page: page })
    end

    private

    private_constant :BASE_URI

    attr_reader :http_client

    def get(endpoint, params:)
      gameopedia_response = http_client.get(BASE_URI + endpoint, params: { **authentication_params, **params })
      Response.new(code: gameopedia_response.code, body: gameopedia_response.body)
    end

    def authentication_params
      @authentication_params ||= {
        auth_logon: Gameopedia.configuration.auth_logon,
        auth_key: Gameopedia.configuration.auth_key
      }
    end
  end
end
