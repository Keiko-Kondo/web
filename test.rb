require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/',WEBrick::HTTPServlet::ERBHandler,'kadai.html.erb')
server.mount('/goya01.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya01.rb')
server.mount('/goya02.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya02.rb')
server.start
