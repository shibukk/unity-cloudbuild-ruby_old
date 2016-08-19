module Unity
  module Cloudbuild
    module Endpoint
      class Userdevices < Base
        def list_ios_device_profiles(params={})
          request(:get, "/users/me/devices")
        end

        def create_ios_device_profile(params={})
          request(:post, "/users/me/devices")
        end
      end
    end
  end
end
