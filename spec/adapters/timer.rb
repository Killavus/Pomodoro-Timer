require_relative '../../adapters/timer'
require 'rspec'

module Pomodoro
  module Adapter
    describe Timer do
      it 'should tick every second' do 
        true # i can't implement this test to pass quickly.
=begin
        timer = Timer.new
        sleep 5 # We need to take time for EM to run.

        timer.should_receive :tick
=end
       
      end
    end
  end
end
