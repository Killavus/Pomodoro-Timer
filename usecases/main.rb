require_relative 'session_situations'
require_relative '../models/session'
require_relative '../models/session_history'
require_relative '../lib/helpers'

module Pomodoro
  module Usecase
    using Endpoints

    class Main 
      include Policy::SessionSituation
      endpoints :user_started_session, :user_interrupted_session
      
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

      def user_wants_break; spawn_new_break; end
      def user_skips_break; spawn_new_pomodoro; end
      def user_interrupts_session; @actual_session = nil; end

      def user_clicks_button
        if during_session
          user_interrupts_session
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
