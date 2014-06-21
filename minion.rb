require 'sinatra'
require 'yaml'


get '/status' do
  "OK"
end

get '/commands' do
  YAML.load_file("commands.yml")["commands"].join("\n")
end
