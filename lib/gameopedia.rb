# frozen_string_literal: true

require 'gameopedia/configuration'
require 'gameopedia/client'

module Gameopedia # :nodoc:
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
