require_relative '../lib/helpers'

module Pomodoro
  module Glue
    class Timer
      include Aquarium::DSL
      include GlueHelpers

      def initialize(usecase, timer)
        @usecase = usecase
        @timer = timer

        inject!
      end
      private
      def inject!
        puts "Injected glue"
        _after @timer, :tick, @usecase.method(:second_elapsed) 
      end
    end
  end
end
