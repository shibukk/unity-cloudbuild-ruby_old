module Unity
  module Cloudbuild
    module Endpoint
      class Webhooks < Base
        def list_hooks_for_organization(params={})
          request(:get, org_path(params) + "/hooks")
        end

        def add_hook_for_organization(params={})
          request(:post, org_path(params) + "/hooks")
        end

        def get_organization_hook_details(params={})
          id = params[:id] || @client.configuration.id
          request(:get, org_path(params) + "/hooks/#{id}")
        end

        def delete_organization_hook(params={})
          id = params[:id] || @client.configuration.id
          request(:delete, org_path(params) + "/hooks/#{id}")
        end

        def update_hook_for_organization(params={})
          id = params[:id] || @client.configuration.id
          request(:put, org_path(params) + "/hooks/#{id}")
        end

        def ping_an_org_hook(params={})
          id = params[:id] || @client.configuration.id
          request(:post, org_path(params) + "/hooks/#{id}/ping")
        end

        def list_hooks_for_project(params={})
          request(:get, project_path(params) + "/hooks")
        end

        def add_hook_for_project(params={})
          request(:post, project_path(params) + "/hooks")
        end

        def get_project_hook_details(params={})
          id = params[:id] || @client.configuration.id
          request(:get, project_path(params) + "/hooks/#{id}")
        end

        def delete_project_hook(params={})
          id = params[:id] || @client.configuration.id
          request(:delete, project_path(params) + "/hooks/#{id}")
        end

        def update_hook_for_project(params={})
          id = params[:id] || @client.configuration.id
          request(:put, project_path(params) + "/hooks/#{id}")
        end

        def ping_a_project_hook(params={})
          id = params[:id] || @client.configuration.id
          request(:post, project_path(params) + "/hooks/#{id}/ping")
        end
      end
    end
  end
end
