require_relative 'session_situations'
require_relative '../models/session'
require_relative '../models/session_history'

module Pomodoro
  module Usecase
    class Main 
      include Policy::SessionSituation
      
      def initialize
        @sessions = SessionHistory.new
        @actual_session = nil
      end

      def second_elapsed
        if during_session
          @actual_session.advance
          user_ended_session(@actual_session) if @actual_session.completed?
        end
      end

      def user_wants_break
        spawn_new_break
      end

      def user_clicks_button
        if during_session
          interrupt_session  
        else
          spawn_new_pomodoro
        end
      end

      def user_ended_session(session)
        @actual_session = nil
        @sessions.register session
      end
    end
  end
end
