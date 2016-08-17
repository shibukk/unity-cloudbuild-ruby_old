module Unity
  module Cloudbuild
    module Endpoint
      class Builds < Base
=begin
simple aliases
=end
        def build(options={})
          request(:post, build_target_path(options) + "/builds")
        end

        def cancel(options={})
          request(:delete, build_target_path(options) + "/builds")
        end

        def download_urls(options={})
          result = request(:get, build_target_path(options) + "/builds?buildStatus=success&per_page=1&page=1")
          return result[0]["links"]["download_primary"]["href"] rescue nil
        end

=begin
default api
=end
        def get_audit_log(options={})
          request(:get, build_target_path(options) + "/auditlog")
        end

        def create_polling_jobs(options={})
          request(:post, build_target_path(options) + "/polling")
        end

        def list_all_builds(options={})
          request(:get, build_target_path(options) + "/builds")
        end

        def create_new_build(options={})
          request(:post, build_target_path(options) + "/builds")
        end

        def cancel_all_builds(options={})
          request(:delete, build_target_path(options) + "/builds")
        end

        def build_status(options={})
          number = options[:number] || @client.configuration.number
          request(:get, build_target_path(options) + "/builds/#{number}")
        end

        def cancel_build(options={})
          number = options[:number] || @client.configuration.number
          request(:delete, build_target_path(options) + "/builds/#{number}")
        end

        def get_audit_log(options={})
          number = options[:number] || @client.configuration.number
          request(:get, build_target_path(options) + "/builds/#{number}/auditlog")
        end

        def list_all_builds_for_org(options={})
          request(:get, org_path(options) + "/builds")
        end

        def cancel_builds_for_org(options={})
          request(:delete, org_path(options) + "/builds")
        end

        def get_build_log(options={})
          number = options[:number] || @client.configuration.number
          request(:get, build_target_path(options) + "/builds/#{number}/log")
        end

        def get_the_share_link(options={})
          number = options[:number] || @client.configuration.number
          request(:get, build_target_path(options) + "/builds/#{number}/share")
        end

        def create_a_new_link_to_share_a_project(options={})
          number = options[:number] || @client.configuration.number
          request(:post, build_target_path(options) + "/builds/#{number}/share")
        end

        def revoke_a_shared_link(options={})
          number = options[:number] || @client.configuration.number
          request(:delete, build_target_path(options) + "/builds/#{number}/share")
        end
      end
    end
  end
end
