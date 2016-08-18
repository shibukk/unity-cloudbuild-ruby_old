require 'spec_helper'

describe Unity::Cloudbuild::Configuration do
  include_context 'shared configuration'

  let(:client) { Unity::Cloudbuild::Client.new(api_keys) }
  let(:api_keys) { valid_api_keys }

  def configure_client_with_api_keys(api_keys)
    client.configure do |config|
      api_keys.each { |key, value| config.send("#{key}=", value) }
    end
  end

  describe '#initialize' do
    subject { client }

    context 'when valid configuration' do
      it { api_keys.each { |k, v| expect(client.configuration.send(k)).to eq v } }
    end

    context 'when not set configuration' do
      let(:api_keys) { Hash.new }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::MissingAPIKeys }
    end
  end

  describe '#configure' do
    subject { client.configuration }
    let(:client) { Unity::Cloudbuild::Client.new }

    context 'when valid configuration' do
      before { configure_client_with_api_keys(api_keys) }
      it { api_keys.each { |k, v| expect(client.configuration.send(k)).to eq v } }
    end
  end

  describe '#connection' do
    subject { client.connection }

    context 'when connection with configuration' do
      it { expect{ subject }.not_to raise_error }
    end

    context 'when connection without configuration' do
      let(:api_keys) { Hash.new }
      it { expect { subject }.to raise_error Unity::Cloudbuild::Error::MissingAPIKeys }
    end
  end
end
