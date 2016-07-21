module Unity
  module Cloudbuild
    class Configuration
      AUTH_KEYS = [:token, :org, :project, :build_target]

      attr_accessor *AUTH_KEYS

      # Creates the configuration
      def initialize(config_hash = nil)
        if config_hash.is_a?(Hash)
          config_hash.each do |config_name, config_value|
            self.send("#{config_name}=", config_value)
          end
        end
        return config_hash
      end

      # Check only token
      def invalid?
        @token.nil? || @token.empty?
      end
    end
  end
end
