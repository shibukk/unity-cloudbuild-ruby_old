module Unity
  module Cloudbuild
    module Endpoint
      class Users < Base
        def get_current_user(params={})
          request(:get, "/users/me")
        end

        def update_current_user(params={})
          request(:put, "/users/me")
        end

        def regenerate_api_key(params={})
          request(:post, "/users/me/apikey")
        end
      end
    end
  end
end
