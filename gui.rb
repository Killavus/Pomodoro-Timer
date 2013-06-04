require 'Qt'
require_relative 'lib/helpers'
require_relative 'components/main_window'

using Endpoints

module Pomodoro
  class Gui
    endpoints :action_clicked

    def initialize(args)
      @app = Qt::Application.new(args)
    end

    def start!
      spawn_main_window
      @app.exec
    end

    def spawn_main_window
      @main = Component::MainWindow.new(self)
      @main.show
    end
  end
end
