module Unity
  module Cloudbuild
    module Endpoint
      class Userdevices < Base
        def list_ios_device_profiles(options={})
          request(:get, "/users/me/devices")
        end

        def create_ios_device_profile(options={})
          request(:post, "/users/me/devices")
        end
      end
    end
  end
end
