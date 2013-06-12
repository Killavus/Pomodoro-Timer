require_relative '../lib/helpers'
require 'Qt'

using Endpoints

module Pomodoro
  module Adapter
    class Timer < Qt::Object
      slots 'tick()'
      endpoints :tick
                 
      def initialize
        super()
        @timer = Qt::Timer.new(self)
        @timer.start(1000)

        connect(@timer, SIGNAL('timeout()'), self, SLOT('tick()'))
      end
    end
  end
end

