module RestPki
  class Color
    attr_reader :alpha, :red, :green, :blue

    def initialize(red, green, blue, alpha = 100)
      @alpha = alpha
      @red = red
      @green = green
      @blue = blue
    end

    def self.from_rgb_string(rgb_string, alpha = 100)
      if rgb_string.length < 6 or rgb_string.length > 7
        raise 'Invalid argument'
      end
      
      index = 0
      if rgb_string[0] == '#'
        index += 1
      end

      red = "0x0000#{rgb_string[index..index+1]}".to_i(16)
      green = "0x0000#{rgb_string[index+2..index+3]}".to_i(16)
      blue = "0x0000#{rgb_string[index+4..index+5]}".to_i(16)
      Color.new(red, green, blue, alpha)
    end

    def to_model
      {
          alpha: @alpha,
          red: @blue,
          green: @green,
          blue: @blue,
      }
    end
  end
end