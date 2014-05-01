module: dylan-user

define library fiddle
  use dylan;
  use io;         // needed for fiddle-runtime
  use c-ffi;      // needed for fiddle-wrapper
end library;

define module fiddle
  use dylan;
  use format-out; // needed for fiddle-runtime
  use c-ffi;      // needed for fiddle-wrapper
end module;
