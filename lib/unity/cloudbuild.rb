require "unity/cloudbuild/client"

module Unity
  module Cloudbuild
    def self.client
      @client ||= Unity::Cloudbuild::Client.new
    end
  end
end
