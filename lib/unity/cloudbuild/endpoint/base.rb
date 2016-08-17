module Unity
  module Cloudbuild
    module Endpoint
      class Base
        def initialize(client)
          @client = client
        end

        def request(method, path)
          response = @client.connection.send(method, path)
          return response.body
        end

        private

        def base_path
          return "/api/v1"
        end

        def org_path(options={})
          orgid = options[:orgid] || @client.configuration.orgid
          return base_path + "/orgs/#{orgid}"
        end

        def project_path(options={})
          projectid = options[:projectid] || @client.configuration.projectid
          return org_path + "/projects/#{projectid}"
        end

        def build_target_path(options={})
          buildtargetid = options[:buildtargetid] || @client.configuration.buildtargetid
          return project_path(options) + "/buildtargets/#{buildtargetid}"
        end
      end
    end
  end
end
