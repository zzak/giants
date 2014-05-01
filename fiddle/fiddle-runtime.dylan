module: fiddle

define function main ()
  format-out("4 + 4 = %d", adder(4, 4));
  format-out("12 + 4 = %d", adder(12, string-size("abcd")));
end;

main();
