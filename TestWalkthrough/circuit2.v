// Main module
module circuit2(N1, N2, N3, N4, N5);

  input N1, N2, N3, N4;
  output N5;
  wire N6, N7;

  or ginst1 (N5, N6, N7);
  and ginst2 (N6, N1, N2);
  or ginst3 (N7, N3, N4);

endmodule
