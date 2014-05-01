require 'fiddle'

module FFI
  module Library
    def ffi_lib *libs
      libs.each { |lib| Fiddle.dlopen lib }
    end

    def attach_function name, arg_types, return_type
      f = Fiddle::Function.new(
        Fiddle::Handle[name.to_s],
        arg_types.map { |x| Fiddle.const_get(:"TYPE_#{x}".upcase) },
        Fiddle.const_get(:"TYPE_#{return_type}".upcase)
      )

      define_singleton_method(name) do |*args|
        f.call(*args)
      end
    end
  end
end

class MyLibrary
  extend FFI::Library

  ffi_lib '/usr/lib/libm.dylib'
  attach_function :sin, [:double], :double
end

p MyLibrary.sin(90 * Math::PI / 180)
