class Area
	
	def initialize(area_file)
		@areaname = area_file['areaname']
		@rooms = Hash.new
		set_rooms(area_file['rooms'])
	end
	
	def set_rooms(roomhash)
		
		roomhash.each do |key, value|
			@rooms[key['room-id']] = Room.new(key)
		end
	end
	
	def has_room_number?(roomid)
		@rooms.has_key?(roomid)	
	end
	
	def get_room_by_number(roomid)
		@rooms[roomid]
	end
end