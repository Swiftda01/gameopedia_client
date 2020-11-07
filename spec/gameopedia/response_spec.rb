# frozen_string_literal: true

require 'gameopedia/response'

RSpec.describe Gameopedia::Response do
  subject { described_class.new(code: response_code, body: response_body) }

  let(:response_code) { 200 }
  let(:response_body) { 'response_body' }

  describe '#code' do
    it 'returns the response code' do
      expect(subject.code).to eq(response_code)
    end
  end

  describe '#body' do
    it 'returns the response body' do
      expect(subject.body).to eq(response_body)
    end
  end
end
