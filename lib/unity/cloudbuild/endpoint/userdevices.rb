module Unity
  module Cloudbuild
    module Endpoint
      class Userdevices < Base
        def list_ios_device_profiles(params={})
          path = "/users/me/devices"
          request(:get, path)
        end

        def create_ios_device_profile(params={}, options={})
          path = "/users/me/devices"
          request(:post, path, options)
        end
      end
    end
  end
end
