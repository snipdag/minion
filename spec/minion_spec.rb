require_relative 'spec_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe "/status" do
  it "must render OK" do
    get '/status'
    last_response.must_be :ok?
    last_response.body.must_equal "OK"
  end
end

describe "/commands" do
  describe "with two commands defined" do
    it "must list the two commands" do
      YAML.stub(:load_file, {"commands" => ["hostname", "uptime"]}) do
        get '/commands'
        last_response.must_be :ok?
        last_response.body.must_equal "hostname\nuptime"
      end
    end
  end
  describe "with no commands defined" do
    YAML.stub(:load_file, {"commands" => nil}) do
      it "must list no commands" do
        get '/commands'
        last_response.body.must_equal ""
      end
    end
  end
end
