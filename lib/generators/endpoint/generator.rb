# ruby lib/generators/endpoint/generator.rb
require 'mechanize'
require 'erb'
require 'ostruct'

agent = Mechanize.new
page = agent.get('https://build-api.cloud.unity3d.com/docs/1.0.0/index.html')
panels = page.search('//div[@class="panel-heading"]')
docs = []

panels.each do |panel|
  doc = OpenStruct.new
  panel.children.each do |child|
    case child.name
    when 'h3'
      doc.name = child.text.strip.downcase.gsub(' ', '_').gsub(/\(|\)/, '')
    when 'div'
      doc.verb = child.children[0].text.downcase
      doc.url = "\"#{child.children[2].text}\""
        .gsub('"/orgs/{orgid}/projects/{projectid}/buildtargets/{buildtargetid}', 'build_target_path(params) + "')
        .gsub('"/orgs/{orgid}/projects/{projectid}', 'project_path(params) + "')
        .gsub('"/orgs/{orgid}', 'org_path(params) + "')
        .gsub('{', '#{')
        .gsub(' + ""', '')
      case doc.url
      when /\#{number}/
        doc.param = 'number = params[:number] || @client.configuration.number'
      when /\#{credentialid}/
        doc.param = 'credentialid = params[:credentialid] || @client.configuration.credentialid'
      when /\#{projectupid}/
        doc.param = 'projectupid = params[:projectupid] || @client.configuration.projectupid'
      when /\#{email}/
        doc.param = 'email = params[:email] || @client.configuration.email'
      when /\#{shareid}/
        doc.param = 'shareid = params[:shareid] || @client.configuration.shareid'
      when /\#{id}/
        doc.param = 'id = params[:id] || @client.configuration.id'
      end
    end
  end
  docs << doc if doc.name != nil
end

template = ERB.new(open(File.dirname(__FILE__) + '/template.erb').read, nil, '-')
open(File.dirname(__FILE__) + '/sample.rb', 'w') do |f|
  f.print template.result(binding)
end
