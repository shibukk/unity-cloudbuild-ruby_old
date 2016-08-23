# ruby lib/generators/endpoint/generator.rb
require 'mechanize'
require 'erb'
require 'ostruct'

docs = []
params = ["number", "credentialid", "projectupid", "email", "shareid", "id"]

agent = Mechanize.new
page = agent.get('https://build-api.cloud.unity3d.com/docs/1.0.0/index.html')
operations = page.search('//div[contains(@class,"swagger--panel-operation") and not(contains(@class,"intropanel"))]')

operations.each do |operation|
  doc = OpenStruct.new

  heading = operation.at('div[@class="panel-heading"]')
  body = operation.at('div[@class="panel-body"]')
  h3 = heading.at('h3/text()')
  verb = heading.at('div/span[1]/text()')
  url = heading.at('div/span[2]/text()')
  table = body.search('section/table/tbody')
  request_body = body.at('form/section[@class="sw-request-body"]/div[@class="sw-request-model"]')

  doc.name = h3.text.strip.downcase.gsub(' ', '_').gsub(/\(|\)/, '')
  doc.verb = verb.text.downcase
  doc.url = "\"#{url.text}\""
    .gsub('"/orgs/{orgid}/projects/{projectid}/buildtargets/{buildtargetid}', 'build_target_path(params) + "')
    .gsub('"/orgs/{orgid}/projects/{projectid}', 'project_path(params) + "')
    .gsub('"/orgs/{orgid}', 'org_path(params) + "')
    .gsub('{', '#{')
    .gsub(' + ""', '')

  # add url param
  params.each do |param|
    if doc.url =~ /\#{(#{param})}/
      doc.param = "#{param} = params[:#{param}] || @client.configuration.#{param}"
    end
  end
  # add query
  td = []
  table.children.each do |tr|
    next unless tr.name == 'tr' && tr.to_s =~ /query/
    td << ":#{tr.children[1].text.strip}"
  end
  unless td.empty?
    doc.query = 'query(params, [' + td.join(', ') + '])'
  end
  # add request body
  doc.has_body = !request_body.nil?

  docs << doc if doc.name != nil
end

template = ERB.new(open(File.dirname(__FILE__) + '/template.erb').read, nil, '-')
open(File.dirname(__FILE__) + '/sample.rb', 'w') do |f|
  f.print template.result(binding)
end
