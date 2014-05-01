module: fiddle

define function main ()
  let four-plus-four = adder(4, 4);
  let size-of-abcd = string-size("abcd");
  let twelve-plus-four = adder(12, size-of-abcd);

  format-out("4 + 4 = %d", four-plus-four);
  format-out("12 + 4 = %d", twelve-plus-four);
end;

main();
