require 'yaml'
require 'socket'
require 'observer'
require 'thread'
require 'rubygems'

require 'lib/client'
require 'lib/chat'



config = YAML.load_file("config/config.yaml")
Thread.abort_on_exception = config['debug']

puts "Starting the server..."
server = TCPServer.new(config['port'])
chat = Chat.new()
threads = []

while (session = server.accept)
	#log connection and address
	threads << Thread.new(session) { |s|
			puts "Accepting connection from #{s.addr[2]}."
			c = Client.new(s,chat)
			Thread.current['client'] = c
			c.start
			s.close
		}
end