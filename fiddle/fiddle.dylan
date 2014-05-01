module: fiddle

/*
 * Takes two integers and returns the sum of both values.
 */
define function adder (a :: <integer>, b :: <integer>) => (c :: <integer>)
  a + b
end;

/*
 * Returns the size of a given string.
 */
define function string-size (s :: <string>) => (size :: <integer>)
  s.size
end;
