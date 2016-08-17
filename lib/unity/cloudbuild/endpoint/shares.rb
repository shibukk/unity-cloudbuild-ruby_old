module Unity
  module Cloudbuild
    module Endpoint
      class Shares < Base
        def get_details_on_shared_build_including_download_link(options={})
          shareid = options[:shareid] || @client.configuration.shareid
          request(:get, "/shares/#{shareid}")
        end
      end
    end
  end
end
