module Unity
  module Cloudbuild
    module Endpoint
      class Users < Base
        def get_current_user(params={})
          path = "/users/me"
          path += query(params, [:include])
          request(:get, path)
        end

        def update_current_user(params={}, options={})
          path = "/users/me"
          request(:put, path, options)
        end

        def regenerate_api_key(params={})
          path = "/users/me/apikey"
          request(:post, path)
        end
      end
    end
  end
end
