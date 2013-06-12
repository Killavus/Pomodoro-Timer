require_relative '../lib/helpers'

module Pomodoro
  module Glue
    class Gui
      include Aquarium::DSL
      include GlueHelpers

      def initialize(usecase, gui)
        @usecase = usecase
        @gui = gui

        inject!
      end

      private

      def inject!
        _after @gui, :action_clicked, @usecase.method(:user_clicks_button)
        _after @usecase, :user_interrupts_session, @gui.main.method(:reset)
        _after @usecase, :user_started_session, @gui.main.method(:set_session)
        _after @usecase, :user_ended_session, @gui.main.method(:reset)
        _after @usecase, :session_updates, @gui.main.method(:update)
      end
    end
  end
end

