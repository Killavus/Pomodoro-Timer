#!which ruby

module Pomodoro
  class Session
    def initialize(mins = 25)
      @minutes = mins
      @seconds = 0
    end

    def advance
      return if completed?
      @minutes -= 1 if @seconds == 0
      @seconds = ((@seconds - 1) + 60) % 60
    end

    def completed?
      @minutes == 0 and @seconds == 0
    end

    def to_s
      "%02d:%02d" % [@minutes, @seconds]
    end
  end
end
