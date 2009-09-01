class World
	
	attr_reader :areas
	
	def initialize
		@areas = Array.new
		load_areas
	end

	def get_room_by_number(roomid)
		@areas.each do |a|
			if a.has_room_number?(roomid)
				return a.get_room_by_number(roomid)
			end
		end
		false
	end
		
	def load_areas
		areas = Dir.entries("areas")
		areas.delete("..")
		areas.delete(".")
		areas.each do |a|
			area = YAML.load_file("areas/#{a.to_s}")
			@areas << Area.new(area)
		end
		
		
	end
end