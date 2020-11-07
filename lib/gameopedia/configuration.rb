# frozen_string_literal: true

module Gameopedia
  class MissingConfiguration < StandardError; end

  class Configuration # :nodoc:
    attr_writer :auth_logon, :auth_key

    def auth_logon
      @auth_logon || (raise MissingConfiguration, 'Auth logon must be set')
    end

    def auth_key
      @auth_key || (raise MissingConfiguration, 'Auth key must be set')
    end
  end
end
