require 'cheeky-pi/light_interface'
require 'cheeky-pi/color'
require 'cheeky-pi/animation/fade'
require 'cheeky-pi/animation/throb'

module CheekyPi
  class Light
    MAX = 90

    # Initialize with a path and optional color
    def initialize(path)
      @light = LightInterface.new(path)
      @last_color = @light.fetch
    end

    def animation
      @animation
    end

    def animation=(new_animation)
      stop_animation
      @animation = new_animation
    end

    def stop_animation
      self.animation.halt if self.animation
    end

    def building
      start_color = [5, 5, 25]
      end_color = [10, 15, MAX]

      transition!(start_color).then do
        throb!(3, start_color, end_color)
      end
    end

    def failure
      start_color = [30, 0, 0]
      end_color = [MAX, 25, 5]

      transition!(start_color).then do
        throb!(1, start_color, end_color)
      end
    end

    def success
      transition!([0, MAX, 0])
    end

    def off
      transition!(COLOR[:black])
    end

    def throb (period, from, to)
      Animation::Throb.new nil, self, {
        from: Color.create(from),
        to: Color.create(to),
        period: period,
        type: :sine
      }
    end

    def throb! (period, from, to)
      self.animation = throb(period, from, to)

      self.animation.promise
    end


    def transition(to, duration=2)
      to = Color.create(to)

      #Set color transition time based on distance, with a maximum of 2 seconds
      #(number from 0-255)
      distance = @last_color.distance(to)
      seconds = duration * [distance, MAX].max / MAX

      Animation::Fade.new seconds, self, { from: @last_color, to: to }
    end


    def transition!(to)
      self.animation = transition to

      self.animation.promise
    end

    def color
      set Color.create(color)
    end

    # Set light to a given color
    def set(color)
      @last_color = color
      @light.set(color)
    end
  end
end
