module Unity
  module Cloudbuild
    module Endpoint
      class Base
        def initialize(client)
          @client = client
        end

        def request(method, path, option={}, parse=true)
          response = @client.connection(parse).send(method, path)
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
