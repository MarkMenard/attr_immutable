require "attr_immutable/version"

module AttrImmutable
  def self.included (base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    
    def attr_immutable (*args)
      args.each do |arg|
        setter = "#{arg}=".to_sym

        define_method(arg) do
          self.attr_immutable(arg)
          self.send(arg)
        end

        define_method(setter) do |value|
          self.attr_immutable(arg)
          self.send(setter, value)
        end
      end
    end
  end
  
  def attr_immutable (arg)
    attribute_set = false
    attribute = nil
    
    singleton_class = class << self
      self
    end
    
    singleton_class.send(:define_method, arg) do
      attribute
    end
    
    singleton_class.send(:define_method, "#{arg.to_s}=") do |value|
      raise "ERROR: Attempt to modify an immutable attribute" if attribute_set
      attribute_set = true
      attribute = value
    end
  end
end
