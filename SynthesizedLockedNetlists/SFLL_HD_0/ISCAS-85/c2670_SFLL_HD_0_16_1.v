/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr  8 02:38:09 2021
/////////////////////////////////////////////////////////////


module c2670_SFLL_HD_0_16_1_top ( N145, N153, N162, N168, N172, N210, N190, 
        N212, N167, N185, N173, N174, N183, N196, N151, N200, N187, N195, N155, 
        N193, N146, N163, N178, N211, N208, N177, N182, N213, N191, N216, N204, 
        N170, N165, N179, N189, N207, N184, N148, N154, N157, N158, N164, N149, 
        N180, N192, N156, N194, N203, N199, N171, N205, N161, N160, N176, N197, 
        N209, N201, N202, N188, N218, N143, N175, N169, N166, N186, N159, N217, 
        N147, N144, N181, N150, N215, N206, N198, N152, N214, N1, N2, N3, N4, 
        N5, N6, N7, N8, N11, N14, N15, N16, N19, N20, N21, N22, N23, N24, N25, 
        N26, N27, N28, N29, N32, N33, N34, N35, N36, N37, N40, N43, N44, N47, 
        N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N60, N61, N62, N63, 
        N64, N65, N66, N67, N68, N69, N72, N73, N74, N75, N76, N77, N78, N79, 
        N80, N81, N82, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, 
        N96, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N111, 
        N112, N113, N114, N115, N116, N117, N118, N119, N120, N123, N124, N125, 
        N126, N127, N128, N129, N130, N131, N132, N135, N136, N137, N138, N139, 
        N140, N141, N142, N219, N224, N227, N230, N231, N234, N237, N241, N246, 
        N253, N256, N259, N262, N263, N266, N269, N272, N275, N278, N281, N284, 
        N287, N290, N294, N297, N301, N305, N309, N313, N316, N319, N322, N325, 
        N328, N331, N334, N337, N340, N343, N346, N349, N352, N355, keyinput0, 
        keyinput1, keyinput2, keyinput3, keyinput4, keyinput5, keyinput6, 
        keyinput7, keyinput8, keyinput9, keyinput10, keyinput11, keyinput12, 
        keyinput13, keyinput14, keyinput15, N2016, N3803, N214_BUFF, N217_BUFF, 
        N160_BUFF, N2496, N2022, N173_BUFF, N3809, N213_BUFF, N190_BUFF, N799, 
        N215_BUFF, N183_BUFF, N164_BUFF, N1269, N3851, N192_BUFF, N218_BUFF, 
        N2925, N188_BUFF, N1726, N148_BUFF, N1448, N159_BUFF, N494, N2644, 
        N1026, N2014, N158_BUFF, N2389, N492, N152_BUFF, N162_BUFF, N167_BUFF, 
        N199_BUFF, N145_BUFF, N144_BUFF, N489, N1816, N1969, N458, N206_BUFF, 
        N1029, N2012, N202_BUFF, N156_BUFF, N210_BUFF, N488, N2018, N3038, 
        N487, N2390, N1970, N208_BUFF, N2643, N401, N490, N197_BUFF, N194_BUFF, 
        N189_BUFF, N491, N155_BUFF, N1028, N151_BUFF, N186_BUFF, N3079, 
        N198_BUFF, N398, N178_BUFF, N212_BUFF, N1818, N203_BUFF, N182_BUFF, 
        N196_BUFF, N419, N143_BUFF, N201_BUFF, N193_BUFF, N187_BUFF, N161_BUFF, 
        N1819, N3882, N170_BUFF, N792, N166_BUFF, N1817, N157_BUFF, N456, 
        N2388, N195_BUFF, N3881, N805, N154_BUFF, N176_BUFF, N169_BUFF, 
        N205_BUFF, N184_BUFF, N179_BUFF, N3804, N146_BUFF, N1820, N200_BUFF, 
        N149_BUFF, N3875, N150_BUFF, N153_BUFF, N204_BUFF, N2387, N400, 
        N191_BUFF, N207_BUFF, N420, N163_BUFF, N2970, N172_BUFF, N180_BUFF, 
        N2971, N2010, N177_BUFF, N209_BUFF, N174_BUFF, N2891, N147_BUFF, 
        N165_BUFF, N457, N185_BUFF, N3671, N211_BUFF, N171_BUFF, N168_BUFF, 
        N2020, N216_BUFF, N1277, N1821, N3546, N175_BUFF, N493, N1971, 
        N181_BUFF );
  input N145, N153, N162, N168, N172, N210, N190, N212, N167, N185, N173, N174,
         N183, N196, N151, N200, N187, N195, N155, N193, N146, N163, N178,
         N211, N208, N177, N182, N213, N191, N216, N204, N170, N165, N179,
         N189, N207, N184, N148, N154, N157, N158, N164, N149, N180, N192,
         N156, N194, N203, N199, N171, N205, N161, N160, N176, N197, N209,
         N201, N202, N188, N218, N143, N175, N169, N166, N186, N159, N217,
         N147, N144, N181, N150, N215, N206, N198, N152, N214, N1, N2, N3, N4,
         N5, N6, N7, N8, N11, N14, N15, N16, N19, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, N29, N32, N33, N34, N35, N36, N37, N40, N43, N44, N47,
         N48, N49, N50, N51, N52, N53, N54, N55, N56, N57, N60, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N72, N73, N74, N75, N76, N77, N78, N79,
         N80, N81, N82, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
         N96, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N123, N124,
         N125, N126, N127, N128, N129, N130, N131, N132, N135, N136, N137,
         N138, N139, N140, N141, N142, N219, N224, N227, N230, N231, N234,
         N237, N241, N246, N253, N256, N259, N262, N263, N266, N269, N272,
         N275, N278, N281, N284, N287, N290, N294, N297, N301, N305, N309,
         N313, N316, N319, N322, N325, N328, N331, N334, N337, N340, N343,
         N346, N349, N352, N355, keyinput0, keyinput1, keyinput2, keyinput3,
         keyinput4, keyinput5, keyinput6, keyinput7, keyinput8, keyinput9,
         keyinput10, keyinput11, keyinput12, keyinput13, keyinput14,
         keyinput15;
  output N2016, N3803, N214_BUFF, N217_BUFF, N160_BUFF, N2496, N2022,
         N173_BUFF, N3809, N213_BUFF, N190_BUFF, N799, N215_BUFF, N183_BUFF,
         N164_BUFF, N1269, N3851, N192_BUFF, N218_BUFF, N2925, N188_BUFF,
         N1726, N148_BUFF, N1448, N159_BUFF, N494, N2644, N1026, N2014,
         N158_BUFF, N2389, N492, N152_BUFF, N162_BUFF, N167_BUFF, N199_BUFF,
         N145_BUFF, N144_BUFF, N489, N1816, N1969, N458, N206_BUFF, N1029,
         N2012, N202_BUFF, N156_BUFF, N210_BUFF, N488, N2018, N3038, N487,
         N2390, N1970, N208_BUFF, N2643, N401, N490, N197_BUFF, N194_BUFF,
         N189_BUFF, N491, N155_BUFF, N1028, N151_BUFF, N186_BUFF, N3079,
         N198_BUFF, N398, N178_BUFF, N212_BUFF, N1818, N203_BUFF, N182_BUFF,
         N196_BUFF, N419, N143_BUFF, N201_BUFF, N193_BUFF, N187_BUFF,
         N161_BUFF, N1819, N3882, N170_BUFF, N792, N166_BUFF, N1817, N157_BUFF,
         N456, N2388, N195_BUFF, N3881, N805, N154_BUFF, N176_BUFF, N169_BUFF,
         N205_BUFF, N184_BUFF, N179_BUFF, N3804, N146_BUFF, N1820, N200_BUFF,
         N149_BUFF, N3875, N150_BUFF, N153_BUFF, N204_BUFF, N2387, N400,
         N191_BUFF, N207_BUFF, N420, N163_BUFF, N2970, N172_BUFF, N180_BUFF,
         N2971, N2010, N177_BUFF, N209_BUFF, N174_BUFF, N2891, N147_BUFF,
         N165_BUFF, N457, N185_BUFF, N3671, N211_BUFF, N171_BUFF, N168_BUFF,
         N2020, N216_BUFF, N1277, N1821, N3546, N175_BUFF, N493, N1971,
         N181_BUFF;
  wire   N3803, N214_BUFF, N217_BUFF, N160_BUFF, N173_BUFF, N213_BUFF,
         N190_BUFF, N215_BUFF, N183_BUFF, N164_BUFF, N192_BUFF, N218_BUFF,
         N188_BUFF, N148_BUFF, N159_BUFF, N158_BUFF, N2389, N152_BUFF,
         N162_BUFF, N167_BUFF, N199_BUFF, N145_BUFF, N144_BUFF, N206_BUFF,
         N202_BUFF, N156_BUFF, N210_BUFF, N208_BUFF, N2643, N197_BUFF,
         N194_BUFF, N189_BUFF, N155_BUFF, N151_BUFF, N186_BUFF, N198_BUFF,
         N398, N178_BUFF, N212_BUFF, N203_BUFF, N182_BUFF, N196_BUFF, N419,
         N143_BUFF, N201_BUFF, N193_BUFF, N187_BUFF, N161_BUFF, N170_BUFF,
         N166_BUFF, N157_BUFF, N456, N195_BUFF, N154_BUFF, N176_BUFF,
         N169_BUFF, N205_BUFF, N184_BUFF, N179_BUFF, N146_BUFF, N200_BUFF,
         N149_BUFF, N150_BUFF, N153_BUFF, N204_BUFF, N2387, N191_BUFF,
         N207_BUFF, N163_BUFF, N172_BUFF, N180_BUFF, N177_BUFF, N209_BUFF,
         N174_BUFF, N147_BUFF, N165_BUFF, N185_BUFF, N211_BUFF, N171_BUFF,
         N168_BUFF, N216_BUFF, N175_BUFF, N181_BUFF, perturb_signal,
         restore_signal, \main/n190 , \main/n189 , \main/n188 , \main/n187 ,
         \main/n186 , \main/n185 , \main/n184 , \main/n183 , \main/n182 ,
         \main/n181 , \main/n180 , \main/n179 , \main/n178 , \main/n177 ,
         \main/n176 , \main/n175 , \main/n174 , \main/n173 , \main/n172 ,
         \main/n171 , \main/n170 , \main/n169 , \main/n168 , \main/n167 ,
         \main/n166 , \main/n165 , \main/n164 , \main/n163 , \main/n162 ,
         \main/n161 , \main/n160 , \main/n159 , \main/n158 , \main/n157 ,
         \main/n156 , \main/n155 , \main/n154 , \main/n153 , \main/n152 ,
         \main/n151 , \main/n150 , \main/n149 , \main/n148 , \main/n147 ,
         \main/n146 , \main/n145 , \main/n144 , \main/n143 , \main/n142 ,
         \main/n141 , \main/n140 , \main/n139 , \main/n138 , \main/n137 ,
         \main/n136 , \main/n135 , \main/n134 , \main/n133 , \main/n132 ,
         \main/n131 , \main/n130 , \main/n129 , \main/n128 , \main/n127 ,
         \main/n126 , \main/n125 , \main/n124 , \main/n123 , \main/n122 ,
         \main/n121 , \main/n120 , \main/n119 , \main/n118 , \main/n117 ,
         \main/n116 , \main/n115 , \main/n114 , \main/n113 , \main/n112 ,
         \main/n111 , \main/n110 , \main/n109 , \main/n108 , \main/n107 ,
         \main/n106 , \main/n105 , \main/n104 , \main/n103 , \main/n102 ,
         \main/n101 , \main/n100 , \main/n99 , \main/n98 , \main/n97 ,
         \main/n96 , \main/n95 , \main/n94 , \main/n93 , \main/n92 ,
         \main/n91 , \main/n90 , \main/n89 , \main/n88 , \main/n87 ,
         \main/n86 , \main/n85 , \main/n84 , \main/n83 , \main/n82 ,
         \main/n81 , \main/n80 , \main/n79 , \main/n78 , \main/n77 ,
         \main/n76 , \main/n75 , \main/n74 , \main/n73 , \main/n72 ,
         \main/n71 , \main/n70 , \main/n69 , \main/n68 , \main/n67 ,
         \main/n66 , \main/n65 , \main/n64 , \main/n63 , \main/n62 ,
         \main/n61 , \main/n60 , \main/n59 , \main/n58 , \main/n57 ,
         \main/n56 , \main/n55 , \main/n54 , \main/n53 , \main/n52 ,
         \main/n51 , \main/n50 , \main/n49 , \main/n48 , \main/n47 ,
         \main/n46 , \main/n45 , \main/n44 , \main/n43 , \main/n42 ,
         \main/n41 , \main/n40 , \main/n39 , \main/n38 , \main/n37 ,
         \main/n36 , \main/n35 , \main/n34 , \main/n33 , \main/n32 ,
         \main/n31 , \main/n30 , \main/n29 , \main/n28 , \main/n27 ,
         \main/n26 , \main/n25 , \main/n24 , \main/n23 , \main/n22 ,
         \main/n21 , \main/n20 , \main/n19 , \main/n18 , \main/n17 ,
         \main/n16 , \main/n15 , \main/n14 , \main/n13 , \main/n12 ,
         \main/n11 , \main/n10 , \main/n9 , \main/n8 , \main/n7 , \main/n6 ,
         \main/n5 , \main/n4 , \main/n3 , \main/n2 , \main/n1 , \perturb/n5 ,
         \perturb/n4 , \perturb/n3 , \perturb/n2 , \perturb/n1 , \restore/n20 ,
         \restore/n19 , \restore/n18 , \restore/n17 , \restore/n16 ,
         \restore/n15 , \restore/n14 , \restore/n13 , \restore/n12 ,
         \restore/n11 , \restore/n10 , \restore/n9 , \restore/n8 ,
         \restore/n7 , \restore/n6 , \restore/n5 , \restore/n4 , \restore/n3 ,
         \restore/n2 , \restore/n1 ;
  assign N3804 = N3803;
  assign N214_BUFF = N214;
  assign N217_BUFF = N217;
  assign N160_BUFF = N160;
  assign N173_BUFF = N173;
  assign N213_BUFF = N213;
  assign N190_BUFF = N190;
  assign N215_BUFF = N215;
  assign N183_BUFF = N183;
  assign N164_BUFF = N164;
  assign N192_BUFF = N192;
  assign N218_BUFF = N218;
  assign N188_BUFF = N188;
  assign N148_BUFF = N148;
  assign N159_BUFF = N159;
  assign N158_BUFF = N158;
  assign N2390 = N2389;
  assign N152_BUFF = N152;
  assign N162_BUFF = N162;
  assign N167_BUFF = N167;
  assign N199_BUFF = N199;
  assign N145_BUFF = N145;
  assign N144_BUFF = N144;
  assign N206_BUFF = N206;
  assign N202_BUFF = N202;
  assign N156_BUFF = N156;
  assign N210_BUFF = N210;
  assign N208_BUFF = N208;
  assign N2644 = N2643;
  assign N197_BUFF = N197;
  assign N194_BUFF = N194;
  assign N189_BUFF = N189;
  assign N155_BUFF = N155;
  assign N151_BUFF = N151;
  assign N186_BUFF = N186;
  assign N198_BUFF = N198;
  assign N400 = N398;
  assign N805 = N398;
  assign N401 = N398;
  assign N398 = N219;
  assign N178_BUFF = N178;
  assign N212_BUFF = N212;
  assign N203_BUFF = N203;
  assign N182_BUFF = N182;
  assign N196_BUFF = N196;
  assign N420 = N419;
  assign N419 = N253;
  assign N143_BUFF = N143;
  assign N201_BUFF = N201;
  assign N193_BUFF = N193;
  assign N187_BUFF = N187;
  assign N161_BUFF = N161;
  assign N170_BUFF = N170;
  assign N166_BUFF = N166;
  assign N157_BUFF = N157;
  assign N457 = N456;
  assign N458 = N456;
  assign N456 = N290;
  assign N195_BUFF = N195;
  assign N154_BUFF = N154;
  assign N176_BUFF = N176;
  assign N169_BUFF = N169;
  assign N205_BUFF = N205;
  assign N184_BUFF = N184;
  assign N179_BUFF = N179;
  assign N146_BUFF = N146;
  assign N200_BUFF = N200;
  assign N149_BUFF = N149;
  assign N3875 = 1'b0;
  assign N150_BUFF = N150;
  assign N153_BUFF = N153;
  assign N204_BUFF = N204;
  assign N2388 = N2387;
  assign N191_BUFF = N191;
  assign N207_BUFF = N207;
  assign N163_BUFF = N163;
  assign N172_BUFF = N172;
  assign N180_BUFF = N180;
  assign N177_BUFF = N177;
  assign N209_BUFF = N209;
  assign N174_BUFF = N174;
  assign N147_BUFF = N147;
  assign N165_BUFF = N165;
  assign N185_BUFF = N185;
  assign N211_BUFF = N211;
  assign N171_BUFF = N171;
  assign N168_BUFF = N168;
  assign N216_BUFF = N216;
  assign N175_BUFF = N175;
  assign N181_BUFF = N181;

  AND2X1 \main/U240  ( .IN1(N94), .IN2(N398), .Q(N1026) );
  NAND2X0 \main/U239  ( .IN1(N7), .IN2(N237), .QN(N1028) );
  INVX0 \main/U238  ( .INP(N1028), .ZN(\main/n190 ) );
  NAND2X0 \main/U237  ( .IN1(N231), .IN2(\main/n190 ), .QN(N1029) );
  NAND4X0 \main/U236  ( .IN1(N132), .IN2(N96), .IN3(N82), .IN4(N44), .QN(
        \main/n178 ) );
  NAND4X0 \main/U235  ( .IN1(N120), .IN2(N108), .IN3(N69), .IN4(N57), .QN(
        \main/n179 ) );
  NOR2X0 \main/U234  ( .IN1(\main/n178 ), .IN2(\main/n179 ), .QN(N1277) );
  NAND2X0 \main/U233  ( .IN1(N325), .IN2(\main/n190 ), .QN(N1269) );
  INVX0 \main/U232  ( .INP(N234), .ZN(\main/n189 ) );
  NOR2X0 \main/U231  ( .IN1(\main/n189 ), .IN2(N227), .QN(\main/n107 ) );
  INVX0 \main/U230  ( .INP(N227), .ZN(\main/n183 ) );
  NOR2X0 \main/U229  ( .IN1(\main/n183 ), .IN2(N234), .QN(\main/n108 ) );
  NOR2X0 \main/U228  ( .IN1(\main/n189 ), .IN2(\main/n183 ), .QN(\main/n110 )
         );
  NOR2X0 \main/U227  ( .IN1(N227), .IN2(N234), .QN(\main/n111 ) );
  AO22X1 \main/U226  ( .IN1(N78), .IN2(\main/n110 ), .IN3(N91), .IN4(
        \main/n111 ), .Q(\main/n188 ) );
  AO221X1 \main/U225  ( .IN1(N65), .IN2(\main/n107 ), .IN3(N53), .IN4(
        \main/n108 ), .IN5(\main/n188 ), .Q(N2010) );
  AO22X1 \main/U224  ( .IN1(N77), .IN2(\main/n110 ), .IN3(N90), .IN4(
        \main/n111 ), .Q(\main/n187 ) );
  AO221X1 \main/U223  ( .IN1(N64), .IN2(\main/n107 ), .IN3(N52), .IN4(
        \main/n108 ), .IN5(\main/n187 ), .Q(N2012) );
  AO22X1 \main/U222  ( .IN1(N76), .IN2(\main/n110 ), .IN3(N89), .IN4(
        \main/n111 ), .Q(\main/n186 ) );
  AO221X1 \main/U221  ( .IN1(N63), .IN2(\main/n107 ), .IN3(N51), .IN4(
        \main/n108 ), .IN5(\main/n186 ), .Q(N2014) );
  AO22X1 \main/U220  ( .IN1(N75), .IN2(\main/n110 ), .IN3(N88), .IN4(
        \main/n111 ), .Q(\main/n185 ) );
  AO221X1 \main/U219  ( .IN1(N62), .IN2(\main/n107 ), .IN3(N50), .IN4(
        \main/n108 ), .IN5(\main/n185 ), .Q(N2016) );
  AO21X1 \main/U218  ( .IN1(N49), .IN2(\main/n108 ), .IN3(\main/n107 ), .Q(
        \main/n184 ) );
  AO221X1 \main/U217  ( .IN1(N87), .IN2(\main/n183 ), .IN3(N74), .IN4(N234), 
        .IN5(\main/n184 ), .Q(N2018) );
  AO22X1 \main/U216  ( .IN1(N73), .IN2(\main/n110 ), .IN3(N86), .IN4(
        \main/n111 ), .Q(\main/n182 ) );
  AO221X1 \main/U215  ( .IN1(N61), .IN2(\main/n107 ), .IN3(N48), .IN4(
        \main/n108 ), .IN5(\main/n182 ), .Q(N2020) );
  AO22X1 \main/U214  ( .IN1(N72), .IN2(\main/n110 ), .IN3(N85), .IN4(
        \main/n111 ), .Q(\main/n181 ) );
  AO221X1 \main/U213  ( .IN1(N60), .IN2(\main/n107 ), .IN3(N47), .IN4(
        \main/n108 ), .IN5(\main/n181 ), .Q(N2022) );
  AO22X1 \main/U212  ( .IN1(N68), .IN2(\main/n110 ), .IN3(N81), .IN4(
        \main/n111 ), .Q(\main/n180 ) );
  AO221X1 \main/U211  ( .IN1(N56), .IN2(\main/n107 ), .IN3(N43), .IN4(
        \main/n108 ), .IN5(\main/n180 ), .Q(\main/n114 ) );
  INVX0 \main/U210  ( .INP(\main/n114 ), .ZN(\main/n82 ) );
  NAND2X0 \main/U209  ( .IN1(N241), .IN2(\main/n82 ), .QN(N1969) );
  AO22X1 \main/U208  ( .IN1(N325), .IN2(\main/n178 ), .IN3(N231), .IN4(
        \main/n179 ), .Q(\main/n5 ) );
  INVX0 \main/U207  ( .INP(\main/n5 ), .ZN(N1726) );
  NAND3X0 \main/U206  ( .IN1(N237), .IN2(N1726), .IN3(N224), .QN(\main/n176 )
         );
  INVX0 \main/U205  ( .INP(\main/n176 ), .ZN(\main/n177 ) );
  NAND2X0 \main/U204  ( .IN1(N36), .IN2(\main/n177 ), .QN(N1970) );
  AO21X1 \main/U203  ( .IN1(N3), .IN2(N1), .IN3(\main/n176 ), .Q(N1971) );
  AO22X1 \main/U202  ( .IN1(N79), .IN2(\main/n110 ), .IN3(N92), .IN4(
        \main/n111 ), .Q(\main/n175 ) );
  AO221X1 \main/U201  ( .IN1(N66), .IN2(\main/n107 ), .IN3(N54), .IN4(
        \main/n108 ), .IN5(\main/n175 ), .Q(\main/n105 ) );
  MUX21X1 \main/U200  ( .IN1(\main/n105 ), .IN2(N2012), .S(N246), .Q(N2387) );
  MUX21X1 \main/U199  ( .IN1(N2010), .IN2(N2014), .S(N246), .Q(N2389) );
  NOR2X0 \main/U198  ( .IN1(N230), .IN2(\main/n105 ), .QN(\main/n102 ) );
  INVX0 \main/U197  ( .INP(\main/n102 ), .ZN(\main/n174 ) );
  INVX0 \main/U196  ( .INP(N241), .ZN(\main/n113 ) );
  AO21X1 \main/U195  ( .IN1(\main/n174 ), .IN2(\main/n113 ), .IN3(\main/n105 ), 
        .Q(N2496) );
  MUX21X1 \main/U194  ( .IN1(\main/n114 ), .IN2(\main/n174 ), .S(N246), .Q(
        N2643) );
  INVX0 \main/U193  ( .INP(N322), .ZN(\main/n173 ) );
  INVX0 \main/U192  ( .INP(N319), .ZN(\main/n172 ) );
  NOR2X0 \main/U191  ( .IN1(\main/n173 ), .IN2(\main/n172 ), .QN(\main/n15 )
         );
  NOR2X0 \main/U190  ( .IN1(\main/n173 ), .IN2(N319), .QN(\main/n16 ) );
  NOR2X0 \main/U189  ( .IN1(\main/n172 ), .IN2(N322), .QN(\main/n18 ) );
  NOR2X0 \main/U188  ( .IN1(N319), .IN2(N322), .QN(\main/n19 ) );
  AO22X1 \main/U187  ( .IN1(N99), .IN2(\main/n18 ), .IN3(N135), .IN4(
        \main/n19 ), .Q(\main/n171 ) );
  AO221X1 \main/U186  ( .IN1(N111), .IN2(\main/n15 ), .IN3(N123), .IN4(
        \main/n16 ), .IN5(\main/n171 ), .Q(\main/n23 ) );
  XOR2X1 \main/U185  ( .IN1(\main/n23 ), .IN2(N313), .Q(\main/n169 ) );
  INVX0 \main/U184  ( .INP(N316), .ZN(\main/n170 ) );
  NAND2X0 \main/U183  ( .IN1(\main/n169 ), .IN2(\main/n170 ), .QN(N2891) );
  XOR2X1 \main/U182  ( .IN1(N6), .IN2(N278), .Q(\main/n165 ) );
  XOR2X1 \main/U181  ( .IN1(N5), .IN2(N266), .Q(\main/n166 ) );
  XOR2X1 \main/U180  ( .IN1(N4), .IN2(N259), .Q(\main/n167 ) );
  XOR2X1 \main/U179  ( .IN1(N281), .IN2(N24), .Q(\main/n168 ) );
  NAND4X0 \main/U178  ( .IN1(\main/n165 ), .IN2(\main/n166 ), .IN3(\main/n167 ), .IN4(\main/n168 ), .QN(\main/n158 ) );
  XOR2X1 \main/U177  ( .IN1(N256), .IN2(N19), .Q(\main/n162 ) );
  INVX0 \main/U176  ( .INP(N269), .ZN(\main/n64 ) );
  XNOR2X1 \main/U175  ( .IN1(\main/n64 ), .IN2(N21), .Q(\main/n163 ) );
  XOR2X1 \main/U174  ( .IN1(N263), .IN2(N20), .Q(\main/n164 ) );
  NAND3X0 \main/U173  ( .IN1(\main/n162 ), .IN2(\main/n163 ), .IN3(\main/n164 ), .QN(\main/n159 ) );
  XNOR2X1 \main/U172  ( .IN1(N272), .IN2(N22), .Q(\main/n160 ) );
  XNOR2X1 \main/U171  ( .IN1(N275), .IN2(N23), .Q(\main/n161 ) );
  NOR4X0 \main/U170  ( .IN1(\main/n158 ), .IN2(\main/n159 ), .IN3(\main/n160 ), 
        .IN4(\main/n161 ), .QN(\main/n145 ) );
  XOR2X1 \main/U169  ( .IN1(N2022), .IN2(N281), .Q(\main/n154 ) );
  XOR2X1 \main/U168  ( .IN1(N2020), .IN2(N278), .Q(\main/n155 ) );
  INVX0 \main/U167  ( .INP(N2018), .ZN(\main/n52 ) );
  XNOR2X1 \main/U166  ( .IN1(\main/n52 ), .IN2(N275), .Q(\main/n156 ) );
  INVX0 \main/U165  ( .INP(N2016), .ZN(N1819) );
  XNOR2X1 \main/U164  ( .IN1(N1819), .IN2(N272), .Q(\main/n157 ) );
  NAND4X0 \main/U163  ( .IN1(\main/n154 ), .IN2(\main/n155 ), .IN3(\main/n156 ), .IN4(\main/n157 ), .QN(\main/n147 ) );
  INVX0 \main/U162  ( .INP(\main/n105 ), .ZN(\main/n78 ) );
  XNOR2X1 \main/U161  ( .IN1(\main/n78 ), .IN2(N259), .Q(\main/n151 ) );
  INVX0 \main/U160  ( .INP(N2010), .ZN(\main/n71 ) );
  XNOR2X1 \main/U159  ( .IN1(\main/n71 ), .IN2(N263), .Q(\main/n152 ) );
  XNOR2X1 \main/U158  ( .IN1(\main/n82 ), .IN2(N256), .Q(\main/n153 ) );
  NAND3X0 \main/U157  ( .IN1(\main/n151 ), .IN2(\main/n152 ), .IN3(\main/n153 ), .QN(\main/n148 ) );
  XNOR2X1 \main/U156  ( .IN1(N266), .IN2(N2012), .Q(\main/n149 ) );
  XNOR2X1 \main/U155  ( .IN1(N269), .IN2(N2014), .Q(\main/n150 ) );
  NOR4X0 \main/U154  ( .IN1(\main/n147 ), .IN2(\main/n148 ), .IN3(\main/n149 ), 
        .IN4(\main/n150 ), .QN(\main/n146 ) );
  MUX21X1 \main/U153  ( .IN1(\main/n145 ), .IN2(\main/n146 ), .S(N16), .Q(
        \main/n116 ) );
  XOR2X1 \main/U152  ( .IN1(N32), .IN2(N287), .Q(\main/n141 ) );
  XOR2X1 \main/U151  ( .IN1(N301), .IN2(N27), .Q(\main/n142 ) );
  XOR2X1 \main/U150  ( .IN1(N294), .IN2(N26), .Q(\main/n143 ) );
  XOR2X1 \main/U149  ( .IN1(N284), .IN2(N25), .Q(\main/n144 ) );
  NAND4X0 \main/U148  ( .IN1(\main/n141 ), .IN2(\main/n142 ), .IN3(\main/n143 ), .IN4(\main/n144 ), .QN(\main/n136 ) );
  XOR2X1 \main/U147  ( .IN1(N35), .IN2(N309), .Q(\main/n138 ) );
  XOR2X1 \main/U146  ( .IN1(N34), .IN2(N305), .Q(\main/n139 ) );
  XOR2X1 \main/U145  ( .IN1(N33), .IN2(N297), .Q(\main/n140 ) );
  NAND4X0 \main/U144  ( .IN1(N28), .IN2(\main/n138 ), .IN3(\main/n139 ), .IN4(
        \main/n140 ), .QN(\main/n137 ) );
  NOR2X0 \main/U143  ( .IN1(\main/n136 ), .IN2(\main/n137 ), .QN(\main/n118 )
         );
  AO22X1 \main/U142  ( .IN1(N102), .IN2(\main/n18 ), .IN3(N138), .IN4(
        \main/n19 ), .Q(\main/n135 ) );
  AO221X1 \main/U141  ( .IN1(N114), .IN2(\main/n15 ), .IN3(N126), .IN4(
        \main/n16 ), .IN5(\main/n135 ), .Q(\main/n14 ) );
  INVX0 \main/U140  ( .INP(\main/n14 ), .ZN(N1818) );
  XNOR2X1 \main/U139  ( .IN1(N1818), .IN2(N301), .Q(\main/n130 ) );
  AO22X1 \main/U138  ( .IN1(N104), .IN2(\main/n18 ), .IN3(N140), .IN4(
        \main/n19 ), .Q(\main/n134 ) );
  AO221X1 \main/U137  ( .IN1(N116), .IN2(\main/n15 ), .IN3(N128), .IN4(
        \main/n16 ), .IN5(\main/n134 ), .Q(\main/n13 ) );
  XOR2X1 \main/U136  ( .IN1(\main/n13 ), .IN2(N294), .Q(\main/n131 ) );
  AO22X1 \main/U135  ( .IN1(N105), .IN2(\main/n18 ), .IN3(N141), .IN4(
        \main/n19 ), .Q(\main/n133 ) );
  AO221X1 \main/U134  ( .IN1(N117), .IN2(\main/n15 ), .IN3(N129), .IN4(
        \main/n16 ), .IN5(\main/n133 ), .Q(\main/n10 ) );
  XOR2X1 \main/U133  ( .IN1(\main/n10 ), .IN2(N287), .Q(\main/n132 ) );
  NAND4X0 \main/U132  ( .IN1(\main/n130 ), .IN2(\main/n131 ), .IN3(\main/n132 ), .IN4(\main/n23 ), .QN(\main/n120 ) );
  AO22X1 \main/U131  ( .IN1(N95), .IN2(\main/n18 ), .IN3(N131), .IN4(
        \main/n19 ), .Q(\main/n129 ) );
  AO221X1 \main/U130  ( .IN1(N107), .IN2(\main/n15 ), .IN3(N119), .IN4(
        \main/n16 ), .IN5(\main/n129 ), .Q(\main/n22 ) );
  XOR2X1 \main/U129  ( .IN1(\main/n22 ), .IN2(N284), .Q(\main/n122 ) );
  AO22X1 \main/U128  ( .IN1(N103), .IN2(\main/n18 ), .IN3(N139), .IN4(
        \main/n19 ), .Q(\main/n128 ) );
  AO221X1 \main/U127  ( .IN1(N115), .IN2(\main/n15 ), .IN3(N127), .IN4(
        \main/n16 ), .IN5(\main/n128 ), .Q(\main/n20 ) );
  XOR2X1 \main/U126  ( .IN1(\main/n20 ), .IN2(N297), .Q(\main/n123 ) );
  AO22X1 \main/U125  ( .IN1(N100), .IN2(\main/n18 ), .IN3(N136), .IN4(
        \main/n19 ), .Q(\main/n127 ) );
  AOI221X1 \main/U124  ( .IN1(N112), .IN2(\main/n15 ), .IN3(N124), .IN4(
        \main/n16 ), .IN5(\main/n127 ), .QN(N1817) );
  XNOR2X1 \main/U123  ( .IN1(N1817), .IN2(N309), .Q(\main/n124 ) );
  AO22X1 \main/U122  ( .IN1(N101), .IN2(\main/n18 ), .IN3(N137), .IN4(
        \main/n19 ), .Q(\main/n126 ) );
  AOI221X1 \main/U121  ( .IN1(N113), .IN2(\main/n15 ), .IN3(N125), .IN4(
        \main/n16 ), .IN5(\main/n126 ), .QN(N1816) );
  XNOR2X1 \main/U120  ( .IN1(N1816), .IN2(N305), .Q(\main/n125 ) );
  NAND4X0 \main/U119  ( .IN1(\main/n122 ), .IN2(\main/n123 ), .IN3(\main/n124 ), .IN4(\main/n125 ), .QN(\main/n121 ) );
  NOR2X0 \main/U118  ( .IN1(\main/n120 ), .IN2(\main/n121 ), .QN(\main/n119 )
         );
  MUX21X1 \main/U117  ( .IN1(\main/n118 ), .IN2(\main/n119 ), .S(N29), .Q(
        \main/n117 ) );
  NAND3X0 \main/U116  ( .IN1(\main/n116 ), .IN2(N11), .IN3(\main/n117 ), .QN(
        N3079) );
  INVX0 \main/U115  ( .INP(N3079), .ZN(N3038) );
  NOR2X0 \main/U114  ( .IN1(\main/n102 ), .IN2(\main/n105 ), .QN(\main/n115 )
         );
  XNOR2X1 \main/U113  ( .IN1(\main/n114 ), .IN2(\main/n115 ), .Q(\main/n112 )
         );
  NAND2X0 \main/U112  ( .IN1(\main/n112 ), .IN2(\main/n113 ), .QN(\main/n106 )
         );
  AO22X1 \main/U111  ( .IN1(N80), .IN2(\main/n110 ), .IN3(N93), .IN4(
        \main/n111 ), .Q(\main/n109 ) );
  AO221X1 \main/U110  ( .IN1(N67), .IN2(\main/n107 ), .IN3(N55), .IN4(
        \main/n108 ), .IN5(\main/n109 ), .Q(\main/n100 ) );
  XNOR2X1 \main/U109  ( .IN1(\main/n106 ), .IN2(\main/n100 ), .Q(N3546) );
  XNOR2X1 \main/U108  ( .IN1(\main/n105 ), .IN2(\main/n100 ), .Q(\main/n104 )
         );
  XNOR3X1 \main/U107  ( .IN1(N2010), .IN2(\main/n82 ), .IN3(\main/n104 ), .Q(
        \main/n95 ) );
  XNOR2X1 \main/U106  ( .IN1(N1819), .IN2(\main/n52 ), .Q(\main/n103 ) );
  XOR3X1 \main/U105  ( .IN1(N2022), .IN2(N2020), .IN3(\main/n103 ), .Q(
        \main/n94 ) );
  XNOR3X1 \main/U104  ( .IN1(\main/n102 ), .IN2(\main/n95 ), .IN3(\main/n94 ), 
        .Q(\main/n101 ) );
  MUX21X1 \main/U103  ( .IN1(\main/n100 ), .IN2(\main/n101 ), .S(N246), .Q(
        N3803) );
  XOR2X1 \main/U102  ( .IN1(N352), .IN2(N287), .Q(\main/n99 ) );
  XOR3X1 \main/U101  ( .IN1(N284), .IN2(N278), .IN3(\main/n99 ), .Q(\main/n97 ) );
  INVX0 \main/U100  ( .INP(N275), .ZN(\main/n53 ) );
  XNOR3X1 \main/U99  ( .IN1(\main/n53 ), .IN2(N272), .IN3(N263), .Q(\main/n98 ) );
  XNOR3X1 \main/U98  ( .IN1(\main/n97 ), .IN2(\main/n98 ), .IN3(N266), .Q(
        \main/n96 ) );
  XNOR3X1 \main/U97  ( .IN1(N281), .IN2(\main/n64 ), .IN3(\main/n96 ), .Q(
        N2971) );
  INVX0 \main/U96  ( .INP(N2012), .ZN(N1821) );
  XNOR2X1 \main/U95  ( .IN1(\main/n94 ), .IN2(\main/n95 ), .Q(\main/n93 ) );
  XNOR3X1 \main/U94  ( .IN1(N2014), .IN2(N1821), .IN3(\main/n93 ), .Q(
        \main/n92 ) );
  INVX0 \main/U93  ( .INP(N37), .ZN(\main/n7 ) );
  NAND2X0 \main/U92  ( .IN1(\main/n92 ), .IN2(\main/n7 ), .QN(\main/n3 ) );
  XNOR3X1 \main/U91  ( .IN1(restore_signal), .IN2(perturb_signal), .IN3(
        \main/n3 ), .Q(N3809) );
  XOR2X1 \main/U90  ( .IN1(N305), .IN2(N301), .Q(\main/n88 ) );
  XOR2X1 \main/U89  ( .IN1(N297), .IN2(N294), .Q(\main/n89 ) );
  XNOR2X1 \main/U88  ( .IN1(N316), .IN2(N355), .Q(\main/n91 ) );
  XOR3X1 \main/U87  ( .IN1(N313), .IN2(N309), .IN3(\main/n91 ), .Q(\main/n90 )
         );
  XOR3X1 \main/U86  ( .IN1(\main/n88 ), .IN2(\main/n89 ), .IN3(\main/n90 ), 
        .Q(N2970) );
  INVX0 \main/U85  ( .INP(N262), .ZN(\main/n84 ) );
  NAND2X0 \main/U84  ( .IN1(\main/n14 ), .IN2(\main/n84 ), .QN(\main/n87 ) );
  NAND3X0 \main/U83  ( .IN1(N1816), .IN2(\main/n87 ), .IN3(N40), .QN(
        \main/n31 ) );
  INVX0 \main/U82  ( .INP(\main/n31 ), .ZN(\main/n37 ) );
  NAND3X0 \main/U81  ( .IN1(N294), .IN2(\main/n13 ), .IN3(\main/n37 ), .QN(
        \main/n36 ) );
  INVX0 \main/U80  ( .INP(\main/n36 ), .ZN(\main/n86 ) );
  OR3X1 \main/U79  ( .IN1(\main/n86 ), .IN2(N287), .IN3(\main/n10 ), .Q(
        \main/n85 ) );
  OA21X1 \main/U78  ( .IN1(N294), .IN2(\main/n13 ), .IN3(\main/n85 ), .Q(
        \main/n30 ) );
  NAND3X0 \main/U77  ( .IN1(N287), .IN2(\main/n10 ), .IN3(\main/n37 ), .QN(
        \main/n33 ) );
  NOR2X0 \main/U76  ( .IN1(N284), .IN2(\main/n22 ), .QN(\main/n38 ) );
  NAND3X0 \main/U75  ( .IN1(N281), .IN2(N2022), .IN3(\main/n37 ), .QN(
        \main/n39 ) );
  NOR2X0 \main/U74  ( .IN1(N281), .IN2(N2022), .QN(\main/n41 ) );
  NAND4X0 \main/U73  ( .IN1(N40), .IN2(N1816), .IN3(\main/n14 ), .IN4(
        \main/n84 ), .QN(\main/n66 ) );
  MUX21X1 \main/U72  ( .IN1(N294), .IN2(N259), .S(\main/n66 ), .Q(\main/n83 )
         );
  INVX0 \main/U71  ( .INP(\main/n83 ), .ZN(\main/n77 ) );
  OA21X1 \main/U70  ( .IN1(\main/n78 ), .IN2(\main/n77 ), .IN3(\main/n82 ), 
        .Q(\main/n79 ) );
  MUX21X1 \main/U69  ( .IN1(N287), .IN2(N256), .S(\main/n66 ), .Q(\main/n81 )
         );
  INVX0 \main/U68  ( .INP(\main/n81 ), .ZN(\main/n80 ) );
  AO22X1 \main/U67  ( .IN1(\main/n77 ), .IN2(\main/n78 ), .IN3(\main/n79 ), 
        .IN4(\main/n80 ), .Q(\main/n72 ) );
  AND2X1 \main/U66  ( .IN1(\main/n71 ), .IN2(\main/n72 ), .Q(\main/n73 ) );
  MUX21X1 \main/U65  ( .IN1(N297), .IN2(N263), .S(\main/n66 ), .Q(\main/n76 )
         );
  INVX0 \main/U64  ( .INP(\main/n76 ), .ZN(\main/n74 ) );
  MUX21X1 \main/U63  ( .IN1(N301), .IN2(N266), .S(\main/n66 ), .Q(\main/n61 )
         );
  INVX0 \main/U62  ( .INP(\main/n61 ), .ZN(\main/n75 ) );
  OA222X1 \main/U61  ( .IN1(\main/n71 ), .IN2(\main/n72 ), .IN3(\main/n73 ), 
        .IN4(\main/n74 ), .IN5(N1821), .IN6(\main/n75 ), .Q(\main/n42 ) );
  NAND2X0 \main/U60  ( .IN1(N8), .IN2(\main/n66 ), .QN(\main/n70 ) );
  NOR2X0 \main/U59  ( .IN1(\main/n70 ), .IN2(N278), .QN(\main/n48 ) );
  INVX0 \main/U58  ( .INP(\main/n48 ), .ZN(\main/n69 ) );
  INVX0 \main/U57  ( .INP(\main/n70 ), .ZN(\main/n47 ) );
  NAND3X0 \main/U56  ( .IN1(\main/n69 ), .IN2(N2020), .IN3(\main/n47 ), .QN(
        \main/n63 ) );
  NAND3X0 \main/U55  ( .IN1(N275), .IN2(N2018), .IN3(\main/n47 ), .QN(
        \main/n54 ) );
  INVX0 \main/U54  ( .INP(N272), .ZN(\main/n67 ) );
  NOR2X0 \main/U53  ( .IN1(N309), .IN2(\main/n66 ), .QN(\main/n68 ) );
  AOI22X1 \main/U52  ( .IN1(\main/n47 ), .IN2(\main/n67 ), .IN3(\main/n68 ), 
        .IN4(N8), .QN(\main/n57 ) );
  NAND3X0 \main/U51  ( .IN1(N8), .IN2(N2016), .IN3(\main/n57 ), .QN(\main/n55 ) );
  NOR2X0 \main/U50  ( .IN1(N305), .IN2(\main/n66 ), .QN(\main/n65 ) );
  AOI22X1 \main/U49  ( .IN1(\main/n47 ), .IN2(\main/n64 ), .IN3(\main/n65 ), 
        .IN4(N8), .QN(\main/n62 ) );
  NAND3X0 \main/U48  ( .IN1(N8), .IN2(N2014), .IN3(\main/n62 ), .QN(\main/n60 ) );
  AND4X1 \main/U47  ( .IN1(\main/n63 ), .IN2(\main/n54 ), .IN3(\main/n55 ), 
        .IN4(\main/n60 ), .Q(\main/n43 ) );
  OA22X1 \main/U46  ( .IN1(N2012), .IN2(\main/n61 ), .IN3(N2014), .IN4(
        \main/n62 ), .Q(\main/n58 ) );
  INVX0 \main/U45  ( .INP(\main/n60 ), .ZN(\main/n59 ) );
  OAI22X1 \main/U44  ( .IN1(N2016), .IN2(\main/n57 ), .IN3(\main/n58 ), .IN4(
        \main/n59 ), .QN(\main/n56 ) );
  NAND3X0 \main/U43  ( .IN1(\main/n54 ), .IN2(\main/n55 ), .IN3(\main/n56 ), 
        .QN(\main/n50 ) );
  NAND3X0 \main/U42  ( .IN1(\main/n52 ), .IN2(\main/n53 ), .IN3(\main/n47 ), 
        .QN(\main/n51 ) );
  NAND2X0 \main/U41  ( .IN1(\main/n50 ), .IN2(\main/n51 ), .QN(\main/n49 ) );
  OR2X1 \main/U40  ( .IN1(\main/n49 ), .IN2(\main/n48 ), .Q(\main/n44 ) );
  NAND2X0 \main/U39  ( .IN1(\main/n48 ), .IN2(\main/n49 ), .QN(\main/n46 ) );
  NAND3X0 \main/U38  ( .IN1(\main/n46 ), .IN2(N2020), .IN3(\main/n47 ), .QN(
        \main/n45 ) );
  AO222X1 \main/U37  ( .IN1(\main/n41 ), .IN2(\main/n37 ), .IN3(\main/n42 ), 
        .IN4(\main/n43 ), .IN5(\main/n44 ), .IN6(\main/n45 ), .Q(\main/n40 )
         );
  AO22X1 \main/U36  ( .IN1(\main/n38 ), .IN2(\main/n37 ), .IN3(\main/n39 ), 
        .IN4(\main/n40 ), .Q(\main/n34 ) );
  NAND3X0 \main/U35  ( .IN1(N284), .IN2(\main/n22 ), .IN3(\main/n37 ), .QN(
        \main/n35 ) );
  NAND4X0 \main/U34  ( .IN1(\main/n33 ), .IN2(\main/n34 ), .IN3(\main/n35 ), 
        .IN4(\main/n36 ), .QN(\main/n32 ) );
  OAI21X1 \main/U33  ( .IN1(\main/n30 ), .IN2(\main/n31 ), .IN3(\main/n32 ), 
        .QN(N3851) );
  XNOR2X1 \main/U32  ( .IN1(N337), .IN2(N334), .Q(\main/n29 ) );
  XOR3X1 \main/U31  ( .IN1(N331), .IN2(N328), .IN3(\main/n29 ), .Q(\main/n26 )
         );
  XOR2X1 \main/U30  ( .IN1(N349), .IN2(N346), .Q(\main/n28 ) );
  XOR3X1 \main/U29  ( .IN1(N343), .IN2(N340), .IN3(\main/n28 ), .Q(\main/n27 )
         );
  XOR2X1 \main/U28  ( .IN1(\main/n26 ), .IN2(\main/n27 ), .Q(\main/n25 ) );
  XOR3X1 \main/U27  ( .IN1(N259), .IN2(N256), .IN3(\main/n25 ), .Q(\main/n24 )
         );
  NAND2X0 \main/U26  ( .IN1(\main/n24 ), .IN2(N14), .QN(\main/n1 ) );
  XNOR2X1 \main/U25  ( .IN1(\main/n22 ), .IN2(\main/n23 ), .Q(\main/n21 ) );
  XNOR3X1 \main/U24  ( .IN1(\main/n20 ), .IN2(N1816), .IN3(\main/n21 ), .Q(
        \main/n8 ) );
  AO22X1 \main/U23  ( .IN1(N106), .IN2(\main/n18 ), .IN3(N142), .IN4(
        \main/n19 ), .Q(\main/n17 ) );
  AO221X1 \main/U22  ( .IN1(N118), .IN2(\main/n15 ), .IN3(N130), .IN4(
        \main/n16 ), .IN5(\main/n17 ), .Q(\main/n11 ) );
  XNOR2X1 \main/U21  ( .IN1(\main/n13 ), .IN2(\main/n14 ), .Q(\main/n12 ) );
  XOR3X1 \main/U20  ( .IN1(\main/n10 ), .IN2(\main/n11 ), .IN3(\main/n12 ), 
        .Q(\main/n9 ) );
  XNOR3X1 \main/U19  ( .IN1(\main/n8 ), .IN2(\main/n9 ), .IN3(N1817), .Q(
        \main/n6 ) );
  NAND2X0 \main/U18  ( .IN1(\main/n6 ), .IN2(\main/n7 ), .QN(\main/n2 ) );
  NOR3X0 \main/U17  ( .IN1(\main/n5 ), .IN2(N2970), .IN3(N2971), .QN(\main/n4 ) );
  NAND4X0 \main/U16  ( .IN1(\main/n3 ), .IN2(\main/n1 ), .IN3(\main/n2 ), 
        .IN4(\main/n4 ), .QN(N3882) );
  NAND4X0 \main/U15  ( .IN1(N309), .IN2(N305), .IN3(N297), .IN4(N301), .QN(
        N792) );
  NAND3X0 \main/U14  ( .IN1(N2), .IN2(N15), .IN3(N237), .QN(N799) );
  INVX0 \main/U13  ( .INP(N132), .ZN(N488) );
  INVX0 \main/U12  ( .INP(N120), .ZN(N492) );
  INVX0 \main/U11  ( .INP(N108), .ZN(N494) );
  INVX0 \main/U10  ( .INP(N96), .ZN(N490) );
  INVX0 \main/U9  ( .INP(N82), .ZN(N489) );
  INVX0 \main/U8  ( .INP(N69), .ZN(N491) );
  INVX0 \main/U7  ( .INP(N57), .ZN(N493) );
  INVX0 \main/U6  ( .INP(N2014), .ZN(N1820) );
  INVX0 \main/U5  ( .INP(N1277), .ZN(N1448) );
  INVX0 \main/U4  ( .INP(N44), .ZN(N487) );
  INVX0 \main/U3  ( .INP(\main/n2 ), .ZN(N3671) );
  INVX0 \main/U2  ( .INP(N3882), .ZN(N3881) );
  INVX0 \main/U1  ( .INP(\main/n1 ), .ZN(N2925) );
  OR4X1 \perturb/U8  ( .IN1(N76), .IN2(N75), .IN3(N90), .IN4(N77), .Q(
        \perturb/n1 ) );
  OR4X1 \perturb/U7  ( .IN1(N63), .IN2(N37), .IN3(N74), .IN4(N73), .Q(
        \perturb/n2 ) );
  INVX0 \perturb/U6  ( .INP(N234), .ZN(\perturb/n5 ) );
  NAND4X0 \perturb/U5  ( .IN1(N51), .IN2(N72), .IN3(N64), .IN4(\perturb/n5 ), 
        .QN(\perturb/n3 ) );
  NAND4X0 \perturb/U4  ( .IN1(N55), .IN2(N62), .IN3(N54), .IN4(N67), .QN(
        \perturb/n4 ) );
  NOR4X0 \perturb/U3  ( .IN1(\perturb/n1 ), .IN2(\perturb/n2 ), .IN3(
        \perturb/n3 ), .IN4(\perturb/n4 ), .QN(perturb_signal) );
  XNOR2X1 \restore/U22  ( .IN1(keyinput13), .IN2(N64), .Q(\restore/n17 ) );
  XNOR2X1 \restore/U21  ( .IN1(keyinput12), .IN2(N67), .Q(\restore/n18 ) );
  XNOR2X1 \restore/U20  ( .IN1(keyinput11), .IN2(N234), .Q(\restore/n19 ) );
  XNOR2X1 \restore/U19  ( .IN1(keyinput10), .IN2(N51), .Q(\restore/n20 ) );
  NAND4X0 \restore/U18  ( .IN1(\restore/n17 ), .IN2(\restore/n18 ), .IN3(
        \restore/n19 ), .IN4(\restore/n20 ), .QN(\restore/n1 ) );
  XNOR2X1 \restore/U17  ( .IN1(keyinput1), .IN2(N90), .Q(\restore/n13 ) );
  XNOR2X1 \restore/U16  ( .IN1(keyinput0), .IN2(N63), .Q(\restore/n14 ) );
  XNOR2X1 \restore/U15  ( .IN1(keyinput15), .IN2(N54), .Q(\restore/n15 ) );
  XNOR2X1 \restore/U14  ( .IN1(keyinput14), .IN2(N72), .Q(\restore/n16 ) );
  NAND4X0 \restore/U13  ( .IN1(\restore/n13 ), .IN2(\restore/n14 ), .IN3(
        \restore/n15 ), .IN4(\restore/n16 ), .QN(\restore/n2 ) );
  XNOR2X1 \restore/U12  ( .IN1(keyinput5), .IN2(N77), .Q(\restore/n9 ) );
  XNOR2X1 \restore/U11  ( .IN1(keyinput4), .IN2(N55), .Q(\restore/n10 ) );
  XNOR2X1 \restore/U10  ( .IN1(keyinput3), .IN2(N73), .Q(\restore/n11 ) );
  XNOR2X1 \restore/U9  ( .IN1(keyinput2), .IN2(N62), .Q(\restore/n12 ) );
  NAND4X0 \restore/U8  ( .IN1(\restore/n9 ), .IN2(\restore/n10 ), .IN3(
        \restore/n11 ), .IN4(\restore/n12 ), .QN(\restore/n3 ) );
  XNOR2X1 \restore/U7  ( .IN1(keyinput8), .IN2(N75), .Q(\restore/n5 ) );
  XNOR2X1 \restore/U6  ( .IN1(keyinput7), .IN2(N76), .Q(\restore/n6 ) );
  XNOR2X1 \restore/U5  ( .IN1(keyinput9), .IN2(N37), .Q(\restore/n7 ) );
  XNOR2X1 \restore/U4  ( .IN1(keyinput6), .IN2(N74), .Q(\restore/n8 ) );
  NAND4X0 \restore/U3  ( .IN1(\restore/n5 ), .IN2(\restore/n6 ), .IN3(
        \restore/n7 ), .IN4(\restore/n8 ), .QN(\restore/n4 ) );
  NOR4X0 \restore/U2  ( .IN1(\restore/n1 ), .IN2(\restore/n2 ), .IN3(
        \restore/n3 ), .IN4(\restore/n4 ), .QN(restore_signal) );
endmodule

