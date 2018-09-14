require 'rubygems'
require 'httparty'

class Github
  include HTTParty
  base_uri 'https://api.github.com'
end

@token = 'e24f251180c0ce19fb33e028f968f0a1355a39cd'
Github.post("/user/repos", :query => {
      :access_token => @token
    },
    :body => {
      :name => 'git_auth_test',
      :description => "Reop description",
      :homepage => "http://ramisn.com",
      :public => true,
      :has_issues => false,
      :has_wiki => false,
      :has_downloads => false
    }.to_json)