require 'cheeky-pi/animation/base'

module CheekyPi
  module Animation
    class Fade < Base

      def initialize(duration, light, options={})
        super

        @to = options[:to]
        @from = options[:from]
      end

      def handle_complete
        @light.set @to
      end

      def animate
        @light.set(@from.blend(@to, safe_percent))
      end
    end
  end
end