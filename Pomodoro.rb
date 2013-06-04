#!which ruby

Dir[File.dirname(__FILE__) + "/usecases/*.rb"].each { |usecase| require usecase }
Dir[File.dirname(__FILE__) + "/aspects/*.rb"].each { |aspect| require aspect }
Dir[File.dirname(__FILE__) + "/adapters/*.rb"].each { |adapter| require adapter }
Dir[File.dirname(__FILE__) + "/components/*.rb"].each { |component| require component }

module Pomodoro
  class Application
    def run!
      load_usecases
    end

    private
    def load_usecases
      app = Qt::Application.new(ARGV)
      @main = Component::MainWindow.new

      @main.show
      app.exec
    end

    def load_gui
    end
  end
end

if __FILE__ == $0
  app = Pomodoro::Application.new
  app.run!
end

