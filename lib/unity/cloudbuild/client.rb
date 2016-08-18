require "faraday"
require "faraday_middleware"
require "unity/cloudbuild/configuration"
require "unity/cloudbuild/error"
require "unity/cloudbuild/version"

Dir[File.expand_path('../../../faraday/*.rb', __FILE__)].each{ |f| require f }
Dir[File.expand_path('../endpoint/*.rb', __FILE__)].each{ |f| require f }

module Unity
  module Cloudbuild
    class Client
      API_HOST = "https://build-api.cloud.unity3d.com"
      CLASSES = [
        Endpoint::Builds, Endpoint::Buildtargets, Endpoint::Config,
        Endpoint::Credentials, Endpoint::Orgs, Endpoint::Projects,
        Endpoint::Shares, Endpoint::Simple, Endpoint::Userdevices,
        Endpoint::Users, Endpoint::Webhooks,
      ]

      attr_reader :configuration

      # Creates an instance of the Unity Cloud Build client
      # @param options [Hash] a hash of the token
      # @return [Client] a new client initialized with the keys
      def initialize(options = nil)
        @configuration = nil
        define_methods

        unless options.nil?
          @configuration = Configuration.new(options)
          check_api_keys
        end
      end

      # Configure the API client
      def configure
        @configuration = Configuration.new
        yield(@configuration)
        check_api_keys
      end

      # Checks that all the keys needed were given
      def check_api_keys
        if @configuration.nil? || @configuration.invalid?
          @configuration = nil
          raise Error::MissingAPIKeys
        else
          @configuration.freeze
        end
      end

      # API connection
      # @return [Faraday] a new connection with configuration
      def connection
        return @connection if instance_variable_defined?(:@connection)
        check_api_keys

        @connection = Faraday.new(API_HOST) do |conn|
          conn.headers["Content-Type"]  = "application/json"
          conn.headers["Authorization"] = "Basic #{@configuration.token}"
          conn.use Faraday::Response::ParseJson
          conn.response :raise_http_exception
          conn.adapter :net_http
        end
        return @connection
      end

      private

      # Define the method on the client
      def define_methods
        CLASSES.each do |request_class|
          instance = request_class.new(self)
          instance.public_methods(false).each do |method_name|
            define_singleton_method(method_name) do |*args|
              instance.public_send(method_name, *args)
            end
          end
        end
      end
    end
  end
end
