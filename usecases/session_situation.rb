require_relative '../models/session'

module Pomodoro
  module Policy
    module SessionSituation
      def during_session
        not @actual_session.nil? and not @actual_session.completed?
      end

      def during_pomodoro
        during_session and @actual_session.is_pomodoro?
      end

      def during_break
        during_session and @actual_session.is_break?
      end
      
      def spawn_new_pomodoro
        @actual_session = Pomodoro::Session.new(25)
      end

      def spawn_new_break
        @actual_session = Pomodoro::Session.new(5, true)
      end
    end
  end
end
