require 'Qt'

module Pomodoro
  class Gui
    def initialize(args)
      @app = Qt::Application.new(args)
    end

    def start!
      @app.exec
    end
  end
end
