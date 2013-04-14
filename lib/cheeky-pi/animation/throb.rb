require 'cheeky-pi/animation/cycle'

module CheekyPi
  module Animation
    class Throb < Cycle

      def initialize(duration, light, options={})
        super

        @to = options[:to]
        @from = options[:from]
        @wave = options[:type] || :triangle
      end


      def animate
        blend_percent = send(@wave, cycle_percent)
        @light.set(@from.blend(@to, blend_percent))
      end
    end
  end
end