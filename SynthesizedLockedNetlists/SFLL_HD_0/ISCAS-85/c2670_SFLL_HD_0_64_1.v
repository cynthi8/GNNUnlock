/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr  8 02:38:01 2021
/////////////////////////////////////////////////////////////


module c2670_SFLL_HD_0_64_1_top ( N145, N153, N162, N168, N172, N210, N190, 
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
        keyinput13, keyinput14, keyinput15, keyinput16, keyinput17, keyinput18, 
        keyinput19, keyinput20, keyinput21, keyinput22, keyinput23, keyinput24, 
        keyinput25, keyinput26, keyinput27, keyinput28, keyinput29, keyinput30, 
        keyinput31, keyinput32, keyinput33, keyinput34, keyinput35, keyinput36, 
        keyinput37, keyinput38, keyinput39, keyinput40, keyinput41, keyinput42, 
        keyinput43, keyinput44, keyinput45, keyinput46, keyinput47, keyinput48, 
        keyinput49, keyinput50, keyinput51, keyinput52, keyinput53, keyinput54, 
        keyinput55, keyinput56, keyinput57, keyinput58, keyinput59, keyinput60, 
        keyinput61, keyinput62, keyinput63, N2016, N3803, N214_BUFF, N217_BUFF, 
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
         keyinput15, keyinput16, keyinput17, keyinput18, keyinput19,
         keyinput20, keyinput21, keyinput22, keyinput23, keyinput24,
         keyinput25, keyinput26, keyinput27, keyinput28, keyinput29,
         keyinput30, keyinput31, keyinput32, keyinput33, keyinput34,
         keyinput35, keyinput36, keyinput37, keyinput38, keyinput39,
         keyinput40, keyinput41, keyinput42, keyinput43, keyinput44,
         keyinput45, keyinput46, keyinput47, keyinput48, keyinput49,
         keyinput50, keyinput51, keyinput52, keyinput53, keyinput54,
         keyinput55, keyinput56, keyinput57, keyinput58, keyinput59,
         keyinput60, keyinput61, keyinput62, keyinput63;
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
         restore_signal, \main/n184 , \main/n183 , \main/n182 , \main/n181 ,
         \main/n180 , \main/n179 , \main/n178 , \main/n177 , \main/n176 ,
         \main/n175 , \main/n174 , \main/n173 , \main/n172 , \main/n171 ,
         \main/n170 , \main/n169 , \main/n168 , \main/n167 , \main/n166 ,
         \main/n165 , \main/n164 , \main/n163 , \main/n162 , \main/n161 ,
         \main/n160 , \main/n159 , \main/n158 , \main/n157 , \main/n156 ,
         \main/n155 , \main/n154 , \main/n153 , \main/n152 , \main/n151 ,
         \main/n150 , \main/n149 , \main/n148 , \main/n147 , \main/n146 ,
         \main/n145 , \main/n144 , \main/n143 , \main/n142 , \main/n141 ,
         \main/n140 , \main/n139 , \main/n138 , \main/n137 , \main/n136 ,
         \main/n135 , \main/n134 , \main/n133 , \main/n132 , \main/n131 ,
         \main/n130 , \main/n129 , \main/n128 , \main/n127 , \main/n126 ,
         \main/n125 , \main/n124 , \main/n123 , \main/n122 , \main/n121 ,
         \main/n120 , \main/n119 , \main/n118 , \main/n117 , \main/n116 ,
         \main/n115 , \main/n114 , \main/n113 , \main/n112 , \main/n111 ,
         \main/n110 , \main/n109 , \main/n108 , \main/n107 , \main/n106 ,
         \main/n105 , \main/n104 , \main/n103 , \main/n102 , \main/n101 ,
         \main/n100 , \main/n99 , \main/n98 , \main/n97 , \main/n96 ,
         \main/n95 , \main/n94 , \main/n93 , \main/n92 , \main/n91 ,
         \main/n90 , \main/n89 , \main/n88 , \main/n87 , \main/n86 ,
         \main/n85 , \main/n84 , \main/n83 , \main/n82 , \main/n81 ,
         \main/n80 , \main/n79 , \main/n78 , \main/n77 , \main/n76 ,
         \main/n75 , \main/n74 , \main/n73 , \main/n72 , \main/n71 ,
         \main/n70 , \main/n69 , \main/n68 , \main/n67 , \main/n66 ,
         \main/n65 , \main/n64 , \main/n63 , \main/n62 , \main/n61 ,
         \main/n60 , \main/n59 , \main/n58 , \main/n57 , \main/n56 ,
         \main/n55 , \main/n54 , \main/n53 , \main/n52 , \main/n51 ,
         \main/n50 , \main/n49 , \main/n48 , \main/n47 , \main/n46 ,
         \main/n45 , \main/n44 , \main/n43 , \main/n42 , \main/n41 ,
         \main/n40 , \main/n39 , \main/n38 , \main/n37 , \main/n36 ,
         \main/n35 , \main/n34 , \main/n33 , \main/n32 , \main/n31 ,
         \main/n30 , \main/n29 , \main/n28 , \main/n27 , \main/n26 ,
         \main/n25 , \main/n24 , \main/n23 , \main/n22 , \main/n21 ,
         \main/n20 , \main/n19 , \main/n18 , \main/n17 , \main/n16 ,
         \main/n15 , \main/n14 , \main/n13 , \main/n12 , \main/n11 ,
         \main/n10 , \main/n9 , \main/n8 , \main/n7 , \main/n6 , \main/n5 ,
         \main/n4 , \main/n3 , \main/n2 , \main/n1 , \perturb/n21 ,
         \perturb/n20 , \perturb/n19 , \perturb/n18 , \perturb/n17 ,
         \perturb/n16 , \perturb/n15 , \perturb/n14 , \perturb/n13 ,
         \perturb/n12 , \perturb/n11 , \perturb/n10 , \perturb/n9 ,
         \perturb/n8 , \perturb/n7 , \perturb/n6 , \perturb/n5 , \perturb/n4 ,
         \perturb/n3 , \perturb/n2 , \perturb/n1 , \restore/n84 ,
         \restore/n83 , \restore/n82 , \restore/n81 , \restore/n80 ,
         \restore/n79 , \restore/n78 , \restore/n77 , \restore/n76 ,
         \restore/n75 , \restore/n74 , \restore/n73 , \restore/n72 ,
         \restore/n71 , \restore/n70 , \restore/n69 , \restore/n68 ,
         \restore/n67 , \restore/n66 , \restore/n65 , \restore/n64 ,
         \restore/n63 , \restore/n62 , \restore/n61 , \restore/n60 ,
         \restore/n59 , \restore/n58 , \restore/n57 , \restore/n56 ,
         \restore/n55 , \restore/n54 , \restore/n53 , \restore/n52 ,
         \restore/n51 , \restore/n50 , \restore/n49 , \restore/n48 ,
         \restore/n47 , \restore/n46 , \restore/n45 , \restore/n44 ,
         \restore/n43 , \restore/n42 , \restore/n41 , \restore/n40 ,
         \restore/n39 , \restore/n38 , \restore/n37 , \restore/n36 ,
         \restore/n35 , \restore/n34 , \restore/n33 , \restore/n32 ,
         \restore/n31 , \restore/n30 , \restore/n29 , \restore/n28 ,
         \restore/n27 , \restore/n26 , \restore/n25 , \restore/n24 ,
         \restore/n23 , \restore/n22 , \restore/n21 , \restore/n20 ,
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

  AND2X1 \main/U234  ( .IN1(N94), .IN2(N398), .Q(N1026) );
  NAND2X0 \main/U233  ( .IN1(N7), .IN2(N237), .QN(N1028) );
  INVX0 \main/U232  ( .INP(N1028), .ZN(\main/n184 ) );
  NAND2X0 \main/U231  ( .IN1(N231), .IN2(\main/n184 ), .QN(N1029) );
  NAND4X0 \main/U230  ( .IN1(N132), .IN2(N96), .IN3(N82), .IN4(N44), .QN(
        \main/n172 ) );
  NAND4X0 \main/U229  ( .IN1(N120), .IN2(N108), .IN3(N69), .IN4(N57), .QN(
        \main/n173 ) );
  NOR2X0 \main/U228  ( .IN1(\main/n172 ), .IN2(\main/n173 ), .QN(N1277) );
  NAND2X0 \main/U227  ( .IN1(N325), .IN2(\main/n184 ), .QN(N1269) );
  INVX0 \main/U226  ( .INP(N234), .ZN(\main/n183 ) );
  NOR2X0 \main/U225  ( .IN1(\main/n183 ), .IN2(N227), .QN(\main/n103 ) );
  INVX0 \main/U224  ( .INP(N227), .ZN(\main/n177 ) );
  NOR2X0 \main/U223  ( .IN1(\main/n177 ), .IN2(N234), .QN(\main/n104 ) );
  NOR2X0 \main/U222  ( .IN1(\main/n183 ), .IN2(\main/n177 ), .QN(\main/n106 )
         );
  NOR2X0 \main/U221  ( .IN1(N227), .IN2(N234), .QN(\main/n107 ) );
  AO22X1 \main/U220  ( .IN1(N78), .IN2(\main/n106 ), .IN3(N91), .IN4(
        \main/n107 ), .Q(\main/n182 ) );
  AO221X1 \main/U219  ( .IN1(N65), .IN2(\main/n103 ), .IN3(N53), .IN4(
        \main/n104 ), .IN5(\main/n182 ), .Q(N2010) );
  AO22X1 \main/U218  ( .IN1(N77), .IN2(\main/n106 ), .IN3(N90), .IN4(
        \main/n107 ), .Q(\main/n181 ) );
  AO221X1 \main/U217  ( .IN1(N64), .IN2(\main/n103 ), .IN3(N52), .IN4(
        \main/n104 ), .IN5(\main/n181 ), .Q(N2012) );
  AO22X1 \main/U216  ( .IN1(N76), .IN2(\main/n106 ), .IN3(N89), .IN4(
        \main/n107 ), .Q(\main/n180 ) );
  AO221X1 \main/U215  ( .IN1(N63), .IN2(\main/n103 ), .IN3(N51), .IN4(
        \main/n104 ), .IN5(\main/n180 ), .Q(N2014) );
  AO22X1 \main/U214  ( .IN1(N75), .IN2(\main/n106 ), .IN3(N88), .IN4(
        \main/n107 ), .Q(\main/n179 ) );
  AO221X1 \main/U213  ( .IN1(N62), .IN2(\main/n103 ), .IN3(N50), .IN4(
        \main/n104 ), .IN5(\main/n179 ), .Q(N2016) );
  AO21X1 \main/U212  ( .IN1(N49), .IN2(\main/n104 ), .IN3(\main/n103 ), .Q(
        \main/n178 ) );
  AO221X1 \main/U211  ( .IN1(N87), .IN2(\main/n177 ), .IN3(N74), .IN4(N234), 
        .IN5(\main/n178 ), .Q(N2018) );
  AO22X1 \main/U210  ( .IN1(N73), .IN2(\main/n106 ), .IN3(N86), .IN4(
        \main/n107 ), .Q(\main/n176 ) );
  AO221X1 \main/U209  ( .IN1(N61), .IN2(\main/n103 ), .IN3(N48), .IN4(
        \main/n104 ), .IN5(\main/n176 ), .Q(N2020) );
  AO22X1 \main/U208  ( .IN1(N72), .IN2(\main/n106 ), .IN3(N85), .IN4(
        \main/n107 ), .Q(\main/n175 ) );
  AO221X1 \main/U207  ( .IN1(N60), .IN2(\main/n103 ), .IN3(N47), .IN4(
        \main/n104 ), .IN5(\main/n175 ), .Q(N2022) );
  AO22X1 \main/U206  ( .IN1(N68), .IN2(\main/n106 ), .IN3(N81), .IN4(
        \main/n107 ), .Q(\main/n174 ) );
  AO221X1 \main/U205  ( .IN1(N56), .IN2(\main/n103 ), .IN3(N43), .IN4(
        \main/n104 ), .IN5(\main/n174 ), .Q(\main/n80 ) );
  INVX0 \main/U204  ( .INP(\main/n80 ), .ZN(\main/n100 ) );
  NAND2X0 \main/U203  ( .IN1(N241), .IN2(\main/n100 ), .QN(N1969) );
  AO22X1 \main/U202  ( .IN1(N325), .IN2(\main/n172 ), .IN3(N231), .IN4(
        \main/n173 ), .Q(\main/n5 ) );
  INVX0 \main/U201  ( .INP(\main/n5 ), .ZN(N1726) );
  NAND3X0 \main/U200  ( .IN1(N237), .IN2(N1726), .IN3(N224), .QN(\main/n170 )
         );
  INVX0 \main/U199  ( .INP(\main/n170 ), .ZN(\main/n171 ) );
  NAND2X0 \main/U198  ( .IN1(N36), .IN2(\main/n171 ), .QN(N1970) );
  AO21X1 \main/U197  ( .IN1(N3), .IN2(N1), .IN3(\main/n170 ), .Q(N1971) );
  AO22X1 \main/U196  ( .IN1(N79), .IN2(\main/n106 ), .IN3(N92), .IN4(
        \main/n107 ), .Q(\main/n169 ) );
  AO221X1 \main/U195  ( .IN1(N66), .IN2(\main/n103 ), .IN3(N54), .IN4(
        \main/n104 ), .IN5(\main/n169 ), .Q(\main/n77 ) );
  MUX21X1 \main/U194  ( .IN1(\main/n77 ), .IN2(N2012), .S(N246), .Q(N2387) );
  MUX21X1 \main/U193  ( .IN1(N2010), .IN2(N2014), .S(N246), .Q(N2389) );
  NOR2X0 \main/U192  ( .IN1(N230), .IN2(\main/n77 ), .QN(\main/n111 ) );
  INVX0 \main/U191  ( .INP(\main/n111 ), .ZN(\main/n98 ) );
  INVX0 \main/U190  ( .INP(N241), .ZN(\main/n109 ) );
  AO21X1 \main/U189  ( .IN1(\main/n98 ), .IN2(\main/n109 ), .IN3(\main/n77 ), 
        .Q(N2496) );
  MUX21X1 \main/U188  ( .IN1(\main/n80 ), .IN2(\main/n98 ), .S(N246), .Q(N2643) );
  INVX0 \main/U187  ( .INP(N322), .ZN(\main/n168 ) );
  INVX0 \main/U186  ( .INP(N319), .ZN(\main/n167 ) );
  NOR2X0 \main/U185  ( .IN1(\main/n168 ), .IN2(\main/n167 ), .QN(\main/n28 )
         );
  NOR2X0 \main/U184  ( .IN1(\main/n168 ), .IN2(N319), .QN(\main/n29 ) );
  NOR2X0 \main/U183  ( .IN1(\main/n167 ), .IN2(N322), .QN(\main/n31 ) );
  NOR2X0 \main/U182  ( .IN1(N319), .IN2(N322), .QN(\main/n32 ) );
  AO22X1 \main/U181  ( .IN1(N99), .IN2(\main/n31 ), .IN3(N135), .IN4(
        \main/n32 ), .Q(\main/n166 ) );
  AO221X1 \main/U180  ( .IN1(N111), .IN2(\main/n28 ), .IN3(N123), .IN4(
        \main/n29 ), .IN5(\main/n166 ), .Q(\main/n20 ) );
  XOR2X1 \main/U179  ( .IN1(\main/n20 ), .IN2(N313), .Q(\main/n165 ) );
  INVX0 \main/U178  ( .INP(N316), .ZN(\main/n90 ) );
  NAND2X0 \main/U177  ( .IN1(\main/n165 ), .IN2(\main/n90 ), .QN(N2891) );
  XOR2X1 \main/U176  ( .IN1(N32), .IN2(N287), .Q(\main/n161 ) );
  XOR2X1 \main/U175  ( .IN1(N301), .IN2(N27), .Q(\main/n162 ) );
  XOR2X1 \main/U174  ( .IN1(N294), .IN2(N26), .Q(\main/n163 ) );
  XOR2X1 \main/U173  ( .IN1(N284), .IN2(N25), .Q(\main/n164 ) );
  NAND4X0 \main/U172  ( .IN1(\main/n161 ), .IN2(\main/n162 ), .IN3(\main/n163 ), .IN4(\main/n164 ), .QN(\main/n156 ) );
  XOR2X1 \main/U171  ( .IN1(N35), .IN2(N309), .Q(\main/n158 ) );
  XOR2X1 \main/U170  ( .IN1(N34), .IN2(N305), .Q(\main/n159 ) );
  XOR2X1 \main/U169  ( .IN1(N33), .IN2(N297), .Q(\main/n160 ) );
  NAND4X0 \main/U168  ( .IN1(N28), .IN2(\main/n158 ), .IN3(\main/n159 ), .IN4(
        \main/n160 ), .QN(\main/n157 ) );
  NOR2X0 \main/U167  ( .IN1(\main/n156 ), .IN2(\main/n157 ), .QN(\main/n138 )
         );
  AO22X1 \main/U166  ( .IN1(N104), .IN2(\main/n31 ), .IN3(N140), .IN4(
        \main/n32 ), .Q(\main/n155 ) );
  AO221X1 \main/U165  ( .IN1(N116), .IN2(\main/n28 ), .IN3(N128), .IN4(
        \main/n29 ), .IN5(\main/n155 ), .Q(\main/n23 ) );
  XOR2X1 \main/U164  ( .IN1(\main/n23 ), .IN2(N294), .Q(\main/n150 ) );
  AO22X1 \main/U163  ( .IN1(N103), .IN2(\main/n31 ), .IN3(N139), .IN4(
        \main/n32 ), .Q(\main/n154 ) );
  AO221X1 \main/U162  ( .IN1(N115), .IN2(\main/n28 ), .IN3(N127), .IN4(
        \main/n29 ), .IN5(\main/n154 ), .Q(\main/n21 ) );
  XOR2X1 \main/U161  ( .IN1(\main/n21 ), .IN2(N297), .Q(\main/n151 ) );
  AO22X1 \main/U160  ( .IN1(N95), .IN2(\main/n31 ), .IN3(N131), .IN4(
        \main/n32 ), .Q(\main/n153 ) );
  AO221X1 \main/U159  ( .IN1(N107), .IN2(\main/n28 ), .IN3(N119), .IN4(
        \main/n29 ), .IN5(\main/n153 ), .Q(\main/n25 ) );
  XOR2X1 \main/U158  ( .IN1(\main/n25 ), .IN2(N284), .Q(\main/n152 ) );
  NAND4X0 \main/U157  ( .IN1(\main/n150 ), .IN2(\main/n151 ), .IN3(\main/n152 ), .IN4(\main/n20 ), .QN(\main/n140 ) );
  AO22X1 \main/U156  ( .IN1(N100), .IN2(\main/n31 ), .IN3(N136), .IN4(
        \main/n32 ), .Q(\main/n149 ) );
  AOI221X1 \main/U155  ( .IN1(N112), .IN2(\main/n28 ), .IN3(N124), .IN4(
        \main/n29 ), .IN5(\main/n149 ), .QN(N1817) );
  XNOR2X1 \main/U154  ( .IN1(N1817), .IN2(N309), .Q(\main/n142 ) );
  AO22X1 \main/U153  ( .IN1(N101), .IN2(\main/n31 ), .IN3(N137), .IN4(
        \main/n32 ), .Q(\main/n148 ) );
  AOI221X1 \main/U152  ( .IN1(N113), .IN2(\main/n28 ), .IN3(N125), .IN4(
        \main/n29 ), .IN5(\main/n148 ), .QN(N1816) );
  XNOR2X1 \main/U151  ( .IN1(N1816), .IN2(N305), .Q(\main/n143 ) );
  AO22X1 \main/U150  ( .IN1(N102), .IN2(\main/n31 ), .IN3(N138), .IN4(
        \main/n32 ), .Q(\main/n147 ) );
  AOI221X1 \main/U149  ( .IN1(N114), .IN2(\main/n28 ), .IN3(N126), .IN4(
        \main/n29 ), .IN5(\main/n147 ), .QN(N1818) );
  XNOR2X1 \main/U148  ( .IN1(N1818), .IN2(N301), .Q(\main/n144 ) );
  AO22X1 \main/U147  ( .IN1(N105), .IN2(\main/n31 ), .IN3(N141), .IN4(
        \main/n32 ), .Q(\main/n146 ) );
  AO221X1 \main/U146  ( .IN1(N117), .IN2(\main/n28 ), .IN3(N129), .IN4(
        \main/n29 ), .IN5(\main/n146 ), .Q(\main/n82 ) );
  XOR2X1 \main/U145  ( .IN1(\main/n82 ), .IN2(N287), .Q(\main/n145 ) );
  NAND4X0 \main/U144  ( .IN1(\main/n142 ), .IN2(\main/n143 ), .IN3(\main/n144 ), .IN4(\main/n145 ), .QN(\main/n141 ) );
  NOR2X0 \main/U143  ( .IN1(\main/n140 ), .IN2(\main/n141 ), .QN(\main/n139 )
         );
  MUX21X1 \main/U142  ( .IN1(\main/n138 ), .IN2(\main/n139 ), .S(N29), .Q(
        \main/n112 ) );
  XOR2X1 \main/U141  ( .IN1(N6), .IN2(N278), .Q(\main/n134 ) );
  XOR2X1 \main/U140  ( .IN1(N5), .IN2(N266), .Q(\main/n135 ) );
  XOR2X1 \main/U139  ( .IN1(N4), .IN2(N259), .Q(\main/n136 ) );
  XOR2X1 \main/U138  ( .IN1(N281), .IN2(N24), .Q(\main/n137 ) );
  NAND4X0 \main/U137  ( .IN1(\main/n134 ), .IN2(\main/n135 ), .IN3(\main/n136 ), .IN4(\main/n137 ), .QN(\main/n127 ) );
  XOR2X1 \main/U136  ( .IN1(N256), .IN2(N19), .Q(\main/n131 ) );
  XOR2X1 \main/U135  ( .IN1(N269), .IN2(N21), .Q(\main/n132 ) );
  XOR2X1 \main/U134  ( .IN1(N263), .IN2(N20), .Q(\main/n133 ) );
  NAND3X0 \main/U133  ( .IN1(\main/n131 ), .IN2(\main/n132 ), .IN3(\main/n133 ), .QN(\main/n128 ) );
  INVX0 \main/U132  ( .INP(N272), .ZN(\main/n68 ) );
  XOR2X1 \main/U131  ( .IN1(\main/n68 ), .IN2(N22), .Q(\main/n129 ) );
  XNOR2X1 \main/U130  ( .IN1(N275), .IN2(N23), .Q(\main/n130 ) );
  NOR4X0 \main/U129  ( .IN1(\main/n127 ), .IN2(\main/n128 ), .IN3(\main/n129 ), 
        .IN4(\main/n130 ), .QN(\main/n114 ) );
  XOR2X1 \main/U128  ( .IN1(N2022), .IN2(N281), .Q(\main/n123 ) );
  XOR2X1 \main/U127  ( .IN1(N2020), .IN2(N278), .Q(\main/n124 ) );
  XOR2X1 \main/U126  ( .IN1(N2018), .IN2(N275), .Q(\main/n125 ) );
  XOR2X1 \main/U125  ( .IN1(N2016), .IN2(N272), .Q(\main/n126 ) );
  NAND4X0 \main/U124  ( .IN1(\main/n123 ), .IN2(\main/n124 ), .IN3(\main/n125 ), .IN4(\main/n126 ), .QN(\main/n116 ) );
  XOR2X1 \main/U123  ( .IN1(\main/n77 ), .IN2(N259), .Q(\main/n120 ) );
  XOR2X1 \main/U122  ( .IN1(N2010), .IN2(N263), .Q(\main/n121 ) );
  XOR2X1 \main/U121  ( .IN1(\main/n80 ), .IN2(N256), .Q(\main/n122 ) );
  NAND3X0 \main/U120  ( .IN1(\main/n120 ), .IN2(\main/n121 ), .IN3(\main/n122 ), .QN(\main/n117 ) );
  INVX0 \main/U119  ( .INP(N266), .ZN(\main/n94 ) );
  XOR2X1 \main/U118  ( .IN1(\main/n94 ), .IN2(N2012), .Q(\main/n118 ) );
  INVX0 \main/U117  ( .INP(N269), .ZN(\main/n71 ) );
  XOR2X1 \main/U116  ( .IN1(\main/n71 ), .IN2(N2014), .Q(\main/n119 ) );
  NOR4X0 \main/U115  ( .IN1(\main/n116 ), .IN2(\main/n117 ), .IN3(\main/n118 ), 
        .IN4(\main/n119 ), .QN(\main/n115 ) );
  MUX21X1 \main/U114  ( .IN1(\main/n114 ), .IN2(\main/n115 ), .S(N16), .Q(
        \main/n113 ) );
  NAND3X0 \main/U113  ( .IN1(\main/n112 ), .IN2(N11), .IN3(\main/n113 ), .QN(
        N3079) );
  XNOR3X1 \main/U112  ( .IN1(restore_signal), .IN2(perturb_signal), .IN3(N3079), .Q(N3038) );
  NOR2X0 \main/U111  ( .IN1(\main/n111 ), .IN2(\main/n77 ), .QN(\main/n110 )
         );
  XOR2X1 \main/U110  ( .IN1(\main/n100 ), .IN2(\main/n110 ), .Q(\main/n108 )
         );
  NAND2X0 \main/U109  ( .IN1(\main/n108 ), .IN2(\main/n109 ), .QN(\main/n102 )
         );
  AO22X1 \main/U108  ( .IN1(N80), .IN2(\main/n106 ), .IN3(N93), .IN4(
        \main/n107 ), .Q(\main/n105 ) );
  AO221X1 \main/U107  ( .IN1(N67), .IN2(\main/n103 ), .IN3(N55), .IN4(
        \main/n104 ), .IN5(\main/n105 ), .Q(\main/n96 ) );
  XNOR2X1 \main/U106  ( .IN1(\main/n102 ), .IN2(\main/n96 ), .Q(N3546) );
  XNOR2X1 \main/U105  ( .IN1(\main/n77 ), .IN2(N2010), .Q(\main/n101 ) );
  XNOR3X1 \main/U104  ( .IN1(\main/n100 ), .IN2(\main/n96 ), .IN3(\main/n101 ), 
        .Q(\main/n10 ) );
  INVX0 \main/U103  ( .INP(N2016), .ZN(N1819) );
  XOR2X1 \main/U102  ( .IN1(N1819), .IN2(N2018), .Q(\main/n99 ) );
  XOR3X1 \main/U101  ( .IN1(N2022), .IN2(N2020), .IN3(\main/n99 ), .Q(
        \main/n9 ) );
  XOR3X1 \main/U100  ( .IN1(\main/n98 ), .IN2(\main/n10 ), .IN3(\main/n9 ), 
        .Q(\main/n97 ) );
  MUX21X1 \main/U99  ( .IN1(\main/n96 ), .IN2(\main/n97 ), .S(N246), .Q(N3803)
         );
  XOR2X1 \main/U98  ( .IN1(N352), .IN2(N287), .Q(\main/n95 ) );
  XOR3X1 \main/U97  ( .IN1(N284), .IN2(N278), .IN3(\main/n95 ), .Q(\main/n92 )
         );
  XOR3X1 \main/U96  ( .IN1(N275), .IN2(N272), .IN3(N263), .Q(\main/n93 ) );
  XOR3X1 \main/U95  ( .IN1(\main/n92 ), .IN2(\main/n93 ), .IN3(\main/n94 ), 
        .Q(\main/n91 ) );
  XOR3X1 \main/U94  ( .IN1(N281), .IN2(N269), .IN3(\main/n91 ), .Q(N2971) );
  XOR2X1 \main/U93  ( .IN1(N305), .IN2(N301), .Q(\main/n86 ) );
  XOR2X1 \main/U92  ( .IN1(N297), .IN2(N294), .Q(\main/n87 ) );
  XOR2X1 \main/U91  ( .IN1(\main/n90 ), .IN2(N355), .Q(\main/n89 ) );
  XOR3X1 \main/U90  ( .IN1(N313), .IN2(N309), .IN3(\main/n89 ), .Q(\main/n88 )
         );
  XOR3X1 \main/U89  ( .IN1(\main/n86 ), .IN2(\main/n87 ), .IN3(\main/n88 ), 
        .Q(N2970) );
  NOR2X0 \main/U88  ( .IN1(N1818), .IN2(N262), .QN(\main/n81 ) );
  INVX0 \main/U87  ( .INP(\main/n81 ), .ZN(\main/n85 ) );
  NAND3X0 \main/U86  ( .IN1(N1816), .IN2(\main/n85 ), .IN3(N40), .QN(
        \main/n34 ) );
  INVX0 \main/U85  ( .INP(\main/n34 ), .ZN(\main/n40 ) );
  NAND3X0 \main/U84  ( .IN1(N294), .IN2(\main/n23 ), .IN3(\main/n40 ), .QN(
        \main/n39 ) );
  INVX0 \main/U83  ( .INP(N287), .ZN(\main/n84 ) );
  INVX0 \main/U82  ( .INP(\main/n82 ), .ZN(\main/n24 ) );
  NAND3X0 \main/U81  ( .IN1(\main/n39 ), .IN2(\main/n84 ), .IN3(\main/n24 ), 
        .QN(\main/n83 ) );
  OA21X1 \main/U80  ( .IN1(N294), .IN2(\main/n23 ), .IN3(\main/n83 ), .Q(
        \main/n33 ) );
  NAND3X0 \main/U79  ( .IN1(N287), .IN2(\main/n82 ), .IN3(\main/n40 ), .QN(
        \main/n36 ) );
  NOR2X0 \main/U78  ( .IN1(N284), .IN2(\main/n25 ), .QN(\main/n41 ) );
  NAND3X0 \main/U77  ( .IN1(N281), .IN2(N2022), .IN3(\main/n40 ), .QN(
        \main/n42 ) );
  NOR2X0 \main/U76  ( .IN1(N281), .IN2(N2022), .QN(\main/n44 ) );
  NAND3X0 \main/U75  ( .IN1(N40), .IN2(N1816), .IN3(\main/n81 ), .QN(
        \main/n70 ) );
  MUX21X1 \main/U74  ( .IN1(N294), .IN2(N259), .S(\main/n70 ), .Q(\main/n76 )
         );
  AO21X1 \main/U73  ( .IN1(\main/n77 ), .IN2(\main/n76 ), .IN3(\main/n80 ), 
        .Q(\main/n78 ) );
  MUX21X1 \main/U72  ( .IN1(N287), .IN2(N256), .S(\main/n70 ), .Q(\main/n79 )
         );
  OA22X1 \main/U71  ( .IN1(\main/n76 ), .IN2(\main/n77 ), .IN3(\main/n78 ), 
        .IN4(\main/n79 ), .Q(\main/n73 ) );
  OR2X1 \main/U70  ( .IN1(N2010), .IN2(\main/n73 ), .Q(\main/n74 ) );
  MUX21X1 \main/U69  ( .IN1(N297), .IN2(N263), .S(\main/n70 ), .Q(\main/n75 )
         );
  MUX21X1 \main/U68  ( .IN1(N301), .IN2(N266), .S(\main/n70 ), .Q(\main/n62 )
         );
  AOI222X1 \main/U67  ( .IN1(N2010), .IN2(\main/n73 ), .IN3(\main/n74 ), .IN4(
        \main/n75 ), .IN5(N2012), .IN6(\main/n62 ), .QN(\main/n45 ) );
  NAND2X0 \main/U66  ( .IN1(N8), .IN2(\main/n70 ), .QN(\main/n55 ) );
  INVX0 \main/U65  ( .INP(\main/n55 ), .ZN(\main/n50 ) );
  NOR2X0 \main/U64  ( .IN1(N305), .IN2(\main/n70 ), .QN(\main/n72 ) );
  AOI22X1 \main/U63  ( .IN1(\main/n50 ), .IN2(\main/n71 ), .IN3(\main/n72 ), 
        .IN4(N8), .QN(\main/n63 ) );
  AND3X1 \main/U62  ( .IN1(N8), .IN2(N2014), .IN3(\main/n63 ), .Q(\main/n61 )
         );
  NOR2X0 \main/U61  ( .IN1(N309), .IN2(\main/n70 ), .QN(\main/n69 ) );
  AOI22X1 \main/U60  ( .IN1(\main/n50 ), .IN2(\main/n68 ), .IN3(\main/n69 ), 
        .IN4(N8), .QN(\main/n59 ) );
  NAND3X0 \main/U59  ( .IN1(N8), .IN2(N2016), .IN3(\main/n59 ), .QN(\main/n57 ) );
  INVX0 \main/U58  ( .INP(\main/n57 ), .ZN(\main/n64 ) );
  NAND3X0 \main/U57  ( .IN1(N275), .IN2(N2018), .IN3(\main/n50 ), .QN(
        \main/n56 ) );
  INVX0 \main/U56  ( .INP(\main/n56 ), .ZN(\main/n65 ) );
  INVX0 \main/U55  ( .INP(N2020), .ZN(\main/n67 ) );
  NOR2X0 \main/U54  ( .IN1(\main/n55 ), .IN2(N278), .QN(\main/n51 ) );
  NOR3X0 \main/U53  ( .IN1(\main/n55 ), .IN2(\main/n67 ), .IN3(\main/n51 ), 
        .QN(\main/n66 ) );
  NOR4X0 \main/U52  ( .IN1(\main/n61 ), .IN2(\main/n64 ), .IN3(\main/n65 ), 
        .IN4(\main/n66 ), .QN(\main/n46 ) );
  OA22X1 \main/U51  ( .IN1(N2012), .IN2(\main/n62 ), .IN3(N2014), .IN4(
        \main/n63 ), .Q(\main/n60 ) );
  OAI22X1 \main/U50  ( .IN1(N2016), .IN2(\main/n59 ), .IN3(\main/n60 ), .IN4(
        \main/n61 ), .QN(\main/n58 ) );
  NAND3X0 \main/U49  ( .IN1(\main/n56 ), .IN2(\main/n57 ), .IN3(\main/n58 ), 
        .QN(\main/n53 ) );
  OR3X1 \main/U48  ( .IN1(N2018), .IN2(N275), .IN3(\main/n55 ), .Q(\main/n54 )
         );
  NAND2X0 \main/U47  ( .IN1(\main/n53 ), .IN2(\main/n54 ), .QN(\main/n52 ) );
  OR2X1 \main/U46  ( .IN1(\main/n52 ), .IN2(\main/n51 ), .Q(\main/n47 ) );
  NAND2X0 \main/U45  ( .IN1(\main/n51 ), .IN2(\main/n52 ), .QN(\main/n49 ) );
  NAND3X0 \main/U44  ( .IN1(\main/n49 ), .IN2(N2020), .IN3(\main/n50 ), .QN(
        \main/n48 ) );
  AO222X1 \main/U43  ( .IN1(\main/n44 ), .IN2(\main/n40 ), .IN3(\main/n45 ), 
        .IN4(\main/n46 ), .IN5(\main/n47 ), .IN6(\main/n48 ), .Q(\main/n43 )
         );
  AO22X1 \main/U42  ( .IN1(\main/n41 ), .IN2(\main/n40 ), .IN3(\main/n42 ), 
        .IN4(\main/n43 ), .Q(\main/n37 ) );
  NAND3X0 \main/U41  ( .IN1(N284), .IN2(\main/n25 ), .IN3(\main/n40 ), .QN(
        \main/n38 ) );
  NAND4X0 \main/U40  ( .IN1(\main/n36 ), .IN2(\main/n37 ), .IN3(\main/n38 ), 
        .IN4(\main/n39 ), .QN(\main/n35 ) );
  OAI21X1 \main/U39  ( .IN1(\main/n33 ), .IN2(\main/n34 ), .IN3(\main/n35 ), 
        .QN(N3851) );
  AO22X1 \main/U38  ( .IN1(N106), .IN2(\main/n31 ), .IN3(N142), .IN4(
        \main/n32 ), .Q(\main/n30 ) );
  AO221X1 \main/U37  ( .IN1(N118), .IN2(\main/n28 ), .IN3(N130), .IN4(
        \main/n29 ), .IN5(\main/n30 ), .Q(\main/n26 ) );
  XNOR2X1 \main/U36  ( .IN1(N1816), .IN2(N1817), .Q(\main/n27 ) );
  XOR3X1 \main/U35  ( .IN1(\main/n25 ), .IN2(\main/n26 ), .IN3(\main/n27 ), 
        .Q(\main/n18 ) );
  XOR2X1 \main/U34  ( .IN1(\main/n23 ), .IN2(\main/n24 ), .Q(\main/n22 ) );
  XNOR3X1 \main/U33  ( .IN1(N1818), .IN2(\main/n21 ), .IN3(\main/n22 ), .Q(
        \main/n19 ) );
  XOR3X1 \main/U32  ( .IN1(\main/n18 ), .IN2(\main/n19 ), .IN3(\main/n20 ), 
        .Q(\main/n17 ) );
  INVX0 \main/U31  ( .INP(N37), .ZN(\main/n7 ) );
  NAND2X0 \main/U30  ( .IN1(\main/n17 ), .IN2(\main/n7 ), .QN(\main/n3 ) );
  XNOR2X1 \main/U29  ( .IN1(N337), .IN2(N334), .Q(\main/n16 ) );
  XOR3X1 \main/U28  ( .IN1(N331), .IN2(N328), .IN3(\main/n16 ), .Q(\main/n13 )
         );
  XOR2X1 \main/U27  ( .IN1(N349), .IN2(N346), .Q(\main/n15 ) );
  XOR3X1 \main/U26  ( .IN1(N343), .IN2(N340), .IN3(\main/n15 ), .Q(\main/n14 )
         );
  XOR2X1 \main/U25  ( .IN1(\main/n13 ), .IN2(\main/n14 ), .Q(\main/n12 ) );
  XOR3X1 \main/U24  ( .IN1(N259), .IN2(N256), .IN3(\main/n12 ), .Q(\main/n11 )
         );
  NAND2X0 \main/U23  ( .IN1(\main/n11 ), .IN2(N14), .QN(\main/n1 ) );
  INVX0 \main/U22  ( .INP(N2014), .ZN(N1820) );
  INVX0 \main/U21  ( .INP(N2012), .ZN(N1821) );
  XNOR2X1 \main/U20  ( .IN1(\main/n9 ), .IN2(\main/n10 ), .Q(\main/n8 ) );
  XOR3X1 \main/U19  ( .IN1(N1820), .IN2(N1821), .IN3(\main/n8 ), .Q(\main/n6 )
         );
  NAND2X0 \main/U18  ( .IN1(\main/n6 ), .IN2(\main/n7 ), .QN(\main/n2 ) );
  NOR3X0 \main/U17  ( .IN1(\main/n5 ), .IN2(N2970), .IN3(N2971), .QN(\main/n4 ) );
  NAND4X0 \main/U16  ( .IN1(\main/n3 ), .IN2(\main/n1 ), .IN3(\main/n2 ), 
        .IN4(\main/n4 ), .QN(N3882) );
  NAND4X0 \main/U15  ( .IN1(N297), .IN2(N301), .IN3(N305), .IN4(N309), .QN(
        N792) );
  NAND3X0 \main/U14  ( .IN1(N2), .IN2(N15), .IN3(N237), .QN(N799) );
  INVX0 \main/U13  ( .INP(N132), .ZN(N488) );
  INVX0 \main/U12  ( .INP(N120), .ZN(N492) );
  INVX0 \main/U11  ( .INP(N108), .ZN(N494) );
  INVX0 \main/U10  ( .INP(N96), .ZN(N490) );
  INVX0 \main/U9  ( .INP(N82), .ZN(N489) );
  INVX0 \main/U8  ( .INP(N69), .ZN(N491) );
  INVX0 \main/U7  ( .INP(N57), .ZN(N493) );
  INVX0 \main/U6  ( .INP(N1277), .ZN(N1448) );
  INVX0 \main/U5  ( .INP(N44), .ZN(N487) );
  INVX0 \main/U4  ( .INP(\main/n3 ), .ZN(N3671) );
  INVX0 \main/U3  ( .INP(\main/n2 ), .ZN(N3809) );
  INVX0 \main/U2  ( .INP(N3882), .ZN(N3881) );
  INVX0 \main/U1  ( .INP(\main/n1 ), .ZN(N2925) );
  NOR4X0 \perturb/U24  ( .IN1(N287), .IN2(N284), .IN3(N278), .IN4(N275), .QN(
        \perturb/n18 ) );
  NOR4X0 \perturb/U23  ( .IN1(N319), .IN2(N305), .IN3(N297), .IN4(N294), .QN(
        \perturb/n19 ) );
  NOR4X0 \perturb/U22  ( .IN1(N61), .IN2(N54), .IN3(N34), .IN4(N33), .QN(
        \perturb/n20 ) );
  NOR4X0 \perturb/U21  ( .IN1(N95), .IN2(N90), .IN3(N87), .IN4(N86), .QN(
        \perturb/n21 ) );
  NAND4X0 \perturb/U20  ( .IN1(\perturb/n18 ), .IN2(\perturb/n19 ), .IN3(
        \perturb/n20 ), .IN4(\perturb/n21 ), .QN(\perturb/n1 ) );
  NOR4X0 \perturb/U19  ( .IN1(N117), .IN2(N114), .IN3(N113), .IN4(N111), .QN(
        \perturb/n14 ) );
  NOR4X0 \perturb/U18  ( .IN1(N19), .IN2(N141), .IN3(N140), .IN4(N137), .QN(
        \perturb/n15 ) );
  NOR4X0 \perturb/U17  ( .IN1(N234), .IN2(N23), .IN3(N227), .IN4(N22), .QN(
        \perturb/n16 ) );
  NOR4X0 \perturb/U16  ( .IN1(N272), .IN2(N259), .IN3(N246), .IN4(N24), .QN(
        \perturb/n17 ) );
  NAND4X0 \perturb/U15  ( .IN1(\perturb/n14 ), .IN2(\perturb/n15 ), .IN3(
        \perturb/n16 ), .IN4(\perturb/n17 ), .QN(\perturb/n2 ) );
  NAND4X0 \perturb/U14  ( .IN1(N26), .IN2(N63), .IN3(N100), .IN4(N66), .QN(
        \perturb/n9 ) );
  NAND4X0 \perturb/U13  ( .IN1(N135), .IN2(N85), .IN3(N64), .IN4(N112), .QN(
        \perturb/n10 ) );
  INVX0 \perturb/U12  ( .INP(N103), .ZN(\perturb/n13 ) );
  NAND4X0 \perturb/U11  ( .IN1(N72), .IN2(N32), .IN3(N11), .IN4(\perturb/n13 ), 
        .QN(\perturb/n11 ) );
  NAND4X0 \perturb/U10  ( .IN1(N266), .IN2(N4), .IN3(N256), .IN4(N16), .QN(
        \perturb/n12 ) );
  OR4X1 \perturb/U9  ( .IN1(\perturb/n9 ), .IN2(\perturb/n10 ), .IN3(
        \perturb/n11 ), .IN4(\perturb/n12 ), .Q(\perturb/n3 ) );
  NAND4X0 \perturb/U8  ( .IN1(N102), .IN2(N60), .IN3(N107), .IN4(N5), .QN(
        \perturb/n5 ) );
  NAND4X0 \perturb/U7  ( .IN1(N35), .IN2(N116), .IN3(N89), .IN4(N263), .QN(
        \perturb/n6 ) );
  NAND4X0 \perturb/U6  ( .IN1(N309), .IN2(N75), .IN3(N78), .IN4(N65), .QN(
        \perturb/n7 ) );
  NAND4X0 \perturb/U5  ( .IN1(N52), .IN2(N322), .IN3(N51), .IN4(N131), .QN(
        \perturb/n8 ) );
  OR4X1 \perturb/U4  ( .IN1(\perturb/n5 ), .IN2(\perturb/n6 ), .IN3(
        \perturb/n7 ), .IN4(\perturb/n8 ), .Q(\perturb/n4 ) );
  NOR4X0 \perturb/U3  ( .IN1(\perturb/n1 ), .IN2(\perturb/n2 ), .IN3(
        \perturb/n3 ), .IN4(\perturb/n4 ), .QN(perturb_signal) );
  XNOR2X1 \restore/U86  ( .IN1(keyinput25), .IN2(N11), .Q(\restore/n81 ) );
  XNOR2X1 \restore/U85  ( .IN1(keyinput26), .IN2(N102), .Q(\restore/n82 ) );
  XNOR2X1 \restore/U84  ( .IN1(keyinput27), .IN2(N263), .Q(\restore/n83 ) );
  XNOR2X1 \restore/U83  ( .IN1(keyinput22), .IN2(N23), .Q(\restore/n84 ) );
  NAND4X0 \restore/U82  ( .IN1(\restore/n81 ), .IN2(\restore/n82 ), .IN3(
        \restore/n83 ), .IN4(\restore/n84 ), .QN(\restore/n65 ) );
  XNOR2X1 \restore/U81  ( .IN1(keyinput18), .IN2(N54), .Q(\restore/n77 ) );
  XNOR2X1 \restore/U80  ( .IN1(keyinput21), .IN2(N90), .Q(\restore/n78 ) );
  XNOR2X1 \restore/U79  ( .IN1(keyinput20), .IN2(N294), .Q(\restore/n79 ) );
  XNOR2X1 \restore/U78  ( .IN1(keyinput19), .IN2(N89), .Q(\restore/n80 ) );
  NAND4X0 \restore/U77  ( .IN1(\restore/n77 ), .IN2(\restore/n78 ), .IN3(
        \restore/n79 ), .IN4(\restore/n80 ), .QN(\restore/n66 ) );
  XNOR2X1 \restore/U76  ( .IN1(keyinput11), .IN2(N87), .Q(\restore/n73 ) );
  XNOR2X1 \restore/U75  ( .IN1(keyinput12), .IN2(N297), .Q(\restore/n74 ) );
  XNOR2X1 \restore/U74  ( .IN1(keyinput16), .IN2(N284), .Q(\restore/n75 ) );
  XNOR2X1 \restore/U73  ( .IN1(keyinput17), .IN2(N19), .Q(\restore/n76 ) );
  NAND4X0 \restore/U72  ( .IN1(\restore/n73 ), .IN2(\restore/n74 ), .IN3(
        \restore/n75 ), .IN4(\restore/n76 ), .QN(\restore/n67 ) );
  XNOR2X1 \restore/U71  ( .IN1(keyinput13), .IN2(N116), .Q(\restore/n69 ) );
  XNOR2X1 \restore/U70  ( .IN1(keyinput14), .IN2(N35), .Q(\restore/n70 ) );
  XNOR2X1 \restore/U69  ( .IN1(keyinput15), .IN2(N16), .Q(\restore/n71 ) );
  XNOR2X1 \restore/U68  ( .IN1(keyinput10), .IN2(N111), .Q(\restore/n72 ) );
  NAND4X0 \restore/U67  ( .IN1(\restore/n69 ), .IN2(\restore/n70 ), .IN3(
        \restore/n71 ), .IN4(\restore/n72 ), .QN(\restore/n68 ) );
  NOR4X0 \restore/U66  ( .IN1(\restore/n65 ), .IN2(\restore/n66 ), .IN3(
        \restore/n67 ), .IN4(\restore/n68 ), .QN(\restore/n1 ) );
  XNOR2X1 \restore/U65  ( .IN1(keyinput59), .IN2(N65), .Q(\restore/n61 ) );
  XNOR2X1 \restore/U64  ( .IN1(keyinput58), .IN2(N227), .Q(\restore/n62 ) );
  XNOR2X1 \restore/U63  ( .IN1(keyinput60), .IN2(N33), .Q(\restore/n63 ) );
  XNOR2X1 \restore/U62  ( .IN1(keyinput3), .IN2(N305), .Q(\restore/n64 ) );
  NAND4X0 \restore/U61  ( .IN1(\restore/n61 ), .IN2(\restore/n62 ), .IN3(
        \restore/n63 ), .IN4(\restore/n64 ), .QN(\restore/n45 ) );
  XNOR2X1 \restore/U60  ( .IN1(keyinput0), .IN2(N114), .Q(\restore/n57 ) );
  XNOR2X1 \restore/U59  ( .IN1(keyinput63), .IN2(N234), .Q(\restore/n58 ) );
  XNOR2X1 \restore/U58  ( .IN1(keyinput62), .IN2(N137), .Q(\restore/n59 ) );
  XNOR2X1 \restore/U57  ( .IN1(keyinput61), .IN2(N22), .Q(\restore/n60 ) );
  NAND4X0 \restore/U56  ( .IN1(\restore/n57 ), .IN2(\restore/n58 ), .IN3(
        \restore/n59 ), .IN4(\restore/n60 ), .QN(\restore/n46 ) );
  XNOR2X1 \restore/U55  ( .IN1(keyinput28), .IN2(N95), .Q(\restore/n53 ) );
  XNOR2X1 \restore/U54  ( .IN1(keyinput33), .IN2(N272), .Q(\restore/n54 ) );
  XNOR2X1 \restore/U53  ( .IN1(keyinput32), .IN2(N319), .Q(\restore/n55 ) );
  XNOR2X1 \restore/U52  ( .IN1(keyinput31), .IN2(N107), .Q(\restore/n56 ) );
  NAND4X0 \restore/U51  ( .IN1(\restore/n53 ), .IN2(\restore/n54 ), .IN3(
        \restore/n55 ), .IN4(\restore/n56 ), .QN(\restore/n47 ) );
  XNOR2X1 \restore/U50  ( .IN1(keyinput23), .IN2(N32), .Q(\restore/n49 ) );
  XNOR2X1 \restore/U49  ( .IN1(keyinput24), .IN2(N60), .Q(\restore/n50 ) );
  XNOR2X1 \restore/U48  ( .IN1(keyinput30), .IN2(N103), .Q(\restore/n51 ) );
  XNOR2X1 \restore/U47  ( .IN1(keyinput29), .IN2(N72), .Q(\restore/n52 ) );
  NAND4X0 \restore/U46  ( .IN1(\restore/n49 ), .IN2(\restore/n50 ), .IN3(
        \restore/n51 ), .IN4(\restore/n52 ), .QN(\restore/n48 ) );
  NOR4X0 \restore/U45  ( .IN1(\restore/n45 ), .IN2(\restore/n46 ), .IN3(
        \restore/n47 ), .IN4(\restore/n48 ), .QN(\restore/n2 ) );
  XNOR2X1 \restore/U44  ( .IN1(keyinput37), .IN2(N256), .Q(\restore/n41 ) );
  XNOR2X1 \restore/U43  ( .IN1(keyinput39), .IN2(N51), .Q(\restore/n42 ) );
  XNOR2X1 \restore/U42  ( .IN1(keyinput40), .IN2(N52), .Q(\restore/n43 ) );
  XNOR2X1 \restore/U41  ( .IN1(keyinput41), .IN2(N4), .Q(\restore/n44 ) );
  NAND4X0 \restore/U40  ( .IN1(\restore/n41 ), .IN2(\restore/n42 ), .IN3(
        \restore/n43 ), .IN4(\restore/n44 ), .QN(\restore/n25 ) );
  XNOR2X1 \restore/U39  ( .IN1(keyinput34), .IN2(N113), .Q(\restore/n37 ) );
  XNOR2X1 \restore/U38  ( .IN1(keyinput35), .IN2(N322), .Q(\restore/n38 ) );
  XNOR2X1 \restore/U37  ( .IN1(keyinput36), .IN2(N117), .Q(\restore/n39 ) );
  XNOR2X1 \restore/U36  ( .IN1(keyinput38), .IN2(N131), .Q(\restore/n40 ) );
  NAND4X0 \restore/U35  ( .IN1(\restore/n37 ), .IN2(\restore/n38 ), .IN3(
        \restore/n39 ), .IN4(\restore/n40 ), .QN(\restore/n26 ) );
  XNOR2X1 \restore/U34  ( .IN1(keyinput6), .IN2(N64), .Q(\restore/n33 ) );
  XNOR2X1 \restore/U33  ( .IN1(keyinput8), .IN2(N246), .Q(\restore/n34 ) );
  XNOR2X1 \restore/U32  ( .IN1(keyinput7), .IN2(N85), .Q(\restore/n35 ) );
  XNOR2X1 \restore/U31  ( .IN1(keyinput9), .IN2(N275), .Q(\restore/n36 ) );
  NAND4X0 \restore/U30  ( .IN1(\restore/n33 ), .IN2(\restore/n34 ), .IN3(
        \restore/n35 ), .IN4(\restore/n36 ), .QN(\restore/n27 ) );
  XNOR2X1 \restore/U29  ( .IN1(keyinput2), .IN2(N140), .Q(\restore/n29 ) );
  XNOR2X1 \restore/U28  ( .IN1(keyinput1), .IN2(N135), .Q(\restore/n30 ) );
  XNOR2X1 \restore/U27  ( .IN1(keyinput4), .IN2(N112), .Q(\restore/n31 ) );
  XNOR2X1 \restore/U26  ( .IN1(keyinput5), .IN2(N287), .Q(\restore/n32 ) );
  NAND4X0 \restore/U25  ( .IN1(\restore/n29 ), .IN2(\restore/n30 ), .IN3(
        \restore/n31 ), .IN4(\restore/n32 ), .QN(\restore/n28 ) );
  NOR4X0 \restore/U24  ( .IN1(\restore/n25 ), .IN2(\restore/n26 ), .IN3(
        \restore/n27 ), .IN4(\restore/n28 ), .QN(\restore/n3 ) );
  XNOR2X1 \restore/U23  ( .IN1(keyinput54), .IN2(N309), .Q(\restore/n21 ) );
  XNOR2X1 \restore/U22  ( .IN1(keyinput57), .IN2(N63), .Q(\restore/n22 ) );
  XNOR2X1 \restore/U21  ( .IN1(keyinput56), .IN2(N34), .Q(\restore/n23 ) );
  XNOR2X1 \restore/U20  ( .IN1(keyinput55), .IN2(N26), .Q(\restore/n24 ) );
  NAND4X0 \restore/U19  ( .IN1(\restore/n21 ), .IN2(\restore/n22 ), .IN3(
        \restore/n23 ), .IN4(\restore/n24 ), .QN(\restore/n5 ) );
  XNOR2X1 \restore/U18  ( .IN1(keyinput49), .IN2(N259), .Q(\restore/n17 ) );
  XNOR2X1 \restore/U17  ( .IN1(keyinput51), .IN2(N266), .Q(\restore/n18 ) );
  XNOR2X1 \restore/U16  ( .IN1(keyinput52), .IN2(N100), .Q(\restore/n19 ) );
  XNOR2X1 \restore/U15  ( .IN1(keyinput53), .IN2(N24), .Q(\restore/n20 ) );
  NAND4X0 \restore/U14  ( .IN1(\restore/n17 ), .IN2(\restore/n18 ), .IN3(
        \restore/n19 ), .IN4(\restore/n20 ), .QN(\restore/n6 ) );
  XNOR2X1 \restore/U13  ( .IN1(keyinput46), .IN2(N66), .Q(\restore/n13 ) );
  XNOR2X1 \restore/U12  ( .IN1(keyinput47), .IN2(N78), .Q(\restore/n14 ) );
  XNOR2X1 \restore/U11  ( .IN1(keyinput48), .IN2(N141), .Q(\restore/n15 ) );
  XNOR2X1 \restore/U10  ( .IN1(keyinput50), .IN2(N75), .Q(\restore/n16 ) );
  NAND4X0 \restore/U9  ( .IN1(\restore/n13 ), .IN2(\restore/n14 ), .IN3(
        \restore/n15 ), .IN4(\restore/n16 ), .QN(\restore/n7 ) );
  XNOR2X1 \restore/U8  ( .IN1(keyinput42), .IN2(N278), .Q(\restore/n9 ) );
  XNOR2X1 \restore/U7  ( .IN1(keyinput44), .IN2(N5), .Q(\restore/n10 ) );
  XNOR2X1 \restore/U6  ( .IN1(keyinput43), .IN2(N61), .Q(\restore/n11 ) );
  XNOR2X1 \restore/U5  ( .IN1(keyinput45), .IN2(N86), .Q(\restore/n12 ) );
  NAND4X0 \restore/U4  ( .IN1(\restore/n9 ), .IN2(\restore/n10 ), .IN3(
        \restore/n11 ), .IN4(\restore/n12 ), .QN(\restore/n8 ) );
  NOR4X0 \restore/U3  ( .IN1(\restore/n5 ), .IN2(\restore/n6 ), .IN3(
        \restore/n7 ), .IN4(\restore/n8 ), .QN(\restore/n4 ) );
  AND4X1 \restore/U2  ( .IN1(\restore/n1 ), .IN2(\restore/n2 ), .IN3(
        \restore/n3 ), .IN4(\restore/n4 ), .Q(restore_signal) );
endmodule

