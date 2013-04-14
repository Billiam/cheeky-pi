require 'cheeky-pi/animation/base'

module CheekyPi
  module Animation
    class Cycle < Base

      def initialize(duration, light, options={})
        super

        @to = options[:to]
        @from = options[:from]
        @period = options[:period]
      end

      def cycle_percent
        ((Time.now.to_f - @start_time) % @period) / @period
      end
    end
  end
end