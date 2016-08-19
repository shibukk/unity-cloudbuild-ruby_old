module Unity
  module Cloudbuild
    module Endpoint
      class Orgs < Base
        def get_billing_plan(params={})
          request(:get, org_path(params) + "/billingplan")
        end

        def get_ssh_key(params={})
          request(:get, org_path(params) + "/sshkey")
        end

        def regenerate_ssh_key(params={})
          request(:post, org_path(params) + "/sshkey")
        end
      end
    end
  end
end
