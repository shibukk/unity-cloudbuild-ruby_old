module Unity
  module Cloudbuild
    module Endpoint
      class Webhooks < Base
        def list_hooks_for_organization(params={})
          path = org_path(params) + "/hooks"
          request(:get, path)
        end

        def add_hook_for_organization(params={}, options={})
          path = org_path(params) + "/hooks"
          request(:post, path, options)
        end

        def get_organization_hook_details(params={})
          id = params[:id] || @client.configuration.id
          path = org_path(params) + "/hooks/#{id}"
          request(:get, path)
        end

        def delete_organization_hook(params={})
          id = params[:id] || @client.configuration.id
          path = org_path(params) + "/hooks/#{id}"
          request(:delete, path)
        end

        def update_hook_for_organization(params={}, options={})
          id = params[:id] || @client.configuration.id
          path = org_path(params) + "/hooks/#{id}"
          request(:put, path, options)
        end

        def ping_an_org_hook(params={})
          id = params[:id] || @client.configuration.id
          path = org_path(params) + "/hooks/#{id}/ping"
          request(:post, path)
        end

        def list_hooks_for_project(params={})
          path = project_path(params) + "/hooks"
          request(:get, path)
        end

        def add_hook_for_project(params={}, options={})
          path = project_path(params) + "/hooks"
          request(:post, path, options)
        end

        def get_project_hook_details(params={})
          id = params[:id] || @client.configuration.id
          path = project_path(params) + "/hooks/#{id}"
          request(:get, path)
        end

        def delete_project_hook(params={})
          id = params[:id] || @client.configuration.id
          path = project_path(params) + "/hooks/#{id}"
          request(:delete, path)
        end

        def update_hook_for_project(params={}, options={})
          id = params[:id] || @client.configuration.id
          path = project_path(params) + "/hooks/#{id}"
          request(:put, path, options)
        end

        def ping_a_project_hook(params={})
          id = params[:id] || @client.configuration.id
          path = project_path(params) + "/hooks/#{id}/ping"
          request(:post, path)
        end
      end
    end
  end
end
