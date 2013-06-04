module Pomodoro
  class SessionHistory
    def initialize
      @pomodoros = []
      @breaks = []
    end

    def whole_count
      pomodoros_count + breaks_count
    end

    def pomodoros_count
      @pomodoros.length
    end

    def breaks_count
      @breaks.length
    end

    def register(session)
      return false unless session.completed?

      @pomodoros << session if session.is_pomodoro?
      @breaks << session if session.is_break?

      return true
    end
  end
end
