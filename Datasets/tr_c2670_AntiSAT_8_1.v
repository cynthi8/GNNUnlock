/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr  8 03:26:15 2021
/////////////////////////////////////////////////////////////


module c2670_AntiSAT_8_1_top ( N145, N153, N162, N168, N172, N210, N190, N212, 
        N167, N185, N173, N174, N183, N196, N151, N200, N187, N195, N155, N193, 
        N146, N163, N178, N211, N208, N177, N182, N213, N191, N216, N204, N170, 
        N165, N179, N189, N207, N184, N148, N154, N157, N158, N164, N149, N180, 
        N192, N156, N194, N203, N199, N171, N205, N161, N160, N176, N197, N209, 
        N201, N202, N188, N218, N143, N175, N169, N166, N186, N159, N217, N147, 
        N144, N181, N150, N215, N206, N198, N152, N214, N1, N2, N3, N4, N5, N6, 
        N7, N8, N11, N14, N15, N16, N19, N20, N21, N22, N23, N24, N25, N26, 
        N27, N28, N29, N32, N33, N34, N35, N36, N37, N40, N43, N44, N47, N48, 
        N49, N50, N51, N52, N53, N54, N55, N56, N57, N60, N61, N62, N63, N64, 
        N65, N66, N67, N68, N69, N72, N73, N74, N75, N76, N77, N78, N79, N80, 
        N81, N82, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, 
        N99, N100, N101, N102, N103, N104, N105, N106, N107, N108, N111, N112, 
        N113, N114, N115, N116, N117, N118, N119, N120, N123, N124, N125, N126, 
        N127, N128, N129, N130, N131, N132, N135, N136, N137, N138, N139, N140, 
        N141, N142, N219, N224, N227, N230, N231, N234, N237, N241, N246, N253, 
        N256, N259, N262, N263, N266, N269, N272, N275, N278, N281, N284, N287, 
        N290, N294, N297, N301, N305, N309, N313, N316, N319, N322, N325, N328, 
        N331, N334, N337, N340, N343, N346, N349, N352, N355, keyinput0, 
        keyinput1, keyinput2, keyinput3, keyinput4, keyinput5, keyinput6, 
        keyinput7, N2016, N3803, N214_BUFF, N217_BUFF, N160_BUFF, N2496, N2022, 
        N173_BUFF, N3809, N213_BUFF, N190_BUFF, N799, N215_BUFF, N183_BUFF, 
        N164_BUFF, N1269, N3851, N192_BUFF, N218_BUFF, N2925, N188_BUFF, N1726, 
        N148_BUFF, N1448, N159_BUFF, N494, N2644, N1026, N2014, N158_BUFF, 
        N2389, N492, N152_BUFF, N162_BUFF, N167_BUFF, N199_BUFF, N145_BUFF, 
        N144_BUFF, N489, N1816, N1969, N458, N206_BUFF, N1029, N2012, 
        N202_BUFF, N156_BUFF, N210_BUFF, N488, N2018, N3038, N487, N2390, 
        N1970, N208_BUFF, N2643, N401, N490, N197_BUFF, N194_BUFF, N189_BUFF, 
        N491, N155_BUFF, N1028, N151_BUFF, N186_BUFF, N3079, N198_BUFF, N398, 
        N178_BUFF, N212_BUFF, N1818, N203_BUFF, N182_BUFF, N196_BUFF, N419, 
        N143_BUFF, N201_BUFF, N193_BUFF, N187_BUFF, N161_BUFF, N1819, N3882, 
        N170_BUFF, N792, N166_BUFF, N1817, N157_BUFF, N456, N2388, N195_BUFF, 
        N3881, N805, N154_BUFF, N176_BUFF, N169_BUFF, N205_BUFF, N184_BUFF, 
        N179_BUFF, N3804, N146_BUFF, N1820, N200_BUFF, N149_BUFF, N3875, 
        N150_BUFF, N153_BUFF, N204_BUFF, N2387, N400, N191_BUFF, N207_BUFF, 
        N420, N163_BUFF, N2970, N172_BUFF, N180_BUFF, N2971, N2010, N177_BUFF, 
        N209_BUFF, N174_BUFF, N2891, N147_BUFF, N165_BUFF, N457, N185_BUFF, 
        N3671, N211_BUFF, N171_BUFF, N168_BUFF, N2020, N216_BUFF, N1277, N1821, 
        N3546, N175_BUFF, N493, N1971, N181_BUFF );
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
         keyinput4, keyinput5, keyinput6, keyinput7;
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
         N168_BUFF, N216_BUFF, N175_BUFF, N181_BUFF, flip_signal, \main/n187 ,
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
         \main/n5 , \main/n4 , \main/n3 , \main/n2 , \main/n1 , \flip/n10 ,
         \flip/n9 , \flip/n8 , \flip/n7 , \flip/n6 , \flip/n5 , \flip/n4 ,
         \flip/n3 , \flip/n2 , \flip/n1 ;
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
  assign N3875 = 1'b0;

  AND2X1 \main/U237  ( .IN1(N94), .IN2(N398), .Q(N1026) );
  NAND2X0 \main/U236  ( .IN1(N7), .IN2(N237), .QN(N1028) );
  INVX0 \main/U235  ( .INP(N1028), .ZN(\main/n187 ) );
  NAND2X0 \main/U234  ( .IN1(N231), .IN2(\main/n187 ), .QN(N1029) );
  NAND4X0 \main/U233  ( .IN1(N44), .IN2(N132), .IN3(N82), .IN4(N96), .QN(
        \main/n176 ) );
  NAND4X0 \main/U232  ( .IN1(N69), .IN2(N120), .IN3(N57), .IN4(N108), .QN(
        \main/n177 ) );
  NOR2X0 \main/U231  ( .IN1(\main/n176 ), .IN2(\main/n177 ), .QN(N1277) );
  NAND2X0 \main/U230  ( .IN1(N325), .IN2(\main/n187 ), .QN(N1269) );
  INVX0 \main/U229  ( .INP(N1277), .ZN(N1448) );
  INVX0 \main/U228  ( .INP(N234), .ZN(\main/n186 ) );
  NOR2X0 \main/U227  ( .IN1(\main/n186 ), .IN2(N227), .QN(\main/n93 ) );
  INVX0 \main/U226  ( .INP(N227), .ZN(\main/n180 ) );
  NOR2X0 \main/U225  ( .IN1(\main/n180 ), .IN2(N234), .QN(\main/n94 ) );
  NOR2X0 \main/U224  ( .IN1(\main/n186 ), .IN2(\main/n180 ), .QN(\main/n96 )
         );
  NOR2X0 \main/U223  ( .IN1(N227), .IN2(N234), .QN(\main/n97 ) );
  AO22X1 \main/U222  ( .IN1(N78), .IN2(\main/n96 ), .IN3(N91), .IN4(\main/n97 ), .Q(\main/n185 ) );
  AO221X1 \main/U221  ( .IN1(N65), .IN2(\main/n93 ), .IN3(N53), .IN4(
        \main/n94 ), .IN5(\main/n185 ), .Q(N2010) );
  AO22X1 \main/U220  ( .IN1(N77), .IN2(\main/n96 ), .IN3(N90), .IN4(\main/n97 ), .Q(\main/n184 ) );
  AO221X1 \main/U219  ( .IN1(N64), .IN2(\main/n93 ), .IN3(N52), .IN4(
        \main/n94 ), .IN5(\main/n184 ), .Q(N2012) );
  AO22X1 \main/U218  ( .IN1(N76), .IN2(\main/n96 ), .IN3(N89), .IN4(\main/n97 ), .Q(\main/n183 ) );
  AO221X1 \main/U217  ( .IN1(N63), .IN2(\main/n93 ), .IN3(N51), .IN4(
        \main/n94 ), .IN5(\main/n183 ), .Q(N2014) );
  AO22X1 \main/U216  ( .IN1(N75), .IN2(\main/n96 ), .IN3(N88), .IN4(\main/n97 ), .Q(\main/n182 ) );
  AO221X1 \main/U215  ( .IN1(N62), .IN2(\main/n93 ), .IN3(N50), .IN4(
        \main/n94 ), .IN5(\main/n182 ), .Q(N2016) );
  AO21X1 \main/U214  ( .IN1(N49), .IN2(\main/n94 ), .IN3(\main/n93 ), .Q(
        \main/n181 ) );
  AO221X1 \main/U213  ( .IN1(N87), .IN2(\main/n180 ), .IN3(N74), .IN4(N234), 
        .IN5(\main/n181 ), .Q(N2018) );
  AO22X1 \main/U212  ( .IN1(N73), .IN2(\main/n96 ), .IN3(N86), .IN4(\main/n97 ), .Q(\main/n179 ) );
  AO221X1 \main/U211  ( .IN1(N61), .IN2(\main/n93 ), .IN3(N48), .IN4(
        \main/n94 ), .IN5(\main/n179 ), .Q(N2020) );
  AO22X1 \main/U210  ( .IN1(N72), .IN2(\main/n96 ), .IN3(N85), .IN4(\main/n97 ), .Q(\main/n178 ) );
  AO221X1 \main/U209  ( .IN1(N60), .IN2(\main/n93 ), .IN3(N47), .IN4(
        \main/n94 ), .IN5(\main/n178 ), .Q(N2022) );
  AO22X1 \main/U208  ( .IN1(N325), .IN2(\main/n176 ), .IN3(N231), .IN4(
        \main/n177 ), .Q(\main/n5 ) );
  INVX0 \main/U207  ( .INP(\main/n5 ), .ZN(N1726) );
  INVX0 \main/U206  ( .INP(N322), .ZN(\main/n175 ) );
  INVX0 \main/U205  ( .INP(N319), .ZN(\main/n174 ) );
  NOR2X0 \main/U204  ( .IN1(\main/n175 ), .IN2(\main/n174 ), .QN(\main/n87 )
         );
  NOR2X0 \main/U203  ( .IN1(\main/n175 ), .IN2(N319), .QN(\main/n88 ) );
  NOR2X0 \main/U202  ( .IN1(\main/n174 ), .IN2(N322), .QN(\main/n90 ) );
  NOR2X0 \main/U201  ( .IN1(N319), .IN2(N322), .QN(\main/n91 ) );
  AO22X1 \main/U200  ( .IN1(N101), .IN2(\main/n90 ), .IN3(N137), .IN4(
        \main/n91 ), .Q(\main/n173 ) );
  AOI221X1 \main/U199  ( .IN1(N113), .IN2(\main/n87 ), .IN3(N125), .IN4(
        \main/n88 ), .IN5(\main/n173 ), .QN(N1816) );
  AO22X1 \main/U198  ( .IN1(N100), .IN2(\main/n90 ), .IN3(N136), .IN4(
        \main/n91 ), .Q(\main/n172 ) );
  AOI221X1 \main/U197  ( .IN1(N112), .IN2(\main/n87 ), .IN3(N124), .IN4(
        \main/n88 ), .IN5(\main/n172 ), .QN(N1817) );
  AO22X1 \main/U196  ( .IN1(N102), .IN2(\main/n90 ), .IN3(N138), .IN4(
        \main/n91 ), .Q(\main/n171 ) );
  AO221X1 \main/U195  ( .IN1(N114), .IN2(\main/n87 ), .IN3(N126), .IN4(
        \main/n88 ), .IN5(\main/n171 ), .Q(\main/n57 ) );
  INVX0 \main/U194  ( .INP(\main/n57 ), .ZN(N1818) );
  INVX0 \main/U193  ( .INP(N2016), .ZN(N1819) );
  INVX0 \main/U192  ( .INP(N2014), .ZN(N1820) );
  INVX0 \main/U191  ( .INP(N2012), .ZN(N1821) );
  AO22X1 \main/U190  ( .IN1(N68), .IN2(\main/n96 ), .IN3(N81), .IN4(\main/n97 ), .Q(\main/n170 ) );
  AO221X1 \main/U189  ( .IN1(N56), .IN2(\main/n93 ), .IN3(N43), .IN4(
        \main/n94 ), .IN5(\main/n170 ), .Q(\main/n56 ) );
  INVX0 \main/U188  ( .INP(\main/n56 ), .ZN(\main/n140 ) );
  NAND2X0 \main/U187  ( .IN1(N241), .IN2(\main/n140 ), .QN(N1969) );
  NAND3X0 \main/U186  ( .IN1(N1726), .IN2(N237), .IN3(N224), .QN(\main/n168 )
         );
  INVX0 \main/U185  ( .INP(\main/n168 ), .ZN(\main/n169 ) );
  NAND2X0 \main/U184  ( .IN1(N36), .IN2(\main/n169 ), .QN(N1970) );
  AO21X1 \main/U183  ( .IN1(N3), .IN2(N1), .IN3(\main/n168 ), .Q(N1971) );
  AO22X1 \main/U182  ( .IN1(N79), .IN2(\main/n96 ), .IN3(N92), .IN4(\main/n97 ), .Q(\main/n167 ) );
  AO221X1 \main/U181  ( .IN1(N66), .IN2(\main/n93 ), .IN3(N54), .IN4(
        \main/n94 ), .IN5(\main/n167 ), .Q(\main/n53 ) );
  MUX21X1 \main/U180  ( .IN1(\main/n53 ), .IN2(N2012), .S(N246), .Q(N2387) );
  MUX21X1 \main/U179  ( .IN1(N2010), .IN2(N2014), .S(N246), .Q(N2389) );
  NOR2X0 \main/U178  ( .IN1(N230), .IN2(\main/n53 ), .QN(\main/n76 ) );
  INVX0 \main/U177  ( .INP(\main/n76 ), .ZN(\main/n166 ) );
  INVX0 \main/U176  ( .INP(N241), .ZN(\main/n99 ) );
  AO21X1 \main/U175  ( .IN1(\main/n166 ), .IN2(\main/n99 ), .IN3(\main/n53 ), 
        .Q(N2496) );
  MUX21X1 \main/U174  ( .IN1(\main/n56 ), .IN2(\main/n166 ), .S(N246), .Q(
        N2643) );
  AO22X1 \main/U173  ( .IN1(N99), .IN2(\main/n90 ), .IN3(N135), .IN4(
        \main/n91 ), .Q(\main/n165 ) );
  AO221X1 \main/U172  ( .IN1(N111), .IN2(\main/n87 ), .IN3(N123), .IN4(
        \main/n88 ), .IN5(\main/n165 ), .Q(\main/n84 ) );
  XOR2X1 \main/U171  ( .IN1(\main/n84 ), .IN2(N313), .Q(\main/n163 ) );
  INVX0 \main/U170  ( .INP(N316), .ZN(\main/n164 ) );
  NAND2X0 \main/U169  ( .IN1(\main/n163 ), .IN2(\main/n164 ), .QN(N2891) );
  XNOR2X1 \main/U168  ( .IN1(N337), .IN2(N334), .Q(\main/n162 ) );
  XOR3X1 \main/U167  ( .IN1(N331), .IN2(N328), .IN3(\main/n162 ), .Q(
        \main/n159 ) );
  XOR2X1 \main/U166  ( .IN1(N349), .IN2(N346), .Q(\main/n161 ) );
  XOR3X1 \main/U165  ( .IN1(N343), .IN2(N340), .IN3(\main/n161 ), .Q(
        \main/n160 ) );
  XOR2X1 \main/U164  ( .IN1(\main/n159 ), .IN2(\main/n160 ), .Q(\main/n158 )
         );
  XOR3X1 \main/U163  ( .IN1(N259), .IN2(N256), .IN3(\main/n158 ), .Q(
        \main/n157 ) );
  NAND2X0 \main/U162  ( .IN1(\main/n157 ), .IN2(N14), .QN(\main/n2 ) );
  INVX0 \main/U161  ( .INP(\main/n2 ), .ZN(N2925) );
  INVX0 \main/U160  ( .INP(N278), .ZN(\main/n48 ) );
  XNOR2X1 \main/U159  ( .IN1(N6), .IN2(\main/n48 ), .Q(\main/n152 ) );
  INVX0 \main/U158  ( .INP(N266), .ZN(\main/n156 ) );
  XNOR2X1 \main/U157  ( .IN1(N5), .IN2(\main/n156 ), .Q(\main/n153 ) );
  XOR2X1 \main/U156  ( .IN1(N4), .IN2(N259), .Q(\main/n154 ) );
  XOR2X1 \main/U155  ( .IN1(N281), .IN2(N24), .Q(\main/n155 ) );
  NAND4X0 \main/U154  ( .IN1(\main/n152 ), .IN2(\main/n153 ), .IN3(\main/n154 ), .IN4(\main/n155 ), .QN(\main/n145 ) );
  XOR2X1 \main/U153  ( .IN1(N256), .IN2(N19), .Q(\main/n149 ) );
  INVX0 \main/U152  ( .INP(N269), .ZN(\main/n43 ) );
  XNOR2X1 \main/U151  ( .IN1(\main/n43 ), .IN2(N21), .Q(\main/n150 ) );
  XOR2X1 \main/U150  ( .IN1(N263), .IN2(N20), .Q(\main/n151 ) );
  NAND3X0 \main/U149  ( .IN1(\main/n149 ), .IN2(\main/n150 ), .IN3(\main/n151 ), .QN(\main/n146 ) );
  XNOR2X1 \main/U148  ( .IN1(N272), .IN2(N22), .Q(\main/n147 ) );
  XNOR2X1 \main/U147  ( .IN1(N275), .IN2(N23), .Q(\main/n148 ) );
  NOR4X0 \main/U146  ( .IN1(\main/n145 ), .IN2(\main/n146 ), .IN3(\main/n147 ), 
        .IN4(\main/n148 ), .QN(\main/n131 ) );
  XOR2X1 \main/U145  ( .IN1(N2022), .IN2(N281), .Q(\main/n141 ) );
  XNOR2X1 \main/U144  ( .IN1(N2020), .IN2(\main/n48 ), .Q(\main/n142 ) );
  INVX0 \main/U143  ( .INP(N2018), .ZN(\main/n31 ) );
  XNOR2X1 \main/U142  ( .IN1(\main/n31 ), .IN2(N275), .Q(\main/n143 ) );
  XNOR2X1 \main/U141  ( .IN1(N1819), .IN2(N272), .Q(\main/n144 ) );
  NAND4X0 \main/U140  ( .IN1(\main/n141 ), .IN2(\main/n142 ), .IN3(\main/n143 ), .IN4(\main/n144 ), .QN(\main/n133 ) );
  XOR2X1 \main/U139  ( .IN1(\main/n53 ), .IN2(N259), .Q(\main/n137 ) );
  XOR2X1 \main/U138  ( .IN1(N2010), .IN2(N263), .Q(\main/n138 ) );
  XNOR2X1 \main/U137  ( .IN1(\main/n140 ), .IN2(N256), .Q(\main/n139 ) );
  NAND3X0 \main/U136  ( .IN1(\main/n137 ), .IN2(\main/n138 ), .IN3(\main/n139 ), .QN(\main/n134 ) );
  XNOR2X1 \main/U135  ( .IN1(N266), .IN2(N2012), .Q(\main/n135 ) );
  XNOR2X1 \main/U134  ( .IN1(N269), .IN2(N2014), .Q(\main/n136 ) );
  NOR4X0 \main/U133  ( .IN1(\main/n133 ), .IN2(\main/n134 ), .IN3(\main/n135 ), 
        .IN4(\main/n136 ), .QN(\main/n132 ) );
  MUX21X1 \main/U132  ( .IN1(\main/n131 ), .IN2(\main/n132 ), .S(N16), .Q(
        \main/n105 ) );
  INVX0 \main/U131  ( .INP(N287), .ZN(\main/n62 ) );
  XNOR2X1 \main/U130  ( .IN1(N32), .IN2(\main/n62 ), .Q(\main/n127 ) );
  XOR2X1 \main/U129  ( .IN1(N301), .IN2(N27), .Q(\main/n128 ) );
  XOR2X1 \main/U128  ( .IN1(N294), .IN2(N26), .Q(\main/n129 ) );
  XOR2X1 \main/U127  ( .IN1(N284), .IN2(N25), .Q(\main/n130 ) );
  NAND4X0 \main/U126  ( .IN1(\main/n127 ), .IN2(\main/n128 ), .IN3(\main/n129 ), .IN4(\main/n130 ), .QN(\main/n122 ) );
  XOR2X1 \main/U125  ( .IN1(N35), .IN2(N309), .Q(\main/n124 ) );
  XOR2X1 \main/U124  ( .IN1(N34), .IN2(N305), .Q(\main/n125 ) );
  XOR2X1 \main/U123  ( .IN1(N33), .IN2(N297), .Q(\main/n126 ) );
  NAND4X0 \main/U122  ( .IN1(N28), .IN2(\main/n124 ), .IN3(\main/n125 ), .IN4(
        \main/n126 ), .QN(\main/n123 ) );
  NOR2X0 \main/U121  ( .IN1(\main/n122 ), .IN2(\main/n123 ), .QN(\main/n107 )
         );
  AO22X1 \main/U120  ( .IN1(N103), .IN2(\main/n90 ), .IN3(N139), .IN4(
        \main/n91 ), .Q(\main/n121 ) );
  AO221X1 \main/U119  ( .IN1(N115), .IN2(\main/n87 ), .IN3(N127), .IN4(
        \main/n88 ), .IN5(\main/n121 ), .Q(\main/n82 ) );
  XOR2X1 \main/U118  ( .IN1(\main/n82 ), .IN2(N297), .Q(\main/n116 ) );
  AO22X1 \main/U117  ( .IN1(N104), .IN2(\main/n90 ), .IN3(N140), .IN4(
        \main/n91 ), .Q(\main/n120 ) );
  AO221X1 \main/U116  ( .IN1(N116), .IN2(\main/n87 ), .IN3(N128), .IN4(
        \main/n88 ), .IN5(\main/n120 ), .Q(\main/n60 ) );
  XOR2X1 \main/U115  ( .IN1(\main/n60 ), .IN2(N294), .Q(\main/n117 ) );
  AO22X1 \main/U114  ( .IN1(N105), .IN2(\main/n90 ), .IN3(N141), .IN4(
        \main/n91 ), .Q(\main/n119 ) );
  AO221X1 \main/U113  ( .IN1(N117), .IN2(\main/n87 ), .IN3(N129), .IN4(
        \main/n88 ), .IN5(\main/n119 ), .Q(\main/n59 ) );
  INVX0 \main/U112  ( .INP(\main/n59 ), .ZN(\main/n63 ) );
  XNOR2X1 \main/U111  ( .IN1(\main/n63 ), .IN2(N287), .Q(\main/n118 ) );
  NAND4X0 \main/U110  ( .IN1(\main/n116 ), .IN2(\main/n117 ), .IN3(\main/n118 ), .IN4(\main/n84 ), .QN(\main/n109 ) );
  XNOR2X1 \main/U109  ( .IN1(N1816), .IN2(N305), .Q(\main/n111 ) );
  XNOR2X1 \main/U108  ( .IN1(N1817), .IN2(N309), .Q(\main/n112 ) );
  XNOR2X1 \main/U107  ( .IN1(N1818), .IN2(N301), .Q(\main/n113 ) );
  AO22X1 \main/U106  ( .IN1(N95), .IN2(\main/n90 ), .IN3(N131), .IN4(
        \main/n91 ), .Q(\main/n115 ) );
  AO221X1 \main/U105  ( .IN1(N107), .IN2(\main/n87 ), .IN3(N119), .IN4(
        \main/n88 ), .IN5(\main/n115 ), .Q(\main/n14 ) );
  XOR2X1 \main/U104  ( .IN1(\main/n14 ), .IN2(N284), .Q(\main/n114 ) );
  NAND4X0 \main/U103  ( .IN1(\main/n111 ), .IN2(\main/n112 ), .IN3(\main/n113 ), .IN4(\main/n114 ), .QN(\main/n110 ) );
  NOR2X0 \main/U102  ( .IN1(\main/n109 ), .IN2(\main/n110 ), .QN(\main/n108 )
         );
  MUX21X1 \main/U101  ( .IN1(\main/n107 ), .IN2(\main/n108 ), .S(N29), .Q(
        \main/n106 ) );
  NAND3X0 \main/U100  ( .IN1(\main/n105 ), .IN2(N11), .IN3(\main/n106 ), .QN(
        N3079) );
  INVX0 \main/U99  ( .INP(N3079), .ZN(N3038) );
  XNOR2X1 \main/U98  ( .IN1(N352), .IN2(\main/n62 ), .Q(\main/n104 ) );
  XNOR3X1 \main/U97  ( .IN1(N284), .IN2(\main/n48 ), .IN3(\main/n104 ), .Q(
        \main/n102 ) );
  INVX0 \main/U96  ( .INP(N275), .ZN(\main/n32 ) );
  XNOR3X1 \main/U95  ( .IN1(\main/n32 ), .IN2(N272), .IN3(N263), .Q(
        \main/n103 ) );
  XNOR3X1 \main/U94  ( .IN1(\main/n102 ), .IN2(\main/n103 ), .IN3(N266), .Q(
        \main/n101 ) );
  XNOR3X1 \main/U93  ( .IN1(N281), .IN2(\main/n43 ), .IN3(\main/n101 ), .Q(
        \main/n6 ) );
  XOR2X1 \main/U92  ( .IN1(\main/n6 ), .IN2(flip_signal), .Q(N2971) );
  NOR2X0 \main/U91  ( .IN1(\main/n76 ), .IN2(\main/n53 ), .QN(\main/n100 ) );
  XNOR2X1 \main/U90  ( .IN1(\main/n56 ), .IN2(\main/n100 ), .Q(\main/n98 ) );
  NAND2X0 \main/U89  ( .IN1(\main/n98 ), .IN2(\main/n99 ), .QN(\main/n92 ) );
  AO22X1 \main/U88  ( .IN1(N80), .IN2(\main/n96 ), .IN3(N93), .IN4(\main/n97 ), 
        .Q(\main/n95 ) );
  AO221X1 \main/U87  ( .IN1(N67), .IN2(\main/n93 ), .IN3(N55), .IN4(\main/n94 ), .IN5(\main/n95 ), .Q(\main/n74 ) );
  XNOR2X1 \main/U86  ( .IN1(\main/n92 ), .IN2(\main/n74 ), .Q(N3546) );
  AO22X1 \main/U85  ( .IN1(N106), .IN2(\main/n90 ), .IN3(N142), .IN4(
        \main/n91 ), .Q(\main/n89 ) );
  AO221X1 \main/U84  ( .IN1(N118), .IN2(\main/n87 ), .IN3(N130), .IN4(
        \main/n88 ), .IN5(\main/n89 ), .Q(\main/n86 ) );
  XNOR2X1 \main/U83  ( .IN1(\main/n86 ), .IN2(\main/n14 ), .Q(\main/n85 ) );
  XNOR3X1 \main/U82  ( .IN1(N1817), .IN2(\main/n84 ), .IN3(\main/n85 ), .Q(
        \main/n80 ) );
  XNOR2X1 \main/U81  ( .IN1(\main/n59 ), .IN2(\main/n60 ), .Q(\main/n83 ) );
  XNOR3X1 \main/U80  ( .IN1(N1818), .IN2(\main/n82 ), .IN3(\main/n83 ), .Q(
        \main/n81 ) );
  XNOR3X1 \main/U79  ( .IN1(\main/n80 ), .IN2(\main/n81 ), .IN3(N1816), .Q(
        \main/n79 ) );
  INVX0 \main/U78  ( .INP(N37), .ZN(\main/n70 ) );
  NAND2X0 \main/U77  ( .IN1(\main/n79 ), .IN2(\main/n70 ), .QN(\main/n1 ) );
  INVX0 \main/U76  ( .INP(\main/n1 ), .ZN(N3671) );
  XNOR2X1 \main/U75  ( .IN1(\main/n53 ), .IN2(N2010), .Q(\main/n78 ) );
  XOR3X1 \main/U74  ( .IN1(\main/n56 ), .IN2(\main/n74 ), .IN3(\main/n78 ), 
        .Q(\main/n73 ) );
  XNOR2X1 \main/U73  ( .IN1(N1819), .IN2(\main/n31 ), .Q(\main/n77 ) );
  XOR3X1 \main/U72  ( .IN1(N2022), .IN2(N2020), .IN3(\main/n77 ), .Q(
        \main/n72 ) );
  XNOR3X1 \main/U71  ( .IN1(\main/n76 ), .IN2(\main/n73 ), .IN3(\main/n72 ), 
        .Q(\main/n75 ) );
  MUX21X1 \main/U70  ( .IN1(\main/n74 ), .IN2(\main/n75 ), .S(N246), .Q(N3803)
         );
  XNOR2X1 \main/U69  ( .IN1(\main/n72 ), .IN2(\main/n73 ), .Q(\main/n71 ) );
  XNOR3X1 \main/U68  ( .IN1(N2014), .IN2(N1821), .IN3(\main/n71 ), .Q(
        \main/n69 ) );
  NAND2X0 \main/U67  ( .IN1(\main/n69 ), .IN2(\main/n70 ), .QN(\main/n3 ) );
  INVX0 \main/U66  ( .INP(\main/n3 ), .ZN(N3809) );
  XOR2X1 \main/U65  ( .IN1(N305), .IN2(N301), .Q(\main/n65 ) );
  XOR2X1 \main/U64  ( .IN1(N297), .IN2(N294), .Q(\main/n66 ) );
  XNOR2X1 \main/U63  ( .IN1(N316), .IN2(N355), .Q(\main/n68 ) );
  XOR3X1 \main/U62  ( .IN1(N313), .IN2(N309), .IN3(\main/n68 ), .Q(\main/n67 )
         );
  XOR3X1 \main/U61  ( .IN1(\main/n65 ), .IN2(\main/n66 ), .IN3(\main/n67 ), 
        .Q(N2970) );
  INVX0 \main/U60  ( .INP(N262), .ZN(\main/n58 ) );
  NAND2X0 \main/U59  ( .IN1(\main/n57 ), .IN2(\main/n58 ), .QN(\main/n64 ) );
  NAND3X0 \main/U58  ( .IN1(N1816), .IN2(\main/n64 ), .IN3(N40), .QN(\main/n8 ) );
  INVX0 \main/U57  ( .INP(\main/n8 ), .ZN(\main/n15 ) );
  NAND3X0 \main/U56  ( .IN1(N294), .IN2(\main/n60 ), .IN3(\main/n15 ), .QN(
        \main/n13 ) );
  NAND3X0 \main/U55  ( .IN1(\main/n13 ), .IN2(\main/n62 ), .IN3(\main/n63 ), 
        .QN(\main/n61 ) );
  OA21X1 \main/U54  ( .IN1(N294), .IN2(\main/n60 ), .IN3(\main/n61 ), .Q(
        \main/n7 ) );
  NAND3X0 \main/U53  ( .IN1(N287), .IN2(\main/n59 ), .IN3(\main/n15 ), .QN(
        \main/n10 ) );
  NOR2X0 \main/U52  ( .IN1(N284), .IN2(\main/n14 ), .QN(\main/n16 ) );
  NAND3X0 \main/U51  ( .IN1(N281), .IN2(N2022), .IN3(\main/n15 ), .QN(
        \main/n17 ) );
  NOR2X0 \main/U50  ( .IN1(N281), .IN2(N2022), .QN(\main/n19 ) );
  NAND4X0 \main/U49  ( .IN1(N40), .IN2(N1816), .IN3(\main/n57 ), .IN4(
        \main/n58 ), .QN(\main/n45 ) );
  MUX21X1 \main/U48  ( .IN1(N294), .IN2(N259), .S(\main/n45 ), .Q(\main/n52 )
         );
  AO21X1 \main/U47  ( .IN1(\main/n53 ), .IN2(\main/n52 ), .IN3(\main/n56 ), 
        .Q(\main/n54 ) );
  MUX21X1 \main/U46  ( .IN1(N287), .IN2(N256), .S(\main/n45 ), .Q(\main/n55 )
         );
  OA22X1 \main/U45  ( .IN1(\main/n52 ), .IN2(\main/n53 ), .IN3(\main/n54 ), 
        .IN4(\main/n55 ), .Q(\main/n49 ) );
  OR2X1 \main/U44  ( .IN1(N2010), .IN2(\main/n49 ), .Q(\main/n50 ) );
  MUX21X1 \main/U43  ( .IN1(N297), .IN2(N263), .S(\main/n45 ), .Q(\main/n51 )
         );
  MUX21X1 \main/U42  ( .IN1(N301), .IN2(N266), .S(\main/n45 ), .Q(\main/n40 )
         );
  AOI222X1 \main/U41  ( .IN1(N2010), .IN2(\main/n49 ), .IN3(\main/n50 ), .IN4(
        \main/n51 ), .IN5(N2012), .IN6(\main/n40 ), .QN(\main/n20 ) );
  AND2X1 \main/U40  ( .IN1(N8), .IN2(\main/n45 ), .Q(\main/n25 ) );
  NAND2X0 \main/U39  ( .IN1(\main/n25 ), .IN2(\main/n48 ), .QN(\main/n28 ) );
  NAND3X0 \main/U38  ( .IN1(\main/n28 ), .IN2(N2020), .IN3(\main/n25 ), .QN(
        \main/n42 ) );
  NAND3X0 \main/U37  ( .IN1(N275), .IN2(N2018), .IN3(\main/n25 ), .QN(
        \main/n33 ) );
  INVX0 \main/U36  ( .INP(N272), .ZN(\main/n46 ) );
  NOR2X0 \main/U35  ( .IN1(N309), .IN2(\main/n45 ), .QN(\main/n47 ) );
  AOI22X1 \main/U34  ( .IN1(\main/n25 ), .IN2(\main/n46 ), .IN3(\main/n47 ), 
        .IN4(N8), .QN(\main/n36 ) );
  NAND3X0 \main/U33  ( .IN1(N8), .IN2(N2016), .IN3(\main/n36 ), .QN(\main/n34 ) );
  NOR2X0 \main/U32  ( .IN1(N305), .IN2(\main/n45 ), .QN(\main/n44 ) );
  AOI22X1 \main/U31  ( .IN1(\main/n25 ), .IN2(\main/n43 ), .IN3(\main/n44 ), 
        .IN4(N8), .QN(\main/n41 ) );
  NAND3X0 \main/U30  ( .IN1(N8), .IN2(N2014), .IN3(\main/n41 ), .QN(\main/n39 ) );
  AND4X1 \main/U29  ( .IN1(\main/n42 ), .IN2(\main/n33 ), .IN3(\main/n34 ), 
        .IN4(\main/n39 ), .Q(\main/n21 ) );
  OA22X1 \main/U28  ( .IN1(N2012), .IN2(\main/n40 ), .IN3(N2014), .IN4(
        \main/n41 ), .Q(\main/n37 ) );
  INVX0 \main/U27  ( .INP(\main/n39 ), .ZN(\main/n38 ) );
  OAI22X1 \main/U26  ( .IN1(N2016), .IN2(\main/n36 ), .IN3(\main/n37 ), .IN4(
        \main/n38 ), .QN(\main/n35 ) );
  NAND3X0 \main/U25  ( .IN1(\main/n33 ), .IN2(\main/n34 ), .IN3(\main/n35 ), 
        .QN(\main/n29 ) );
  NAND3X0 \main/U24  ( .IN1(\main/n31 ), .IN2(\main/n32 ), .IN3(\main/n25 ), 
        .QN(\main/n30 ) );
  NAND2X0 \main/U23  ( .IN1(\main/n29 ), .IN2(\main/n30 ), .QN(\main/n27 ) );
  INVX0 \main/U22  ( .INP(\main/n28 ), .ZN(\main/n26 ) );
  OR2X1 \main/U21  ( .IN1(\main/n27 ), .IN2(\main/n26 ), .Q(\main/n22 ) );
  NAND2X0 \main/U20  ( .IN1(\main/n26 ), .IN2(\main/n27 ), .QN(\main/n24 ) );
  NAND3X0 \main/U19  ( .IN1(\main/n24 ), .IN2(N2020), .IN3(\main/n25 ), .QN(
        \main/n23 ) );
  AO222X1 \main/U18  ( .IN1(\main/n19 ), .IN2(\main/n15 ), .IN3(\main/n20 ), 
        .IN4(\main/n21 ), .IN5(\main/n22 ), .IN6(\main/n23 ), .Q(\main/n18 )
         );
  AO22X1 \main/U17  ( .IN1(\main/n16 ), .IN2(\main/n15 ), .IN3(\main/n17 ), 
        .IN4(\main/n18 ), .Q(\main/n11 ) );
  NAND3X0 \main/U16  ( .IN1(N284), .IN2(\main/n14 ), .IN3(\main/n15 ), .QN(
        \main/n12 ) );
  NAND4X0 \main/U15  ( .IN1(\main/n10 ), .IN2(\main/n11 ), .IN3(\main/n12 ), 
        .IN4(\main/n13 ), .QN(\main/n9 ) );
  OAI21X1 \main/U14  ( .IN1(\main/n7 ), .IN2(\main/n8 ), .IN3(\main/n9 ), .QN(
        N3851) );
  NOR3X0 \main/U13  ( .IN1(\main/n5 ), .IN2(\main/n6 ), .IN3(N2970), .QN(
        \main/n4 ) );
  NAND4X0 \main/U12  ( .IN1(\main/n1 ), .IN2(\main/n2 ), .IN3(\main/n3 ), 
        .IN4(\main/n4 ), .QN(N3882) );
  INVX0 \main/U11  ( .INP(N3882), .ZN(N3881) );
  INVX0 \main/U10  ( .INP(N44), .ZN(N487) );
  INVX0 \main/U9  ( .INP(N132), .ZN(N488) );
  INVX0 \main/U8  ( .INP(N82), .ZN(N489) );
  INVX0 \main/U7  ( .INP(N96), .ZN(N490) );
  INVX0 \main/U6  ( .INP(N69), .ZN(N491) );
  INVX0 \main/U5  ( .INP(N120), .ZN(N492) );
  INVX0 \main/U4  ( .INP(N57), .ZN(N493) );
  INVX0 \main/U3  ( .INP(N108), .ZN(N494) );
  NAND4X0 \main/U2  ( .IN1(N309), .IN2(N305), .IN3(N301), .IN4(N297), .QN(N792) );
  NAND3X0 \main/U1  ( .IN1(N2), .IN2(N15), .IN3(N237), .QN(N799) );
  XNOR2X1 \flip/U13  ( .IN1(N352), .IN2(keyinput5), .Q(\flip/n1 ) );
  XOR2X1 \flip/U12  ( .IN1(keyinput6), .IN2(N281), .Q(\flip/n5 ) );
  XNOR2X1 \flip/U11  ( .IN1(N352), .IN2(keyinput1), .Q(\flip/n7 ) );
  XOR2X1 \flip/U10  ( .IN1(keyinput3), .IN2(N284), .Q(\flip/n8 ) );
  XOR2X1 \flip/U9  ( .IN1(keyinput2), .IN2(N281), .Q(\flip/n9 ) );
  XOR2X1 \flip/U8  ( .IN1(keyinput0), .IN2(N272), .Q(\flip/n10 ) );
  NAND4X0 \flip/U7  ( .IN1(\flip/n7 ), .IN2(\flip/n8 ), .IN3(\flip/n9 ), .IN4(
        \flip/n10 ), .QN(\flip/n6 ) );
  NAND2X0 \flip/U6  ( .IN1(\flip/n5 ), .IN2(\flip/n6 ), .QN(\flip/n2 ) );
  XOR2X1 \flip/U5  ( .IN1(keyinput4), .IN2(N272), .Q(\flip/n3 ) );
  XOR2X1 \flip/U4  ( .IN1(keyinput7), .IN2(N284), .Q(\flip/n4 ) );
  NOR4X0 \flip/U3  ( .IN1(\flip/n1 ), .IN2(\flip/n2 ), .IN3(\flip/n3 ), .IN4(
        \flip/n4 ), .QN(flip_signal) );
endmodule

