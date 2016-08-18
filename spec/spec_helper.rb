$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'unity/cloudbuild'
require 'vcr'
require 'support/shared_configuration'

RSpec.configure do |config|
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
    # c.allow_http_connections_when_no_cassette = true

    c.filter_sensitive_data('<CLOUDBUILD_TOKEN>') { ENV['CLOUDBUILD_TOKEN'] }
    c.filter_sensitive_data('<CLOUDBUILD_ORGID>') { ENV['CLOUDBUILD_ORGID'] }
    c.filter_sensitive_data('<CLOUDBUILD_PROJECTID>') { ENV['CLOUDBUILD_PROJECTID'] }
    c.filter_sensitive_data('<CLOUDBUILD_BUILDTARGETID>') { ENV['CLOUDBUILD_BUILDTARGETID'] }
    c.filter_sensitive_data('<CLOUDBUILD_EMAIL>') { ENV['CLOUDBUILD_EMAIL'] }
  end

  config.around(:each) do |example|
    vcr_cassette = example.metadata[:vcr]
    if vcr_cassette
      VCR.use_cassette(vcr_cassette, record: :new_episodes) { example.call }
    else
      example.call
    end
  end
end
