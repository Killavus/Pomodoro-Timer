require_relative '../lib/helpers'

module Pomodoro
  module Glue
    class TimerGlue
      include Aquarium::DSL

      def initialize(usecase, timer)
        @usecase = usecase
        @timer = timer

        inject!
      end
      private
      def inject!

      end
    end
  end
end
