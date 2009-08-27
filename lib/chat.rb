class Chat
	def initialize()
		@chatters = Hash.new
	end
	
	def add_user(client, user)
		@chatters[user] = client
	end
	
	def send_message(message, user)
		@chatters.each do |key, value|
			value.send_chat "#{user}: #{message}"
		end
	end
	
	def remove_user(user)
		@chatters.delete(user)
	end
	
	def taken?(testname)
		@chatters.has_key? testname
	end
end