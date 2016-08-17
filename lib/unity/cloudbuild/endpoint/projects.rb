module Unity
  module Cloudbuild
    module Endpoint
      class Projects < Base
        def list_all_projects_user(options={})
          request(:get, "/projects")
        end

        def get_project_details(options={})
          projectupid = options[:projectupid] || @client.configuration.projectupid
          request(:get, "/projects/#{projectupid}")
        end

        def list_all_projects_org(options={})
          request(:get, org_path(options) + "/projects")
        end

        def create_project(options={})
          request(:post, org_path(options) + "/projects")
        end

        def get_project_details(options={})
          request(:get, project_path(options))
        end

        def update_project_details(options={})
          request(:put, project_path(options))
        end

        def archive_project(options={})
          request(:delete, project_path(options))
        end

        def get_billing_plan(options={})
          request(:get, project_path(options) + "/billingplan")
        end

        def get_ssh_key(options={})
          request(:get, project_path(options) + "/sshkey")
        end

        def get_project_statistics(options={})
          request(:get, project_path(options) + "/stats")
        end

        def get_audit_log(options={})
          request(:get, project_path(options) + "/auditlog")
        end

        def list_all_users(options={})
          request(:get, project_path(options) + "/users")
        end

        def grant_user_access(options={})
          request(:post, project_path(options) + "/users")
        end

        def revoke_user_access(options={})
          email = options[:email] || @client.configuration.email
          request(:delete, project_path(options) + "/users/#{email}")
        end
      end
    end
  end
end
