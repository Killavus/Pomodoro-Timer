require_relative '../lib/helpers'

using Endpoints

module Pomodoro
  module Adapter
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

