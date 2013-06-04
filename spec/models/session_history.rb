require 'rspec'
require_relative '../../models/session'
require_relative '../../models/session_history'

module Pomodoro
  describe SessionHistory do
    before { @history = SessionHistory.new }

    it 'registers only completed sessions' do
      incomplete_session = Session.new(1)
      complete_session = Session.new(1)

      42.times { incomplete_session.advance }
      60.times { complete_session.advance }

      @history.register(incomplete_session).should eq false
      @history.register(complete_session).should eq true

      @history.whole_count.should eq 1
    end

    it 'shows number of completed sessions' do
      break_s = Session.new(1, true)
      pomodoro_s1 = Session.new(1)
      pomodoro_s2 = Session.new(1)

      60.times {
        [break_s, pomodoro_s1, pomodoro_s2].each { |o| o.advance }
      }

      @history.register break_s
      @history.register pomodoro_s1
      @history.register pomodoro_s2

      @history.pomodoros_count.should eq 2
      @history.breaks_count.should eq 1
      @history.whole_count.should eq 3
    end
  end
end
