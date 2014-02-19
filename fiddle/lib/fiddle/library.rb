require 'fiddle'

# https://gist.github.com/tenderlove/461700
module Fiddle
  module Library
    def ffi_lib *libs
      @handles ||= {}
      libs.each { |lib|
        short = File.basename(lib).gsub(File.extname(lib), "")
        @handles[short.to_sym] = Fiddle.dlopen(lib) }
    end

    def attach_function lib, name, arg_types, return_type
      f = Fiddle::Function.new(
        @handles[lib][name.to_s],
        arg_types.map { |x| Fiddle.const_get(:"TYPE_#{x}".upcase) },
        Fiddle.const_get(:"TYPE_#{return_type}".upcase)
      )

      define_singleton_method(name) do |*args|
        f.call(*args)
      end
    end
  end
end
