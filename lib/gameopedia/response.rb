# frozen_string_literal: true

module Gameopedia
  class Response # :nodoc:
    def initialize(code:, body:)
      @code = code
      @body = body
    end

    attr_reader :code, :body
  end
end
