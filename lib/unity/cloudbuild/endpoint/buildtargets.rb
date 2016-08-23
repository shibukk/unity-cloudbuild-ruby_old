module Unity
  module Cloudbuild
    module Endpoint
      class Buildtargets < Base
        def list_all_build_targets_for_a_project(params={})
          request(:get, project_path(params) + "/buildtargets")
        end

        def create_build_target_for_a_project(params={}, options={})
          request(:post, project_path(params) + "/buildtargets", options)
        end

        def get_a_build_target(params={})
          request(:get, build_target_path(params))
        end

        def update_build_target_details(params={}, options={})
          request(:put, build_target_path(params), options)
        end

        def delete_build_target(params={})
          request(:delete, build_target_path(params))
        end

        def list_all_build_targets_for_an_org(params={})
          request(:get, org_path(params) + "/buildtargets")
        end
      end
    end
  end
end
