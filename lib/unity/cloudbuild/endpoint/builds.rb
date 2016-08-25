module Unity
  module Cloudbuild
    module Endpoint
      class Builds < Base
        def get_all_audit_log(params={})
          path = build_target_path(params) + "/auditlog"
          path += query(params, [:per_page, :page])
          request(:get, path)
        end

        def create_polling_jobs(params={})
          path = build_target_path(params) + "/polling"
          request(:post, path)
        end

        def list_all_builds(params={})
          path = build_target_path(params) + "/builds"
          path += query(params, [:include, :per_page, :page, :buildStatus, :platform])
          request(:get, path)
        end

        def create_new_build(params={}, options={})
          path = build_target_path(params) + "/builds"
          request(:post, path, options)
        end

        def cancel_all_builds(params={})
          path = build_target_path(params) + "/builds"
          request(:delete, path)
        end

        def build_status(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}"
          path += query(params, [:include])
          request(:get, path)
        end

        def cancel_build(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}"
          request(:delete, path)
        end

        def get_audit_log(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}/auditlog"
          path += query(params, [:per_page, :page])
          request(:get, path)
        end

        def list_all_builds_for_org(params={})
          path = org_path(params) + "/builds"
          path += query(params, [:include, :per_page, :page, :buildStatus, :platform])
          request(:get, path)
        end

        def cancel_builds_for_org(params={})
          path = org_path(params) + "/builds"
          request(:delete, path)
        end

        def get_build_log(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}/log"
          path += query(params, [:offsetlines, :linenumbers, :compact, :withHtml])
          request(:get, path, {}, false)
        end

        def get_the_share_link(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}/share"
          request(:get, path)
        end

        def create_a_new_link_to_share_a_project(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}/share"
          request(:post, path)
        end

        def revoke_a_shared_link(params={})
          number = params[:number] || @client.configuration.number
          path = build_target_path(params) + "/builds/#{number}/share"
          request(:delete, path)
        end
      end
    end
  end
end
