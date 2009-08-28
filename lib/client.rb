class Client
	attr_reader :s
	
	def initialize(session, chat, world)
		@s = session
		@username = nil
		@chat = chat
		@online = true
		@world = world
		@current_room = 0
	end
	
    def start
    	login
    	load_room(@current_room)
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
		end
		@chat.remove_user(username)
	end
	
	def disconnect
		@chat.remove_user(@username)
		@online = false
	end
	
	def login
		@s.puts "<login>"
		begin
			tempname = @s.gets.chomp
		rescue NoMethodError
			disconnect
			return false
		end
			
		while @chat.taken?(tempname)
			begin
				tempname = @s.gets.chomp
			rescue NoMethodError
				disconnect
				return false
			end
		end
		@username = tempname
		@s.puts "</login>"
		
	end
	
    def send_chat(message)
		@s.puts message
	end
	
	def load_room(room_id)
		currentroom = @world.get_room_by_number(room_id)
		@s.puts "<room>"
		@s.puts currentroom.room_id
		@s.puts currentroom.room_name
		@s.puts currentroom.room_type
		@s.puts currentroom.north_exit
		@s.puts currentroom.east_exit
		@s.puts currentroom.south_exit
		@s.puts currentroom.west_exit
		@s.puts "</room>"
	end
		
end
	