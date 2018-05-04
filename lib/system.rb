module System
  autoload :Security, 'system/security'
  autoload :Cache, 'system/cache'
end

class Symbol
  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end