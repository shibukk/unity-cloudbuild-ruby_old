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
      doc.name = child.text.strip.downcase.gsub(' ', '_')
    when 'div'
      doc.verb = child.children[0].text.downcase
      doc.url = "\"#{child.children[2].text}\""
        .gsub('"/orgs/{orgid}/projects/{projectid}/buildtargets/{buildtargetid}', 'build_target_path(options) + "')
        .gsub('"/orgs/{orgid}/projects/{projectid}', 'project_path(options) + "')
        .gsub('"/orgs/{orgid}', 'org_path(options) + "')
        .gsub('{', '#{')
        .gsub(' + ""', '')
      case doc.url
      when /\#{number}/
        doc.option = 'number = options[:number] || @client.configuration.number'
      when /\#{credentialid}/
        doc.option = 'credentialid = options[:credentialid] || @client.configuration.credentialid'
      when /\#{projectupid}/
        doc.option = 'projectupid = options[:projectupid] || @client.configuration.projectupid'
      when /\#{email}/
        doc.option = 'email = options[:email] || @client.configuration.email'
      when /\#{shareid}/
        doc.option = 'shareid = options[:shareid] || @client.configuration.shareid'
      when /\#{id}/
        doc.option = 'id = options[:id] || @client.configuration.id'
      end
    end
  end
  docs << doc if doc.name != nil
end

template = ERB.new(open(File.dirname(__FILE__) + '/template.erb').read, nil, '-')
open(File.dirname(__FILE__) + '/sample.rb', 'w') do |f|
  f.print template.result(binding)
end
