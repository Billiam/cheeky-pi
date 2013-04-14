module CheekyPi
  class Color < Struct.new(:r, :g, :b)

    # Lighten color by percent
    def lighten(percent)
      blend(self.class.create(COLOR[:white]), percent)
    end

    # Darken a color by a percent
    def darken(percent)
      blend(self.class.create(COLOR[:off]), percent)
    end

    # Returns color distance (maximum of rgb distances individually) from a target color
    def distance(color)
      [(self.r - color.r).abs, (self.g - color.g).abs, (self.b - color.b).abs].max
    end

    # Blend with another color
    def blend(color, opacity)
      self.class.new(
        self.r * (1 - opacity) + color.r * opacity,
        self.g * (1 - opacity) + color.g * opacity,
        self.b * (1 - opacity) + color.b * opacity
      )
    end

    # Create a new color from [r,g,b] array
    def self.create(rgb)
      new *rgb
    end
  end
end

