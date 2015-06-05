require 'ffi'
require 'benchmark'

module Hello
  extend FFI::Library
  ffi_lib 'target/release/libembed.so'
  attach_function :process, [], :void
end

class World
  def initialize 
    @x = 0
    0..100_000_001.times { @x += 1 }
  end
end

Benchmark.bm do |proc|
  proc.report("Rust:") { Hello.process }
  proc.report("Ruby:") { World.new }
end

