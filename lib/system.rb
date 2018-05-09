module System
  autoload :Security, 'system/security'
  autoload :Cache, 'system/cache'
end

# Currently unused
#class Symbol
#  def with(*args, &block)
#    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
#  end
#end

class Hash
  def hmap(&block)
    Hash[self.map {|k, v| block.call(k,v) }]
  end

  def hmap!(&block)
    self.keys.each do |key|
      hash = block.call(key, self[key])

      self[hash.keys.first] = hash[hash.keys.first]
      self.delete(key)
    end
    self
  end
  
end