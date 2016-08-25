module Unity
  module Cloudbuild
    module Endpoint
      class Credentials < Base
        def get_all_android_credentials(params={})
          path = project_path(params) + "/credentials/signing/android"
          request(:get, path)
        end

        def upload_android_credentials(params={})
          path = project_path(params) + "/credentials/signing/android"
          request(:post, path)
        end

        def get_android_credential_details(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/android/#{credentialid}"
          request(:get, path)
        end

        def update_android_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/android/#{credentialid}"
          request(:put, path)
        end

        def delete_android_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/android/#{credentialid}"
          request(:delete, path)
        end

        def get_all_ios_credentials(params={})
          path = project_path(params) + "/credentials/signing/ios"
          request(:get, path)
        end

        def upload_ios_credentials(params={})
          path = project_path(params) + "/credentials/signing/ios"
          request(:post, path)
        end

        def get_ios_credential_details(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/ios/#{credentialid}"
          request(:get, path)
        end

        def update_ios_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/ios/#{credentialid}"
          request(:put, path)
        end

        def delete_ios_credentials(params={})
          credentialid = params[:credentialid] || @client.configuration.credentialid
          path = project_path(params) + "/credentials/signing/ios/#{credentialid}"
          request(:delete, path)
        end
      end
    end
  end
end
