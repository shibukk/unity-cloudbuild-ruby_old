module Unity
  module Cloudbuild
    module Endpoint
      class Builds < Base
        def get_all_audit_log(params={})
          request(:get, build_target_path(params) + "/auditlog")
        end

        def create_polling_jobs(params={})
          request(:post, build_target_path(params) + "/polling")
        end

        def list_all_builds(params={})
          request(:get, build_target_path(params) + "/builds")
        end

        def create_new_build(params={}, options={})
          request(:post, build_target_path(params) + "/builds", options)
        end

        def cancel_all_builds(params={})
          request(:delete, build_target_path(params) + "/builds")
        end

        def build_status(params={})
          number = params[:number] || @client.configuration.number
          request(:get, build_target_path(params) + "/builds/#{number}")
        end

        def cancel_build(params={})
          number = params[:number] || @client.configuration.number
          request(:delete, build_target_path(params) + "/builds/#{number}")
        end

        def get_audit_log(params={})
          number = params[:number] || @client.configuration.number
          request(:get, build_target_path(params) + "/builds/#{number}/auditlog")
        end

        def list_all_builds_for_org(params={})
          request(:get, org_path(params) + "/builds")
        end

        def cancel_builds_for_org(params={})
          request(:delete, org_path(params) + "/builds")
        end

        def get_build_log(params={})
          number = params[:number] || @client.configuration.number
          request(:get, build_target_path(params) + "/builds/#{number}/log", {}, false)
        end

        def get_the_share_link(params={})
          number = params[:number] || @client.configuration.number
          request(:get, build_target_path(params) + "/builds/#{number}/share")
        end

        def create_a_new_link_to_share_a_project(params={})
          number = params[:number] || @client.configuration.number
          request(:post, build_target_path(params) + "/builds/#{number}/share")
        end

        def revoke_a_shared_link(params={})
          number = params[:number] || @client.configuration.number
          request(:delete, build_target_path(params) + "/builds/#{number}/share")
        end
      end
    end
  end
end
