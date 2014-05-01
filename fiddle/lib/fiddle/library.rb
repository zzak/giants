require 'fiddle'

# https://gist.github.com/tenderlove/461700
module Fiddle
  module Library
    # Loads each library from +libraries+ into memory.
    def ffi_lib *libraries
      @handles ||= {}
      Dir[*libraries].each do |library|
        basename = File.basename(library)
        extname = File.extname(library)
        shortname = basename.gsub(extname, "")
        @handles[shortname.to_sym] = Fiddle.dlopen(library)
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
