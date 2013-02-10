require 'sinatra'

rest_browser_html = File.read('./public/rest-browser.html').to_s

get '/' do
  if (request.accept.include? 'text/html')
    rest_browser_html
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

before do
  response.headers["Access-Control-Allow-Origin"] = "*"
end

options '/*' do
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With"
  "sure, go ahead"
end

run Sinatra::Application