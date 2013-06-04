require 'rspec'
require_relative '../../models/session'

module Pomodoro
  describe Session do
    it 'initializes itself with proper value' do
      session = Session.new(25)

      session.to_s.should eq "25:00"
    end

    it 'advances in time' do
      session = Session.new(4)
      session.advance
      session.to_s.should eq "03:59"
    end

    it 'is completed when time ends' do
      session = Session.new(1)
      60.times { session.advance }
      session.completed?.should eq true
    end

    it 'verifies correctly break' do
      session = Session.new(1, true)

      session.is_break?.should eq true
      session.is_pomodoro?.should eq false
    end

    it 'verifies correctly pomodoro' do
      session = Session.new(1, false)
      session.is_break?.should eq false
      session.is_pomodoro?.should eq true
    end
  end
end  
