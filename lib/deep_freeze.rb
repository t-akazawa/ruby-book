module Kernel
  def deep_freeze(obj)
    obj = obj.map(&:freeze) if obj.class == Array
    obj.freeze
  end
end
