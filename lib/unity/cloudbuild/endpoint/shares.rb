module Unity
  module Cloudbuild
    module Endpoint
      class Shares < Base
        def get_details_on_shared_build_including_download_link(params={})
          shareid = params[:shareid] || @client.configuration.shareid
          path = "/shares/#{shareid}"
          path += query(params, [:include])
          request(:get, path)
        end
      end
    end
  end
end
