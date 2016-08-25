module Unity
  module Cloudbuild
    module Endpoint
      class Orgs < Base
        def get_billing_plan(params={})
          path = org_path(params) + "/billingplan"
          request(:get, path)
        end

        def get_ssh_key(params={})
          path = org_path(params) + "/sshkey"
          request(:get, path)
        end

        def regenerate_ssh_key(params={})
          path = org_path(params) + "/sshkey"
          request(:post, path)
        end
      end
    end
  end
end
