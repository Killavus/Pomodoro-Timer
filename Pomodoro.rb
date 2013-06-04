#!which ruby

require 'gui'
Dir[File.dirname(__FILE__) + "/usecases/*.rb"].each { |usecase| require usecase }
Dir[File.dirname(__FILE__) + "/aspects/*.rb"].each { |aspect| require aspect }
Dir[File.dirname(__FILE__) + "/adapters/*.rb"].each { |adapter| require adapter }

module Pomodoro
  class Application
    def run!
      load_usecases
      load_gui
    end

    private
    def load_usecases
      @main = Usecase::Main.new
    end

    def load_gui
      @gui = GUI.new
    end
  end
end

if __FILE__ == $0
  app = Pomodoro::Application.new
  app.run!
end

