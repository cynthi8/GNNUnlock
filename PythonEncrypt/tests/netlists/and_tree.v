// Main module
module and_tree(N1, N2, N3, N4, N5, N6, N7, N8, N9);

  input N1, N2, N3, N4, N5, N6, N7, N8;
  output N9;
  wire N10, N11, N12, N13, N14, N15;

  and ginst1 (N10, N1, N2);
  and ginst2 (N11, N3, N4);
  and ginst3 (N12, N5, N6);
  and ginst4 (N13, N7, N8);
  and ginst5 (N14, N10, N11);
  and ginst6 (N15, N12, N13);
  and ginst7 (N9, N14, N15);

endmodule
