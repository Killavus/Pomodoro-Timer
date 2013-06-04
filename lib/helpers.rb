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
