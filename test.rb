#!/usr/bin/env ruby

require 'benchmark'
require 'active_support'
require 'fast_jsonapi'
def profile_json(num = 10)
  data = Hash.new
  key = 'aaa'
  1000.times { data[key.succ!] = data.keys }
  times = num.times.map do
    1000 * Benchmark.realtime {data.to_json }
  end
  times.reduce(:+)/num.to_f
end

#require 'json'
#puts "'json/pure' -> #{profile_json} ms"

#require 'json/ext'
#puts "'json/ext' -> #{profile_json} ms"

#require 'oj'
#puts "'oj' -> #{profile_json} ms"


puts "'fjson' -> #{profile_json} ms"


def profile_json1(num = 10)

    data = []
    1000.times { data.push(System::Models::ApiKey.first) }
    times = num.times.map do
      1000 * Benchmark.realtime { JSON.generate( data.reduce([]){|arr, (item)| arr.push(item.as_json)} ) }
    end
    
    times.reduce(:+)/num.to_f
  end

  def profile_json2(num = 10)

    data = []
    1000.times { data.push(System::Models::ApiKey.first) }
    times = num.times.map do
      1000 * Benchmark.realtime { data.map(&:as_json) }
    end
    
    times.reduce(:+)/num.to_f
  end

 #maybe the best method
  def profile_json2a(num = 10)

    data = []
    1000.times { data.push(System::Models::ApiKey.first) }
    times = num.times.map do
      1000 * Benchmark.realtime { data.map!{|item| item = item.as_json} }
    end
    
    times.reduce(:+)/num.to_f
  end

  def profile_json3(num = 10)

    data = []
    1000.times { data.push(System::Models::ApiKey.first) }
    times = num.times.map do
      1000 * Benchmark.realtime { data.to_json }
    end
    
    times.reduce(:+)/num.to_f
  end


  def profile_toa(num = 10)

    times = num.times.map do
      Benchmark.realtime {System::Models::ApiKey.all.to_a} 
    end
    
    times.reduce(:+)/num.to_f
  end


  def profile_json(num=1,limit=100)
    data = Order.limit(limit).all
    ep = ''
    times = num.times.map do
        Benchmark.realtime {ep = JSON.generate(data.to_a.map!{|item| item = item.attributes.merge({items: item.items.to_a.map!{|a| a = a.attributes}  }) })} 
      end

      times.reduce(:+)/num.to_f
  end


  def profile_json2(num=1,limit=100)
    data = Order.limit(limit).all

    times = num.times.map do
        Benchmark.realtime { data.to_a.map!{|item| item = item.detailed_json}} 
      end
      
      times.reduce(:+)/num.to_f
  end