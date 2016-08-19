module Unity
  module Cloudbuild
    module Endpoint
      class Projects < Base
        def list_all_projects_user(params={})
          request(:get, "/projects")
        end

        def get_project_details(params={})
          projectupid = params[:projectupid] || @client.configuration.projectupid
          request(:get, "/projects/#{projectupid}")
        end

        def list_all_projects_org(params={})
          request(:get, org_path(params) + "/projects")
        end

        def create_project(params={})
          request(:post, org_path(params) + "/projects")
        end

        def get_project_details(params={})
          request(:get, project_path(params))
        end

        def update_project_details(params={})
          request(:put, project_path(params))
        end

        def archive_project(params={})
          request(:delete, project_path(params))
        end

        def get_billing_plan(params={})
          request(:get, project_path(params) + "/billingplan")
        end

        def get_ssh_key(params={})
          request(:get, project_path(params) + "/sshkey")
        end

        def get_project_statistics(params={})
          request(:get, project_path(params) + "/stats")
        end

        def get_audit_log(params={})
          request(:get, project_path(params) + "/auditlog")
        end

        def list_all_users(params={})
          request(:get, project_path(params) + "/users")
        end

        def grant_user_access(params={})
          request(:post, project_path(params) + "/users")
        end

        def revoke_user_access(params={})
          email = params[:email] || @client.configuration.email
          request(:delete, project_path(params) + "/users/#{email}")
        end
      end
    end
  end
end
