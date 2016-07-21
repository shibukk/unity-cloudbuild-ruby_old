require 'spec_helper'

describe Unity::Cloudbuild do

  it 'has a version number' do
    expect(Unity::Cloudbuild::VERSION).not_to be nil
  end

  it 'build on static' do
    Unity::Cloudbuild.client.configure do |config|
      config.token = "token"
    end
    Unity::Cloudbuild.client.build(org: "org", project: "project", build_target: "build_target")
  end

  it 'build on static add other params' do
    Unity::Cloudbuild.client.configure do |config|
      config.token        = "token"
      config.org          = "org"
      config.project      = "project"
      config.build_target = "build_target"
    end
    Unity::Cloudbuild.client.build
  end

  it 'build on instance' do
    client = Unity::Cloudbuild::Client.new(token: "token")
    client.build(org: "org", project: "project", build_target: "build_target")
  end

  it 'build on instance add other params' do
    client = Unity::Cloudbuild::Client.new(
      token: "token",
      org: "org",
      project: "project",
      build_target: "build_target"
    )
    client.build
  end

  it 'missing api key' do
    Unity::Cloudbuild.client.build(org: "org", project: "project", build_target: "build_target")
  end

  it 'auth error' do
    Unity::Cloudbuild.client.configure do |config|
      config.token = "hoge"
    end
    Unity::Cloudbuild.client.build(org: "org", project: "project", build_target: "build_target")
  end
end
