require 'rubygems'
require 'pp'
GLOBAL_BINDING = binding

def l(filename)
  if f = File.read(filename)
    GLOBAL_BINDING.eval(f)
    return true
  end
  return false
end
