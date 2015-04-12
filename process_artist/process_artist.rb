require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    # Do Stuff
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"
    if @queue.nil?
      @queue = ""
    end
    if key != "\n"
      @queue = @queue + key
    else
      warn "Time to run the command: #{@queue}"
      run_command(@queue)
      @queue = ""
    end
  end

  def run_command(command)
    letter = command[0]
    args = command[1..-1].split(",").map(&:to_i)
    puts "Running Command #{letter} : #{args}"
    case letter
    when "b"
      eval("background(#{args[0]},#{args[1]},#{args[2]})")
    else
      puts "Something went wrong"
    end
  end
end

ProcessArtist.new(:width => 800, :height => 800,
                  :title => "ProcessArtist", :full_screen => false)

# http://tutorials.jumpstartlab.com/projects/process_artist.html
#
# Iteration 1: A Brush
#
# draw a shape where we click the mouse
# have a certain shape
# have a color
# have a scalable size
#
# Key Methods
# mouse_pressed - runs once when the mouse button is first pressed down
# mouse_dragged - runs frequently when the mouse is moved while the button is
# pressed
# mouse_released - runs once when the mouse button is released
# mouse_x - the current x-axis position of the mouse
# mouse_y - the current y-axis position of the mouse
#
#
# Iteration 2: Brush Colors, Sizes, and Shape
#
# When your user types f followed by three RGB values (like 0,128,0), change the
# active fill color to the color they entered.
#
# When your user types +, increase the size of the brush by one pixel.
#
# When your user types -, decrease the size of the brush by one pixel.
#
# Let’s allow users to use five different shape brushes. They can switch brushes
# by typing s1 for "shape 1" or s2 for "shape 2".
#
# 1: A circle
# 2: An oval which is twice as wide as it is tall
# 3: An oval which is twice as tall as it is wide
# 4: A square
# 5: A rectangle which is four times as wide as it is tall
# 6: A rectangle which is four times as tall as it is wide
# 7: A plus sign
# 8: A clover shape (four partially overlapping circles)
# 9: A shape you imagine yourself
#
#
# Iteration 3: Erasing
#
# If a user types a c, clear the entire screen using the current background
# color.
#
# If the user types an e, enable the eraser. It works exactly like a brush, but
# instead of drawing with the current fill color, it draws with the background
# color.
#
# If the user types an a, turn on auto-erase. When they use a brush the shapes
# appear only while they’re holding down the mouse. As soon as they let go of
# the mouse, clear the screen.
#
# When they type a again, turn auto-erase off so they can draw normally.
