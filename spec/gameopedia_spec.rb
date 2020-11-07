# frozen_string_literal: true

require 'gameopedia'

RSpec.describe Gameopedia do
  describe 'configuration' do
    let(:auth_logon) { 'auth_logon' }
    let(:auth_key) { 'auth_logon' }

    before do
      Gameopedia.configure do |config|
        config.auth_logon = auth_logon
        config.auth_key = auth_key
      end
    end

    context 'with required settings configured' do
      it 'returns the auth logon' do
        expect(Gameopedia.configuration.auth_logon).to eq(auth_logon)
      end

      it 'returns the auth key' do
        expect(Gameopedia.configuration.auth_key).to eq(auth_key)
      end
    end

    context 'with the auth logon not configured' do
      let(:auth_logon) { nil }

      it 'raises a configuration error' do
        expect { Gameopedia.configuration.auth_logon }.to raise_error(
          Gameopedia::MissingConfiguration
        )
      end
    end

    context 'with the auth key not configured' do
      let(:auth_key) { nil }

      it 'raises a configuration error' do
        expect { Gameopedia.configuration.auth_key }.to raise_error(
          Gameopedia::MissingConfiguration
        )
      end
    end
  end
end
