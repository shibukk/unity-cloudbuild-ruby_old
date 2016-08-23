require 'json'

module Unity
  module Cloudbuild
    module Endpoint
      class Base
        def initialize(client)
          @client = client
        end

        def request(method, path, options={}, parse=true)
          response = @client.connection(parse).send(method) do |request|
            case method
            when :get, :delete
              request.url(path, options.to_json)
            when :post, :put
              request.path = path
              request.body = options.to_json unless options.empty?
            end
          end
          return response.body
        end

        private

        def base_path
          return "/api/v1"
        end

        def org_path(params={})
          orgid = params[:orgid] || @client.configuration.orgid
          return base_path + "/orgs/#{orgid}"
        end

        def project_path(params={})
          projectid = params[:projectid] || @client.configuration.projectid
          return org_path + "/projects/#{projectid}"
        end

        def build_target_path(params={})
          buildtargetid = params[:buildtargetid] || @client.configuration.buildtargetid
          return project_path(params) + "/buildtargets/#{buildtargetid}"
        end
      end
    end
  end
end
