Ruby Grid Based Creation/Display
--------------------------------

This uses the basic concept of a Cell class.

  def initialize(user_width, user_height)

		@max_width_x = user_width - 1
		@max_height_y = user_height - 1

		create_board()
	end

	# Create the board
	def create_board()

		# Create a board 
		@rows = Array.new(@max_height_y)
		(0..@max_height_y).each do |y|

			@rows[y] = Array.new(@max_width_x)

			(0..@max_width_x).each do |x|

				cells = @rows[y]
				cells[x] = Cell.new(x, y, Cell::DEAD)
			end
		end
	end

	# Display the board
	def display()

		text = ""
		@rows.each do |y|
			text += "Row: "
			y.each do |c|
				if DEBUG
					text += " [#{c.x + 1},#{c.y + 1} #{c.status_color}]"
				else
					text += "#{c.status_color}"
				end
			end
			text += "\n"
		end
		return "#{text}\n" 
	end
