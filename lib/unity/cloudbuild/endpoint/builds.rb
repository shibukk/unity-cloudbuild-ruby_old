module Unity
  module Cloudbuild
    module Endpoint
      class Builds
        def initialize(client)
          @client = client
        end

        def build(options={})
          @client.connection.post(base_path(options))
        end

        def cancel(options={})
          @client.connection.delete(base_path(options))
        end

        def download_urls(options={})
          response = @client.connection.get(base_path(options) + "?buildStatus=success&per_page=1&page=1")
          return response.body[0]["links"]["download_primary"]["href"] rescue nil
        end

        private

        def base_path(options={})
          org          = options[:org]          || @client.configuration.org
          project      = options[:project]      || @client.configuration.project
          build_target = options[:build_target] || @client.configuration.build_target

          return "/api/v1/orgs/#{org}/projects/#{project}/buildtargets/#{build_target}/builds"
        end
      end
    end
  end
end
