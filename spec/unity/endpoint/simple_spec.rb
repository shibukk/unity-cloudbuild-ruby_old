require 'spec_helper'

describe Unity::Cloudbuild::Endpoint::Simple do
  include_context 'shared configuration'

  let(:client) { Unity::Cloudbuild::Client.new(api_keys) }
  let(:api_keys) { valid_api_keys }

  describe 'simple#build', vcr: 'endpoint/simple_build' do
    subject { client.build }

    context 'when you success to build' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).not_to be_empty }
    end

    context 'when you failed to build' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'simple#cancel', vcr: 'endpoint/simple_cancel' do
    subject { client.cancel }

    context 'when you success to cancel all build' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to be_nil }
    end

    context 'when you failed to cancel all build' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end

  describe 'simple#download_urls', vcr: 'endpoint/simple_download_urls' do
    subject { client.download_urls }

    context 'when you success to get download_urls' do
      it { expect{ subject }.not_to raise_error }
      it { expect(subject).to match /https:\/\/.+/ }
    end

    context 'when you failed to get download_urls' do
      let(:api_keys) { invalid_api_keys }
      it { expect{ subject }.to raise_error Unity::Cloudbuild::Error::InvalidSignature }
    end
  end
end
