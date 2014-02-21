module Decorator
  extend ActiveSupport::Concern

  module ClassMethods
    def initialize(*args)
      self.name[0..self.name.index("Decorator")].new(args)
    end
  end
end