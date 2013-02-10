require 'sinatra'

before do
  response.headers["Access-Control-Allow-Origin"] = "*"
end

get '/' do
  if (request.accept.include? 'text/html')
    File.read './public/rest-browser.html'
  else
    pass
  end
end

get '/' do
  """
    <things>
      <thing href=\"one\" />
      <thing href=\"two\" />
    </things>
  """
end

get '/one' do
  """
    <thing id=\"one\" things=\"../\" />
  """
end

get '/two' do
  """
    <thing id=\"two\" things=\"../\" />
  """
end

options '/*' do
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With"
  "sure, go ahead"
end

run Sinatra::Application