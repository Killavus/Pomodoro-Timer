require 'aquarium'

module Endpoints
  refine Class do
    def endpoint(name)
      self.class_eval "def #{name.to_s}(*args); end"
    end

    def endpoints(*names)
      names.each { |name| endpoint(name) }
    end
  end
end

module GlueHelpers
  def aop_after(object, method, advice)
    after object: object, method: method do |jp, obj, *args|
      advice.call(*args)
    end
  end
end
