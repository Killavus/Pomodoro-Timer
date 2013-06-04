#!which ruby

require_relative 'gui'
Dir[File.dirname(__FILE__) + "/usecases/*.rb"].each { |usecase| require usecase }
Dir[File.dirname(__FILE__) + "/aspects/*.rb"].each { |aspect| require aspect }
Dir[File.dirname(__FILE__) + "/adapters/*.rb"].each { |adapter| require adapter }
Dir[File.dirname(__FILE__) + "/components/*.rb"].each { |component| require component }

module Pomodoro
  class Application
    def run!
      load_usecases
      load_gui
      load_adapters
    end

    private
    def load_usecases
      @main_usecase = Usecase::Main.new
    end

    def load_gui
      @gui = Gui.new(ARGV)

      @gui.start!
    end

    def load_adapters
      @timer = Adapter::Timer.new
    end
  end
end

if __FILE__ == $0
  app = Pomodoro::Application.new
  app.run!
end

