require 'Qt'
require_relative 'lib/helpers'
require_relative 'components/main_window'

using Endpoints

module Pomodoro
  class Gui
    endpoints :action_clicked

    attr_reader :app, 
                :main

    def initialize(app)
      @app = app
      @main = Component::MainWindow.new(self)
    end

    def start!
      spawn_main_window
    end

    def spawn_main_window
      @main.show
    end
  end
end
