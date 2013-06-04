require 'Qt'

module Pomodoro
  module Component
    class MainWindow < Qt::Widget
      def initialize
        super
        
        @layout = Qt::QVBoxLayout.new
      end
    end
  end
end
