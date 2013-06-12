require_relative 'session_situation'
require_relative '../models/session_history'
require_relative '../lib/helpers'

using Endpoints

module Pomodoro
  module Usecase
    class Main 
      include Policy::SessionSituation

      endpoints :user_started_session, :session_updates
      
      def initialize
        @sessions = Pomodoro::SessionHistory.new
        @actual_session = nil
      end

      def second_elapsed
        if during_session
          @actual_session.advance
          user_ended_session(@actual_session) if @actual_session.completed?
          session_updates(@actual_session)
        end
      end

      def user_wants_break; spawn_new_break; end
      def user_skips_break; spawn_new_pomodoro; end
      def user_interrupts_session; @actual_session = nil; end

      def user_clicks_button
        if during_session
          user_interrupts_session
        else
          spawn_new_pomodoro
          user_started_session(@actual_session)
        end
      end

      def user_ended_session(session)
        @actual_session = nil
        @sessions.register session
      end
    end
  end
end
