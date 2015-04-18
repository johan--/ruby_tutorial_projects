require 'ruby-processing'
class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
  end

  def draw
    r = rand(20)
    stroke_weight r
    offset = r * 10
    line mouse_x, 0, mouse_y + offset, height
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
