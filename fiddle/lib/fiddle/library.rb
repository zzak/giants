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

    # Attach a function by the +name+ from the given +library+.
    # Pass in the following +arguments+ and the expected +return_type+, both
    # are required.
    def attach_function library, name, arguments, return_type
      arguments.map! { |argument| argument = Fiddle.const_get(:"TYPE_#{argument}".upcase) }
      value = Fiddle.const_get(:"TYPE_#{return_type}".upcase)
      function = Fiddle::Function.new(@handles[library][name.to_s], arguments, value)

      define_singleton_method(name) do |*arguments|
        function.call(*arguments)
      end
    end
  end
end
