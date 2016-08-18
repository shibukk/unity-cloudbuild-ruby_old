require 'spec_helper'

describe Unity::Cloudbuild::Configuration do
  include_context 'shared configuration'

  let(:api_keys) { valid_api_keys }
  let(:configuration) { Unity::Cloudbuild::Configuration.new(api_keys) }

  describe '#initialize' do
    subject { configuration }

    context 'when keys are set' do
      it { api_keys.each { |k, v| expect(configuration.send(k)).to eq v } }
    end
  end

  describe '#invalid' do
    subject { configuration.invalid? }

    context 'when keys are valid' do
      it { is_expected.to eq false }
    end

    context 'when keys are not set' do
      let(:api_keys) { Hash.new }
      it { is_expected.to eq true }
    end
  end
end
