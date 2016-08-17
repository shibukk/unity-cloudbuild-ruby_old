module Unity
  module Cloudbuild
    module Endpoint
      class Buildtargets < Base
        def list_all_build_targets_for_a_project(options={})
          request(:get, project_path(options) + "/buildtargets")
        end

        def create_build_target_for_a_project(options={})
          request(:post, project_path(options) + "/buildtargets")
        end

        def get_a_build_target(options={})
          request(:get, build_target_path(options))
        end

        def update_build_target_details(options={})
          request(:put, build_target_path(options))
        end

        def delete_build_target(options={})
          request(:delete, build_target_path(options))
        end

        def list_all_build_targets_for_an_org(options={})
          request(:get, org_path(options) + "/buildtargets")
        end
      end
    end
  end
end
