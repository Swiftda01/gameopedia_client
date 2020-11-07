# frozen_string_literal: true

require 'gameopedia/configuration'

RSpec.describe Gameopedia::Configuration do
  it 'allows the auth logon to be written into configuration' do
    auth_logon = 'something'

    aggregate_failures do
      subject.auth_logon = auth_logon
      expect(subject.auth_logon).to eq(auth_logon)
    end
  end

  context 'when the auth logon has not been configured' do
    it 'raises an exception' do
      expect { subject.auth_logon }.to raise_error(
        Gameopedia::MissingConfiguration,
        'Auth logon must be set'
      )
    end
  end

  it 'allows the auth key to be written into configuration' do
    auth_key = 'something'

    aggregate_failures do
      subject.auth_key = auth_key
      expect(subject.auth_key).to eq(auth_key)
    end
  end

  context 'when the auth key has not been configured' do
    it 'raises an exception' do
      expect { subject.auth_key }.to raise_error(
        Gameopedia::MissingConfiguration,
        'Auth key must be set'
      )
    end
  end
end
