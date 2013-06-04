module Endpoints
  refine Class do
    def endpoint(name)
      self.class_eval "def #{name.to_sym}(*args); end"
    end
  end
end
