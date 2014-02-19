$:.push File.expand_path("../lib", __FILE__)
require 'fiddle/library'

module Dylan
  extend Fiddle::Library

  ffi_lib "_build/lib/libdylan.dylib",
    "_build/lib/libcommon-dylan.dylib",
    "_build/lib/libc-ffi.dylib",
    "_build/lib/libfiddle.dylib"

  attach_function :libfiddle, :string_size, [:void], :int
  attach_function :libfiddle, :adder, [:int, :int], :int
end

puts "4 + 4 = #{Dylan.adder(4, 4)}"
puts "12 + 4 = #{Dylan.adder(12, Dylan.string_size("abcd"))}"


