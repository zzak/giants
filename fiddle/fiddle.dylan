module: fiddle

/*
 * Takes two integers and returns the sum of both values.
 */
define function adder (a :: <integer>, b :: <integer>) => (c :: <integer>)
  a + b
end;

/*
 * Makes a Dylan function callable from C by describing a C contract for the
 * function.
 */
define c-callable-wrapper of adder
  parameter a :: <C-int>;
  parameter b :: <C-int>;
  result c :: <C-int>;
  c-name: "adder";
end;

/*
 * Returns the size of a given string.
 */
define function string-size (s :: <string>) => (size :: <integer>)
  s.size
end;

/*
 * A C-friendly wrapper for the string-size function.
 */
define c-callable-wrapper of string-size
  parameter s :: <C-string>;
  result size :: <C-int>;
  c-name: "string_size";
end;
