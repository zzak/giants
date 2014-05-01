module: fiddle

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
 * A C-friendly wrapper for the string-size function.
 */
define c-callable-wrapper of string-size
  parameter s :: <C-string>;
  result size :: <C-int>;
  c-name: "string_size";
end;
