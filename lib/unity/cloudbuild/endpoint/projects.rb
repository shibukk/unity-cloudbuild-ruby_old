module Unity
  module Cloudbuild
    module Endpoint
      class Projects < Base
        def list_all_projects_user(params={})
          path = "/projects"
          path += query(params, [:include])
          request(:get, path)
        end

        def get_project_details(params={})
          projectupid = params[:projectupid] || @client.configuration.projectupid
          path = "/projects/#{projectupid}"
          request(:get, path)
        end

        def list_all_projects_org(params={})
          path = org_path(params) + "/projects"
          path += query(params, [:include])
          request(:get, path)
        end

        def create_project(params={}, options={})
          path = org_path(params) + "/projects"
          request(:post, path, options)
        end

        def get_project_details(params={})
          path = project_path(params)
          path += query(params, [:include])
          request(:get, path)
        end

        def update_project_details(params={}, options={})
          path = project_path(params)
          request(:put, path, options)
        end

        def archive_project(params={})
          path = project_path(params)
          request(:delete, path)
        end

        def get_billing_plan(params={})
          path = project_path(params) + "/billingplan"
          request(:get, path)
        end

        def get_ssh_key(params={})
          path = project_path(params) + "/sshkey"
          request(:get, path)
        end

        def get_project_statistics(params={})
          path = project_path(params) + "/stats"
          request(:get, path)
        end

        def get_audit_log(params={})
          path = project_path(params) + "/auditlog"
          path += query(params, [:per_page, :page])
          request(:get, path)
        end

        def list_all_users(params={})
          path = project_path(params) + "/users"
          request(:get, path)
        end

        def grant_user_access(params={}, options={})
          path = project_path(params) + "/users"
          request(:post, path, options)
        end

        def revoke_user_access(params={})
          email = params[:email] || @client.configuration.email
          path = project_path(params) + "/users/#{email}"
          request(:delete, path)
        end
      end
    end
  end
end
