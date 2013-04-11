module CheekyPi
  class Light

    # Initialize with a path and optional color
    def initialize(path, color=nil)
      @path = path

      @r = "#{@path}/red"
      @g = "#{@path}/green"
      @b = "#{@path}/blue"

      set color unless color.nil?
    end

    def from_sym(name)
      set Color.create(COLOR[name])
    end

    def lighten (percent)
      return unless @last_color
      set @last_color.lighten(percent)
    end

    def darken (percent)
      return unless @last_color
      set @last_color.darken(percent)
    end

    # Set light to a given color
    def set(color)

      @last_color = color

      IO.write(@r, color.r)
      IO.write(@g, color.g)
      IO.write(@b, color.b)
    end
  end
end
