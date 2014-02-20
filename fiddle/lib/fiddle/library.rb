require 'fiddle'

# https://gist.github.com/tenderlove/461700
module Fiddle
  module Library
    def ffi_lib *libs
      @handles ||= {}
      libs.each do |lib|
        basename = File.basename(lib)
        extname = File.extname(lib)
        short = basename.gsub(extname, "")
        @handles[short.to_sym] = Fiddle.dlopen(lib)
      end
    end

    def attach_function lib, name, args, return_type
      args.map! { |arg| arg = Fiddle.const_get(:"TYPE_#{arg}".upcase) }

      value = Fiddle.const_get(:"TYPE_#{return_type}".upcase)

      f = Fiddle::Function.new(@handles[lib][name.to_s], args, value)

      define_singleton_method(name) do |*args|
        f.call(*args)
      end
    end
  end
end
