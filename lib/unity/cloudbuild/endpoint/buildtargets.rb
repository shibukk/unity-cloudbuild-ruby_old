module Unity
  module Cloudbuild
    module Endpoint
      class Buildtargets < Base
        def list_all_build_targets_for_a_project(params={})
          path = project_path(params) + "/buildtargets"
          path += query(params, [:include, :include_last_success])
          request(:get, path)
        end

        def create_build_target_for_a_project(params={}, options={})
          path = project_path(params) + "/buildtargets"
          request(:post, path, options)
        end

        def get_a_build_target(params={})
          path = build_target_path(params)
          request(:get, path)
        end

        def update_build_target_details(params={}, options={})
          path = build_target_path(params)
          request(:put, path, options)
        end

        def delete_build_target(params={})
          path = build_target_path(params)
          request(:delete, path)
        end

        def list_all_build_targets_for_an_org(params={})
          path = org_path(params) + "/buildtargets"
          path += query(params, [:include, :include_last_success])
          request(:get, path)
        end
      end
    end
  end
end
