require 'eventmachine'
require 'em-promise'

module CheekyPi
  module Animation

    class Base

      TICKRATE = 0.033

      def initialize(duration, light, options={})
        @duration = duration
        @light = light

        @deferred = EventMachine::Q.defer
        promise.then { handle_complete }

        start
      end

      def handle_complete
      end

      def promise
        @promise ||= @deferred.promise
      end

      def start
        @timer.cancel if @timer
        @start_time = Time.now.to_f
        @timer = EventMachine.add_periodic_timer(TICKRATE) { tick }

        self
      end

      def percent
        return 0 if @duration.nil?
        (Time.now.to_f - @start_time) / @duration
      end

      def safe_percent
        [percent, 1].min
      end

      def halt
        @timer.cancel
        @deferred.reject

        self
      end

      def complete
        @timer.cancel
        @deferred.resolve

        self
      end

      def tick
        complete if percent >=1
        animate
      end

      def animate
      end

      #convert [0-0.5-1] to [0-1-0]
      def triangle(percent)
        (0.5 - (percent % 1 - 0.5).abs) * 2
      end

      def sine(percent)
        Math::sin(percent *  2 * Math::PI - 0.5 * Math::PI) * 0.5 + 0.5
      end
    end
  end
end
