module Unity
  module Cloudbuild
    module Endpoint
      class Webhooks < Base
        def list_hooks_for_organization(options={})
          request(:get, org_path(options) + "/hooks")
        end

        def add_hook_for_organization(options={})
          request(:post, org_path(options) + "/hooks")
        end

        def get_organization_hook_details(options={})
          id = options[:id] || @client.configuration.id
          request(:get, org_path(options) + "/hooks/#{id}")
        end

        def delete_organization_hook(options={})
          id = options[:id] || @client.configuration.id
          request(:delete, org_path(options) + "/hooks/#{id}")
        end

        def update_hook_for_organization(options={})
          id = options[:id] || @client.configuration.id
          request(:put, org_path(options) + "/hooks/#{id}")
        end

        def ping_an_org_hook(options={})
          id = options[:id] || @client.configuration.id
          request(:post, org_path(options) + "/hooks/#{id}/ping")
        end

        def list_hooks_for_project(options={})
          request(:get, project_path(options) + "/hooks")
        end

        def add_hook_for_project(options={})
          request(:post, project_path(options) + "/hooks")
        end

        def get_project_hook_details(options={})
          id = options[:id] || @client.configuration.id
          request(:get, project_path(options) + "/hooks/#{id}")
        end

        def delete_project_hook(options={})
          id = options[:id] || @client.configuration.id
          request(:delete, project_path(options) + "/hooks/#{id}")
        end

        def update_hook_for_project(options={})
          id = options[:id] || @client.configuration.id
          request(:put, project_path(options) + "/hooks/#{id}")
        end

        def ping_a_project_hook(options={})
          id = options[:id] || @client.configuration.id
          request(:post, project_path(options) + "/hooks/#{id}/ping")
        end
      end
    end
  end
end
