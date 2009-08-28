#Rooms have:
# A room ID
# A room name
# A Room type
# 4 simple exits (n,e,s,w)

class Room
	attr_reader :room_id, :room_type, :room_name, :north_exit, :east_exit, :south_exit, :west_exit

	def initialize(properties)
		
		@room_id = properties['room-id']
		@room_type = properties['type']
		@room_name = properties['name']
		@north_exit = properties['north-exit']
		@east_exit = properties['east-exit']
		@south_exit = properties['south-exit']
		@west_exit = properties['west-exit']
	end
end