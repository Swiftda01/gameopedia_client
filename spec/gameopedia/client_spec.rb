# frozen_string_literal: true

require 'gameopedia/client'

RSpec.describe Gameopedia::Client do
  let(:auth_logon) { 'auth_logon' }
  let(:auth_key) { 'auth_key' }

  let(:http_client) { Typhoeus }

  let(:gameopedia_response) do
    instance_double(
      http_client::Response,
      code: gameopedia_response_code,
      body: gameopedia_response_body
    )
  end

  let(:gameopedia_response_code) { 200 }
  let(:gameopedia_response_body) { 'gameopedia_response_body' }

  before do
    Gameopedia.configure do |config|
      config.auth_logon = auth_logon
      config.auth_key = auth_key
    end

    allow(http_client).to receive(:get).and_return(gameopedia_response)
  end

  describe '#get_full_dump' do
    let(:page_number) { 1 }

    it 'uses an http client to get a paginated dump of game data from Gameopedia' do
      subject.get_full_dump(page: page_number)

      expect(http_client).to have_received(:get).with(
        'https://api.gameopedia.com/consumer/api/data/europe/GB/retail2/dump/full.json',
        params: { auth_logon: auth_logon, auth_key: auth_key, page: page_number }
      )
    end

    it 'returns a response object' do
      expect(subject.get_full_dump(page: page_number)).to be_kind_of(Gameopedia::Response)
    end
  end
end
