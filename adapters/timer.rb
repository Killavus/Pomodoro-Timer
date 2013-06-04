require 'eventmachine'

module Pomodoro
  module Adapter
    class Timer
      def initialize
        Thread.new do
          EM.run do
            EM.add_periodic_timer(1) { tick }
          end
        end
      end

      def tick; end
    end
  end
end

