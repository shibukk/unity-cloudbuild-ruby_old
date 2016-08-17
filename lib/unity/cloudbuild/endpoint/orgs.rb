module Unity
  module Cloudbuild
    module Endpoint
      class Orgs < Base
        def get_billing_plan(options={})
          request(:get, org_path(options) + "/billingplan")
        end

        def get_ssh_key(options={})
          request(:get, org_path(options) + "/sshkey")
        end

        def regenerate_ssh_key(options={})
          request(:post, org_path(options) + "/sshkey")
        end
      end
    end
  end
end
