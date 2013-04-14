require 'cheeky-pi/color'

module CheekyPi
  class LightInterface
    def initialize(path)
      @r = "#{path}/red"
      @g = "#{path}/green"
      @b = "#{path}/blue"
    end

    def fetch
      r = IO.read(@r).to_f
      g = IO.read(@g).to_f
      b = IO.read(@b).to_f

      Color.create [r, g, b]
    end


    def set(color)
      IO.write(@r, color.r.round)
      IO.write(@g, color.g.round)
      IO.write(@b, color.b.round)
    end
  end
end