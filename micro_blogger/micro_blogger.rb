require 'jumpstart_auth'
require 'bitly'
require 'klout'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"

    Bitly.use_api_version_3
    @bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    # puts bitly.shorten('http://jumpstartlab.com/courses/').short_url

    Klout.api_key = 'xu9ztgnacmjx3bu82warbr3h'

    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    @client.update(message)
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    puts message
    message = "d @#{target} #{message}"
    tweet(message)
  end

  def everyones_last_tweet
    friends = @client.friends
    friends.each do |friend|
      # find each friend's last message
      # print each friend's screen_name
      # print each friend's last message
      puts ""  # Just print a blank line to separate people
    end
  end

  def shorten(original_url)
    # Shortening Code
    puts "Shortening this URL: #{original_url}"
  end

  def turl(*parts)
    # turl I wrote this twitter client at: http://jumpstartlab.com
    tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
  end

  def klout_score
    friends = @client.friends.collect{|f| f.screen_name}
    friends.each do |friend|
      # print your friend's screen_name
      # print your friends's Klout score
      puts "" #Print a blank line to separate each friend
    end
  end

  def run
    command = ""
    while command != "q"
      printf "Enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
      when 'q' then puts "Goodbye!"
      when 't' then tweet(parts[1..-1].join(" "))
      when 'dm' then dm(parts[1], parts[2..-1].join(" "))
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
blogger.tweet("MicroBlogger Initialized")
blogger.klout_score

# http://tutorials.jumpstartlab.com/projects/microblogger.html
