module: fiddle

define function adder (a :: <integer>, b :: <integer>) => (c :: <integer>)
  a + b
end;

define c-callable-wrapper of adder
  parameter a :: <C-int>;
  parameter b :: <C-int>;
  result c :: <C-int>;
  c-name: "adder";
end;

define function string-size (s :: <string>) => (size :: <integer>)
  s.size
end;

define c-callable-wrapper of string-size
  parameter s :: <C-string>;
  result size :: <C-int>;
  c-name: "string_size";
end;
