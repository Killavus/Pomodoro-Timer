require_relative '../lib/helpers'

module Pomodoro
  module Adapter
    using Endpoints

    class Timer
      endpoints :tick
                 
      def initialize
        Thread.new do
          loop do
            sleep 1
            tick
          end
        end
      end

    end
  end
end

