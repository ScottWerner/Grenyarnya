class Client
	attr_reader :s
	
	def initialize(session, chat)
		@s = session
		@username = nil
		@chat = chat
		@online = true
	end
	
    def start
    	login
    	@s.puts "Hi! #{@username}, welcome to the chat."
		@chat.add_user(self, @username)
		while @online
			begin
				mess = @s.gets.chomp
			rescue NoMethodError
				disconnect
				return false
			end
			@chat.send_message(mess, @username)
			puts mess
		end
		@chat.remove_user(username)
	end
	
	def disconnect
		@chat.remove_user(@username)
	end
	
	def login
		@s.puts "<login>"
		tempname = @s.gets.chomp
		while @chat.taken?(tempname)
			tempname = @s.gets.chomp
		end
		@username = tempname
		@s.puts "</login>"
		
	end
	
    def send_chat(message)
		@s.puts message
	end
		
end
	