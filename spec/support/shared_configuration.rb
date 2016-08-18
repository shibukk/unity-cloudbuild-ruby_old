shared_context "shared configuration" do
  $stderr.puts "Please set token to ENV['CLOUDBUILD_TOKEN']"                 if ENV["CLOUDBUILD_TOKEN"].nil?
  $stderr.puts "Please set orgid to ENV['CLOUDBUILD_ORGID']"                 if ENV["CLOUDBUILD_ORGID"].nil?
  $stderr.puts "Please set projectid to ENV['CLOUDBUILD_PROJECTID']"         if ENV["CLOUDBUILD_PROJECTID"].nil?
  $stderr.puts "Please set buildtargetid to ENV['CLOUDBUILD_BUILDTARGETID']" if ENV["CLOUDBUILD_BUILDTARGETID"].nil?
  $stderr.puts "Please set email to ENV['CLOUDBUILD_EMAIL']"                 if ENV["CLOUDBUILD_EMAIL"].nil?

  let(:valid_api_keys) { Hash[
                          token:         ENV["CLOUDBUILD_TOKEN"],
                          orgid:         ENV["CLOUDBUILD_ORGID"],
                          projectid:     ENV["CLOUDBUILD_PROJECTID"],
                          buildtargetid: ENV["CLOUDBUILD_BUILDTARGETID"],
                          email:         ENV["CLOUDBUILD_EMAIL"],
                        ] }
  let(:invalid_api_keys) { Hash[
                            token:         "foo",
                            orgid:         "bar",
                            projectid:     "baz",
                            buildtargetid: "qux",
                            email:         "quux@example.com",
                          ] }
end
