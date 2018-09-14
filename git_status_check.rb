require 'rubygems'
require 'net/http'
require 'uri'

data = ''
File.open("status-check-names.txt", "r").each_line do |line|
  data = line.split(/\t/)
end

# Set env variables
uri = URI.parse('https://git.soma.salesforce.com/api/v3/repos/${GIT_ORG}/${GIT_REPO}/status/${GIT_SHA}')

http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({
  "Accept" => "application/vnd.github.v3+json",
  "Authorization"    => "Bearer $BEARER_TOKEN",
  "Content-Type" => "application/json",
  "body" => {
  	"context"          => data
  }
  
})

# request.add_field() -- Add new field if you wanted any

response = http.request(request)
