/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Apr 24 21:44:55 2021
/////////////////////////////////////////////////////////////


module c2670_AntiSAT_64_1_top ( N145, N153, N162, N168, N172, N210, N190, N212, 
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
         N168_BUFF, N216_BUFF, N175_BUFF, N181_BUFF, \main/n216 , \main/n215 ,
         \main/n214 , \main/n213 , \main/n212 , \main/n211 , \main/n210 ,
         \main/n209 , \main/n208 , \main/n207 , \main/n206 , \main/n205 ,
         \main/n204 , \main/n203 , \main/n202 , \main/n201 , \main/n200 ,
         \main/n199 , \main/n198 , \main/n197 , \main/n196 , \main/n195 ,
         \main/n194 , \main/n193 , \main/n192 , \main/n191 , \main/n190 ,
         \main/n189 , \main/n188 , \main/n187 , \main/n186 , \main/n185 ,
         \main/n184 , \main/n183 , \main/n182 , \main/n181 , \main/n180 ,
         \main/n179 , \main/n178 , \main/n177 , \main/n176 , \main/n175 ,
         \main/n174 , \main/n173 , \main/n172 , \main/n171 , \main/n170 ,
         \main/n169 , \main/n168 , \main/n167 , \main/n166 , \main/n165 ,
         \main/n164 , \main/n163 , \main/n162 , \main/n161 , \main/n160 ,
         \main/n159 , \main/n158 , \main/n157 , \main/n156 , \main/n155 ,
         \main/n154 , \main/n153 , \main/n152 , \main/n151 , \main/n150 ,
         \main/n149 , \main/n148 , \main/n147 , \main/n146 , \main/n145 ,
         \main/n144 , \main/n143 , \main/n142 , \main/n141 , \main/n140 ,
         \main/n139 , \main/n138 , \main/n137 , \main/n136 , \main/n135 ,
         \main/n134 , \main/n133 , \main/n132 , \main/n131 , \main/n130 ,
         \main/n129 , \main/n128 , \main/n127 , \main/n126 , \main/n125 ,
         \main/n124 , \main/n123 , \main/n122 , \main/n121 , \main/n120 ,
         \main/n119 , \main/n118 , \main/n117 , \main/n116 , \main/n115 ,
         \main/n114 , \main/n113 , \main/n112 , \main/n111 , \main/n110 ,
         \main/n109 , \main/n108 , \main/n107 , \main/n106 , \main/n105 ,
         \main/n104 , \main/n103 , \main/n102 , \main/n101 , \main/n100 ,
         \main/n99 , \main/n98 , \main/n97 , \main/n96 , \main/n95 ,
         \main/n94 , \main/n93 , \main/n92 , \main/n91 , \main/n90 ,
         \main/n89 , \main/n88 , \main/n87 , \main/n86 , \main/n85 ,
         \main/n84 , \main/n83 , \main/n82 , \main/n81 , \main/n80 ,
         \main/n79 , \main/n78 , \main/n77 , \main/n76 , \main/n75 ,
         \main/n74 , \main/n73 , \main/n72 , \main/n71 , \main/n70 ,
         \main/n69 , \main/n68 , \main/n67 , \main/n66 , \main/n65 ,
         \main/n64 , \main/n63 , \main/n62 , \main/n61 , \main/n60 ,
         \main/n59 , \main/n58 , \main/n57 , \main/n56 , \main/n55 ,
         \main/n54 , \main/n53 , \main/n52 , \main/n51 , \main/n50 ,
         \main/n49 , \main/n48 , \main/n47 , \main/n46 , \main/n45 ,
         \main/n44 , \main/n43 , \main/n42 , \main/n41 , \main/n40 ,
         \main/n39 , \main/n38 , \main/n37 , \main/n36 , \main/n35 ,
         \main/n34 , \main/n33 , \main/n32 , \main/n31 , \main/n30 ,
         \main/n29 , \main/n28 , \main/n27 , \main/n26 , \main/n25 ,
         \main/n24 , \main/n23 , \main/n22 , \main/n21 , \main/n20 ,
         \main/n19 , \main/n18 , \main/n17 , \main/n16 , \main/n15 ,
         \main/n14 , \main/n13 , \main/n12 , \main/n11 , \main/n10 , \main/n9 ,
         \main/n8 , \main/n7 , \main/n6 , \main/n5 , \main/n4 , \main/n3 ,
         \main/n2 , \main/n1 , \flip/n82 , \flip/n81 , \flip/n80 , \flip/n79 ,
         \flip/n78 , \flip/n77 , \flip/n76 , \flip/n75 , \flip/n74 ,
         \flip/n73 , \flip/n72 , \flip/n71 , \flip/n70 , \flip/n69 ,
         \flip/n68 , \flip/n67 , \flip/n66 , \flip/n65 , \flip/n64 ,
         \flip/n63 , \flip/n62 , \flip/n61 , \flip/n60 , \flip/n59 ,
         \flip/n58 , \flip/n57 , \flip/n56 , \flip/n55 , \flip/n54 ,
         \flip/n53 , \flip/n52 , \flip/n51 , \flip/n50 , \flip/n49 ,
         \flip/n48 , \flip/n47 , \flip/n46 , \flip/n45 , \flip/n44 ,
         \flip/n43 , \flip/n42 , \flip/n41 , \flip/n40 , \flip/n39 ,
         \flip/n38 , \flip/n37 , \flip/n36 , \flip/n35 , \flip/n34 ,
         \flip/n33 , \flip/n32 , \flip/n31 , \flip/n30 , \flip/n29 ,
         \flip/n28 , \flip/n27 , \flip/n26 , \flip/n25 , \flip/n24 ,
         \flip/n23 , \flip/n22 , \flip/n21 , \flip/n20 , \flip/n19 ,
         \flip/n18 , \flip/n17 , \flip/n16 , \flip/n15 , \flip/n14 ,
         \flip/n13 , \flip/n12 , \flip/n11 , \flip/n10 , \flip/n9 , \flip/n8 ,
         \flip/n7 , \flip/n6 , \flip/n5 , \flip/n4 , \flip/n3 , \flip/n2 ,
         \flip/n1 ;
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

  AO21X1 \main/U266  ( .IN1(N3), .IN2(N1), .IN3(\main/n216 ), .Q(N1971) );
  NAND3X0 \main/U265  ( .IN1(N1726), .IN2(N237), .IN3(N224), .QN(\main/n216 )
         );
  INVX0 \main/U264  ( .INP(N3079), .ZN(N3038) );
  AO221X1 \main/U263  ( .IN1(N16), .IN2(\main/n215 ), .IN3(\main/n214 ), .IN4(
        \main/n213 ), .IN5(\main/n212 ), .Q(N3079) );
  MUX21X1 \main/U262  ( .IN1(\main/n210 ), .IN2(\main/n209 ), .S(N29), .Q(
        \main/n211 ) );
  NOR4X0 \main/U261  ( .IN1(\main/n208 ), .IN2(\main/n207 ), .IN3(\main/n206 ), 
        .IN4(\main/n205 ), .QN(\main/n209 ) );
  NAND4X0 \main/U260  ( .IN1(\main/n204 ), .IN2(\main/n203 ), .IN3(\main/n202 ), .IN4(\main/n201 ), .QN(\main/n205 ) );
  MUX21X1 \main/U259  ( .IN1(\main/n200 ), .IN2(N305), .S(N1816), .Q(
        \main/n201 ) );
  MUX21X1 \main/U258  ( .IN1(\main/n199 ), .IN2(N301), .S(N1818), .Q(
        \main/n202 ) );
  INVX0 \main/U257  ( .INP(\main/n198 ), .ZN(\main/n203 ) );
  NAND4X0 \main/U256  ( .IN1(\main/n197 ), .IN2(\main/n196 ), .IN3(\main/n195 ), .IN4(\main/n194 ), .QN(\main/n206 ) );
  MUX21X1 \main/U255  ( .IN1(\main/n193 ), .IN2(N309), .S(N1817), .Q(
        \main/n194 ) );
  MUX21X1 \main/U254  ( .IN1(\main/n192 ), .IN2(N297), .S(\main/n191 ), .Q(
        \main/n195 ) );
  MUX21X1 \main/U253  ( .IN1(\main/n190 ), .IN2(N294), .S(\main/n189 ), .Q(
        \main/n196 ) );
  NOR4X0 \main/U252  ( .IN1(\main/n188 ), .IN2(\main/n187 ), .IN3(\main/n186 ), 
        .IN4(\main/n185 ), .QN(\main/n210 ) );
  NAND4X0 \main/U251  ( .IN1(\main/n184 ), .IN2(N28), .IN3(\main/n183 ), .IN4(
        \main/n182 ), .QN(\main/n185 ) );
  MUX21X1 \main/U250  ( .IN1(N301), .IN2(\main/n199 ), .S(N27), .Q(\main/n182 ) );
  INVX0 \main/U249  ( .INP(N301), .ZN(\main/n199 ) );
  MUX21X1 \main/U248  ( .IN1(N305), .IN2(\main/n200 ), .S(N34), .Q(\main/n183 ) );
  MUX21X1 \main/U247  ( .IN1(N294), .IN2(\main/n190 ), .S(N26), .Q(\main/n184 ) );
  AO221X1 \main/U246  ( .IN1(N284), .IN2(N25), .IN3(N35), .IN4(N309), .IN5(
        \main/n181 ), .Q(\main/n186 ) );
  OAI22X1 \main/U245  ( .IN1(N284), .IN2(N25), .IN3(N309), .IN4(N35), .QN(
        \main/n181 ) );
  MUX21X1 \main/U244  ( .IN1(\main/n180 ), .IN2(N287), .S(N32), .Q(\main/n187 ) );
  MUX21X1 \main/U243  ( .IN1(\main/n192 ), .IN2(N297), .S(N33), .Q(\main/n188 ) );
  INVX0 \main/U242  ( .INP(N297), .ZN(\main/n192 ) );
  NAND4X0 \main/U241  ( .IN1(\main/n179 ), .IN2(\main/n178 ), .IN3(\main/n177 ), .IN4(\main/n176 ), .QN(\main/n213 ) );
  NOR2X0 \main/U240  ( .IN1(\main/n175 ), .IN2(\main/n174 ), .QN(\main/n176 )
         );
  AO221X1 \main/U239  ( .IN1(N263), .IN2(N20), .IN3(N6), .IN4(N278), .IN5(
        \main/n173 ), .Q(\main/n174 ) );
  OAI22X1 \main/U238  ( .IN1(N263), .IN2(N20), .IN3(N278), .IN4(N6), .QN(
        \main/n173 ) );
  MUX21X1 \main/U237  ( .IN1(\main/n172 ), .IN2(N281), .S(N24), .Q(\main/n175 ) );
  OA221X1 \main/U236  ( .IN1(N272), .IN2(N22), .IN3(N5), .IN4(N266), .IN5(
        \main/n171 ), .Q(\main/n177 ) );
  AOI22X1 \main/U235  ( .IN1(N272), .IN2(N22), .IN3(N5), .IN4(N266), .QN(
        \main/n171 ) );
  OA221X1 \main/U234  ( .IN1(N269), .IN2(N21), .IN3(N4), .IN4(N259), .IN5(
        \main/n170 ), .Q(\main/n178 ) );
  AOI22X1 \main/U233  ( .IN1(N269), .IN2(N21), .IN3(N4), .IN4(N259), .QN(
        \main/n170 ) );
  OA221X1 \main/U232  ( .IN1(N275), .IN2(N23), .IN3(N256), .IN4(N19), .IN5(
        \main/n169 ), .Q(\main/n179 ) );
  AOI22X1 \main/U231  ( .IN1(N275), .IN2(N23), .IN3(N256), .IN4(N19), .QN(
        \main/n169 ) );
  INVX0 \main/U230  ( .INP(N16), .ZN(\main/n214 ) );
  NAND4X0 \main/U229  ( .IN1(\main/n168 ), .IN2(\main/n167 ), .IN3(\main/n166 ), .IN4(\main/n165 ), .QN(\main/n215 ) );
  NOR4X0 \main/U228  ( .IN1(\main/n164 ), .IN2(\main/n163 ), .IN3(\main/n162 ), 
        .IN4(\main/n161 ), .QN(\main/n167 ) );
  NAND4X0 \main/U227  ( .IN1(\main/n160 ), .IN2(\main/n159 ), .IN3(\main/n158 ), .IN4(\main/n157 ), .QN(\main/n161 ) );
  MUX21X1 \main/U226  ( .IN1(N2012), .IN2(N1821), .S(N266), .Q(\main/n157 ) );
  MUX21X1 \main/U225  ( .IN1(N281), .IN2(\main/n172 ), .S(N2022), .Q(
        \main/n158 ) );
  MUX21X1 \main/U224  ( .IN1(N2016), .IN2(N1819), .S(N272), .Q(\main/n159 ) );
  MUX21X1 \main/U223  ( .IN1(N2014), .IN2(N1820), .S(N269), .Q(\main/n160 ) );
  MUX21X1 \main/U222  ( .IN1(\main/n156 ), .IN2(\main/n155 ), .S(\main/n154 ), 
        .Q(\main/n162 ) );
  MUX21X1 \main/U221  ( .IN1(\main/n153 ), .IN2(\main/n152 ), .S(N256), .Q(
        \main/n163 ) );
  OA222X1 \main/U220  ( .IN1(N263), .IN2(N2010), .IN3(\main/n151 ), .IN4(
        \main/n150 ), .IN5(N278), .IN6(N2020), .Q(\main/n168 ) );
  INVX0 \main/U219  ( .INP(N3882), .ZN(N3881) );
  INVX0 \main/U218  ( .INP(\main/n149 ), .ZN(N2925) );
  NAND4X0 \main/U217  ( .IN1(N1726), .IN2(N237), .IN3(N224), .IN4(N36), .QN(
        N1970) );
  INVX0 \main/U216  ( .INP(N44), .ZN(N487) );
  INVX0 \main/U215  ( .INP(N1277), .ZN(N1448) );
  NOR2X0 \main/U214  ( .IN1(\main/n148 ), .IN2(\main/n147 ), .QN(N1277) );
  INVX0 \main/U213  ( .INP(N57), .ZN(N493) );
  INVX0 \main/U212  ( .INP(N69), .ZN(N491) );
  INVX0 \main/U211  ( .INP(N82), .ZN(N489) );
  INVX0 \main/U210  ( .INP(N96), .ZN(N490) );
  AO221X1 \main/U209  ( .IN1(\main/n146 ), .IN2(\main/n145 ), .IN3(\main/n197 ), .IN4(N313), .IN5(N316), .Q(N2891) );
  INVX0 \main/U208  ( .INP(N108), .ZN(N494) );
  INVX0 \main/U207  ( .INP(N120), .ZN(N492) );
  INVX0 \main/U206  ( .INP(N132), .ZN(N488) );
  NAND4X0 \main/U205  ( .IN1(N309), .IN2(N305), .IN3(N301), .IN4(N297), .QN(
        N792) );
  AO222X1 \main/U204  ( .IN1(\main/n189 ), .IN2(\main/n144 ), .IN3(\main/n189 ), .IN4(\main/n143 ), .IN5(\main/n144 ), .IN6(\main/n142 ), .Q(N3851) );
  NAND2X0 \main/U203  ( .IN1(N294), .IN2(\main/n141 ), .QN(\main/n142 ) );
  NOR2X0 \main/U202  ( .IN1(N294), .IN2(\main/n140 ), .QN(\main/n143 ) );
  AO22X1 \main/U201  ( .IN1(\main/n141 ), .IN2(\main/n139 ), .IN3(\main/n138 ), 
        .IN4(\main/n137 ), .Q(\main/n144 ) );
  OA22X1 \main/U200  ( .IN1(\main/n136 ), .IN2(\main/n135 ), .IN3(\main/n140 ), 
        .IN4(\main/n204 ), .Q(\main/n138 ) );
  OA22X1 \main/U199  ( .IN1(\main/n133 ), .IN2(\main/n132 ), .IN3(\main/n172 ), 
        .IN4(\main/n131 ), .Q(\main/n135 ) );
  OA222X1 \main/U198  ( .IN1(\main/n130 ), .IN2(\main/n129 ), .IN3(\main/n130 ), .IN4(\main/n164 ), .IN5(\main/n128 ), .IN6(\main/n166 ), .Q(\main/n132 ) );
  NOR2X0 \main/U197  ( .IN1(N275), .IN2(N2018), .QN(\main/n164 ) );
  OA221X1 \main/U196  ( .IN1(\main/n127 ), .IN2(\main/n126 ), .IN3(\main/n127 ), .IN4(\main/n125 ), .IN5(\main/n124 ), .Q(\main/n130 ) );
  NAND3X0 \main/U195  ( .IN1(N275), .IN2(\main/n129 ), .IN3(N2018), .QN(
        \main/n124 ) );
  INVX0 \main/U194  ( .INP(\main/n128 ), .ZN(\main/n129 ) );
  NOR3X0 \main/U193  ( .IN1(\main/n122 ), .IN2(\main/n121 ), .IN3(\main/n120 ), 
        .QN(\main/n126 ) );
  AO222X1 \main/U192  ( .IN1(\main/n119 ), .IN2(\main/n118 ), .IN3(\main/n119 ), .IN4(N2010), .IN5(\main/n118 ), .IN6(N2010), .Q(\main/n120 ) );
  AO222X1 \main/U191  ( .IN1(\main/n117 ), .IN2(\main/n116 ), .IN3(\main/n117 ), .IN4(\main/n156 ), .IN5(\main/n116 ), .IN6(\main/n156 ), .Q(\main/n118 ) );
  AO221X1 \main/U190  ( .IN1(\main/n115 ), .IN2(N287), .IN3(\main/n114 ), 
        .IN4(N256), .IN5(\main/n152 ), .Q(\main/n116 ) );
  MUX21X1 \main/U189  ( .IN1(N259), .IN2(N294), .S(\main/n115 ), .Q(
        \main/n117 ) );
  MUX21X1 \main/U188  ( .IN1(N263), .IN2(N297), .S(\main/n115 ), .Q(
        \main/n119 ) );
  AND3X1 \main/U187  ( .IN1(N8), .IN2(\main/n113 ), .IN3(N2014), .Q(
        \main/n121 ) );
  AND3X1 \main/U186  ( .IN1(\main/n112 ), .IN2(N8), .IN3(N2016), .Q(
        \main/n122 ) );
  AO222X1 \main/U185  ( .IN1(\main/n111 ), .IN2(\main/n110 ), .IN3(\main/n111 ), .IN4(\main/n109 ), .IN5(\main/n110 ), .IN6(\main/n109 ), .Q(\main/n127 ) );
  AO222X1 \main/U184  ( .IN1(\main/n108 ), .IN2(\main/n107 ), .IN3(\main/n108 ), .IN4(\main/n106 ), .IN5(\main/n107 ), .IN6(\main/n106 ), .Q(\main/n109 ) );
  INVX0 \main/U183  ( .INP(\main/n113 ), .ZN(\main/n107 ) );
  OA22X1 \main/U182  ( .IN1(N305), .IN2(\main/n105 ), .IN3(N269), .IN4(
        \main/n128 ), .Q(\main/n113 ) );
  NOR2X0 \main/U181  ( .IN1(N2012), .IN2(\main/n123 ), .QN(\main/n108 ) );
  MUX21X1 \main/U180  ( .IN1(N266), .IN2(N301), .S(\main/n115 ), .Q(
        \main/n123 ) );
  INVX0 \main/U179  ( .INP(\main/n112 ), .ZN(\main/n111 ) );
  OA22X1 \main/U178  ( .IN1(N309), .IN2(\main/n105 ), .IN3(N272), .IN4(
        \main/n128 ), .Q(\main/n112 ) );
  INVX0 \main/U177  ( .INP(\main/n114 ), .ZN(\main/n115 ) );
  NOR3X0 \main/U176  ( .IN1(N278), .IN2(N2020), .IN3(\main/n128 ), .QN(
        \main/n133 ) );
  NAND3X0 \main/U175  ( .IN1(\main/n104 ), .IN2(N1816), .IN3(N40), .QN(
        \main/n114 ) );
  NOR3X0 \main/U174  ( .IN1(N281), .IN2(\main/n140 ), .IN3(N2022), .QN(
        \main/n136 ) );
  INVX0 \main/U173  ( .INP(\main/n141 ), .ZN(\main/n140 ) );
  AO21X1 \main/U172  ( .IN1(\main/n198 ), .IN2(\main/n137 ), .IN3(\main/n207 ), 
        .Q(\main/n139 ) );
  AND2X1 \main/U171  ( .IN1(\main/n180 ), .IN2(\main/n103 ), .Q(\main/n207 )
         );
  NOR2X0 \main/U170  ( .IN1(\main/n103 ), .IN2(\main/n180 ), .QN(\main/n208 )
         );
  NOR2X0 \main/U169  ( .IN1(N284), .IN2(\main/n134 ), .QN(\main/n198 ) );
  NOR2X0 \main/U168  ( .IN1(\main/n104 ), .IN2(\main/n102 ), .QN(\main/n141 )
         );
  NAND2X0 \main/U167  ( .IN1(N1816), .IN2(N40), .QN(\main/n102 ) );
  NOR2X0 \main/U166  ( .IN1(N1818), .IN2(N262), .QN(\main/n104 ) );
  AO21X1 \main/U165  ( .IN1(N230), .IN2(\main/n101 ), .IN3(\main/n156 ), .Q(
        N2496) );
  INVX0 \main/U164  ( .INP(N241), .ZN(\main/n101 ) );
  MUX21X1 \main/U163  ( .IN1(\main/n100 ), .IN2(\main/n99 ), .S(\main/n98 ), 
        .Q(N3546) );
  NOR2X0 \main/U162  ( .IN1(N241), .IN2(\main/n97 ), .QN(\main/n98 ) );
  MUX21X1 \main/U161  ( .IN1(\main/n153 ), .IN2(\main/n152 ), .S(\main/n96 ), 
        .Q(\main/n97 ) );
  INVX0 \main/U160  ( .INP(\main/n156 ), .ZN(\main/n155 ) );
  INVX0 \main/U159  ( .INP(\main/n100 ), .ZN(\main/n99 ) );
  MUX21X1 \main/U158  ( .IN1(\main/n156 ), .IN2(N2012), .S(N246), .Q(N2387) );
  MUX21X1 \main/U157  ( .IN1(\main/n100 ), .IN2(\main/n95 ), .S(N246), .Q(
        N3803) );
  MUX21X1 \main/U156  ( .IN1(\main/n94 ), .IN2(\main/n93 ), .S(\main/n92 ), 
        .Q(\main/n95 ) );
  NAND3X0 \main/U155  ( .IN1(N1726), .IN2(\main/n91 ), .IN3(\main/n149 ), .QN(
        N3882) );
  XNOR3X1 \main/U154  ( .IN1(\main/n89 ), .IN2(N340), .IN3(N343), .Q(
        \main/n90 ) );
  XNOR3X1 \main/U153  ( .IN1(N334), .IN2(N337), .IN3(\main/n88 ), .Q(
        \main/n89 ) );
  XNOR3X1 \main/U152  ( .IN1(N349), .IN2(N346), .IN3(\main/n87 ), .Q(
        \main/n88 ) );
  MUX21X1 \main/U151  ( .IN1(N259), .IN2(\main/n154 ), .S(\main/n86 ), .Q(
        \main/n87 ) );
  XOR3X1 \main/U150  ( .IN1(N256), .IN2(N331), .IN3(N328), .Q(\main/n86 ) );
  INVX0 \main/U149  ( .INP(N259), .ZN(\main/n154 ) );
  NOR4X0 \main/U148  ( .IN1(N3671), .IN2(N3809), .IN3(N2971), .IN4(N2970), 
        .QN(\main/n91 ) );
  NOR2X0 \main/U147  ( .IN1(\main/n85 ), .IN2(N37), .QN(N3809) );
  XOR3X1 \main/U146  ( .IN1(\main/n92 ), .IN2(N1820), .IN3(N1821), .Q(
        \main/n85 ) );
  XNOR3X1 \main/U145  ( .IN1(N2020), .IN2(N2018), .IN3(\main/n84 ), .Q(
        \main/n92 ) );
  XOR3X1 \main/U144  ( .IN1(\main/n156 ), .IN2(\main/n153 ), .IN3(\main/n83 ), 
        .Q(\main/n84 ) );
  XOR3X1 \main/U143  ( .IN1(N2016), .IN2(\main/n82 ), .IN3(N2022), .Q(
        \main/n83 ) );
  MUX21X1 \main/U142  ( .IN1(N2010), .IN2(\main/n150 ), .S(\main/n100 ), .Q(
        \main/n82 ) );
  NAND4X0 \main/U141  ( .IN1(\main/n81 ), .IN2(\main/n80 ), .IN3(\main/n79 ), 
        .IN4(\main/n78 ), .QN(\main/n100 ) );
  INVX0 \main/U140  ( .INP(N2010), .ZN(\main/n150 ) );
  NOR2X0 \main/U139  ( .IN1(\main/n73 ), .IN2(N37), .QN(N3671) );
  XOR3X1 \main/U138  ( .IN1(\main/n72 ), .IN2(\main/n146 ), .IN3(\main/n189 ), 
        .Q(\main/n73 ) );
  NOR2X0 \main/U137  ( .IN1(\main/n71 ), .IN2(\main/n70 ), .QN(\main/n189 ) );
  AO22X1 \main/U136  ( .IN1(\main/n69 ), .IN2(N140), .IN3(\main/n68 ), .IN4(
        N128), .Q(\main/n70 ) );
  AO22X1 \main/U135  ( .IN1(\main/n67 ), .IN2(N104), .IN3(\main/n66 ), .IN4(
        N116), .Q(\main/n71 ) );
  INVX0 \main/U134  ( .INP(\main/n197 ), .ZN(\main/n146 ) );
  NAND4X0 \main/U133  ( .IN1(\main/n65 ), .IN2(\main/n64 ), .IN3(\main/n63 ), 
        .IN4(\main/n62 ), .QN(\main/n197 ) );
  XNOR3X1 \main/U132  ( .IN1(\main/n191 ), .IN2(N1817), .IN3(\main/n61 ), .Q(
        \main/n72 ) );
  XNOR3X1 \main/U131  ( .IN1(N1818), .IN2(N1816), .IN3(\main/n60 ), .Q(
        \main/n61 ) );
  XNOR3X1 \main/U130  ( .IN1(\main/n103 ), .IN2(\main/n59 ), .IN3(\main/n134 ), 
        .Q(\main/n60 ) );
  NAND4X0 \main/U129  ( .IN1(\main/n58 ), .IN2(\main/n57 ), .IN3(\main/n56 ), 
        .IN4(\main/n55 ), .QN(\main/n134 ) );
  NOR2X0 \main/U128  ( .IN1(\main/n54 ), .IN2(\main/n53 ), .QN(\main/n59 ) );
  AO22X1 \main/U127  ( .IN1(\main/n69 ), .IN2(N142), .IN3(\main/n68 ), .IN4(
        N130), .Q(\main/n53 ) );
  AO22X1 \main/U126  ( .IN1(\main/n67 ), .IN2(N106), .IN3(\main/n66 ), .IN4(
        N118), .Q(\main/n54 ) );
  NOR2X0 \main/U125  ( .IN1(\main/n52 ), .IN2(\main/n51 ), .QN(\main/n103 ) );
  AO22X1 \main/U124  ( .IN1(\main/n69 ), .IN2(N141), .IN3(\main/n68 ), .IN4(
        N129), .Q(\main/n51 ) );
  AO22X1 \main/U123  ( .IN1(\main/n67 ), .IN2(N105), .IN3(\main/n66 ), .IN4(
        N117), .Q(\main/n52 ) );
  NOR2X0 \main/U122  ( .IN1(\main/n50 ), .IN2(\main/n49 ), .QN(\main/n191 ) );
  AO22X1 \main/U121  ( .IN1(\main/n69 ), .IN2(N139), .IN3(\main/n68 ), .IN4(
        N127), .Q(\main/n49 ) );
  AO22X1 \main/U120  ( .IN1(\main/n67 ), .IN2(N103), .IN3(\main/n66 ), .IN4(
        N115), .Q(\main/n50 ) );
  INVX0 \main/U119  ( .INP(N2014), .ZN(N1820) );
  INVX0 \main/U118  ( .INP(N2016), .ZN(N1819) );
  MUX21X1 \main/U117  ( .IN1(\main/n152 ), .IN2(\main/n94 ), .S(N246), .Q(
        N2643) );
  INVX0 \main/U116  ( .INP(\main/n93 ), .ZN(\main/n94 ) );
  NOR2X0 \main/U115  ( .IN1(N230), .IN2(\main/n156 ), .QN(\main/n93 ) );
  NAND4X0 \main/U114  ( .IN1(\main/n48 ), .IN2(\main/n47 ), .IN3(\main/n46 ), 
        .IN4(\main/n45 ), .QN(\main/n156 ) );
  MUX21X1 \main/U113  ( .IN1(N2010), .IN2(N2014), .S(N246), .Q(N2389) );
  NAND4X0 \main/U112  ( .IN1(\main/n44 ), .IN2(\main/n43 ), .IN3(\main/n42 ), 
        .IN4(\main/n41 ), .QN(N2010) );
  AND2X1 \main/U111  ( .IN1(N398), .IN2(N94), .Q(N1026) );
  NAND3X0 \main/U110  ( .IN1(N237), .IN2(N15), .IN3(N2), .QN(N799) );
  AOI22X1 \main/U109  ( .IN1(N231), .IN2(\main/n147 ), .IN3(N325), .IN4(
        \main/n148 ), .QN(N1726) );
  NAND4X0 \main/U108  ( .IN1(N44), .IN2(N82), .IN3(N96), .IN4(N132), .QN(
        \main/n148 ) );
  NAND4X0 \main/U107  ( .IN1(N57), .IN2(N69), .IN3(N108), .IN4(N120), .QN(
        \main/n147 ) );
  XOR3X1 \main/U106  ( .IN1(\main/n172 ), .IN2(N266), .IN3(\main/n40 ), .Q(
        N2971) );
  XOR3X1 \main/U105  ( .IN1(\main/n151 ), .IN2(N284), .IN3(\main/n39 ), .Q(
        \main/n40 ) );
  XNOR3X1 \main/U104  ( .IN1(N278), .IN2(\main/n38 ), .IN3(\main/n37 ), .Q(
        \main/n39 ) );
  XOR3X1 \main/U103  ( .IN1(N272), .IN2(N269), .IN3(N275), .Q(\main/n37 ) );
  MUX21X1 \main/U102  ( .IN1(N287), .IN2(\main/n180 ), .S(N352), .Q(\main/n38 ) );
  INVX0 \main/U101  ( .INP(N287), .ZN(\main/n180 ) );
  INVX0 \main/U100  ( .INP(N263), .ZN(\main/n151 ) );
  INVX0 \main/U99  ( .INP(N281), .ZN(\main/n172 ) );
  XOR3X1 \main/U98  ( .IN1(\main/n190 ), .IN2(N297), .IN3(\main/n36 ), .Q(
        N2970) );
  XOR3X1 \main/U97  ( .IN1(\main/n193 ), .IN2(N301), .IN3(\main/n35 ), .Q(
        \main/n36 ) );
  XOR3X1 \main/U96  ( .IN1(\main/n34 ), .IN2(N316), .IN3(\main/n145 ), .Q(
        \main/n35 ) );
  INVX0 \main/U95  ( .INP(N313), .ZN(\main/n145 ) );
  MUX21X1 \main/U94  ( .IN1(N305), .IN2(\main/n200 ), .S(N355), .Q(\main/n34 )
         );
  INVX0 \main/U93  ( .INP(N305), .ZN(\main/n200 ) );
  INVX0 \main/U92  ( .INP(N309), .ZN(\main/n193 ) );
  INVX0 \main/U91  ( .INP(N294), .ZN(\main/n190 ) );
  AO21X1 \main/U90  ( .IN1(\main/n77 ), .IN2(N49), .IN3(\main/n33 ), .Q(N2018)
         );
  AO222X1 \main/U89  ( .IN1(N234), .IN2(\main/n32 ), .IN3(N234), .IN4(N74), 
        .IN5(\main/n32 ), .IN6(N87), .Q(\main/n33 ) );
  NAND2X0 \main/U88  ( .IN1(\main/n153 ), .IN2(N241), .QN(N1969) );
  INVX0 \main/U87  ( .INP(\main/n152 ), .ZN(\main/n153 ) );
  NAND4X0 \main/U86  ( .IN1(\main/n30 ), .IN2(\main/n29 ), .IN3(\main/n28 ), 
        .IN4(\main/n27 ), .QN(\main/n152 ) );
  INVX0 \main/U85  ( .INP(N1028), .ZN(\main/n31 ) );
  NOR2X0 \main/U84  ( .IN1(\main/n26 ), .IN2(\main/n25 ), .QN(N1817) );
  AO22X1 \main/U83  ( .IN1(\main/n69 ), .IN2(N136), .IN3(\main/n68 ), .IN4(
        N124), .Q(\main/n25 ) );
  AO22X1 \main/U82  ( .IN1(\main/n67 ), .IN2(N100), .IN3(\main/n66 ), .IN4(
        N112), .Q(\main/n26 ) );
  NOR2X0 \main/U81  ( .IN1(\main/n24 ), .IN2(\main/n23 ), .QN(N1818) );
  AO22X1 \main/U80  ( .IN1(\main/n69 ), .IN2(N138), .IN3(\main/n68 ), .IN4(
        N126), .Q(\main/n23 ) );
  AO22X1 \main/U79  ( .IN1(\main/n67 ), .IN2(N102), .IN3(\main/n66 ), .IN4(
        N114), .Q(\main/n24 ) );
  NOR2X0 \main/U78  ( .IN1(\main/n22 ), .IN2(\main/n21 ), .QN(N1816) );
  AO22X1 \main/U77  ( .IN1(\main/n69 ), .IN2(N137), .IN3(\main/n68 ), .IN4(
        N125), .Q(\main/n21 ) );
  NOR2X0 \main/U76  ( .IN1(N319), .IN2(\main/n20 ), .QN(\main/n68 ) );
  NOR2X0 \main/U75  ( .IN1(N319), .IN2(N322), .QN(\main/n69 ) );
  AO22X1 \main/U74  ( .IN1(\main/n67 ), .IN2(N101), .IN3(\main/n66 ), .IN4(
        N113), .Q(\main/n22 ) );
  AND2X1 \main/U73  ( .IN1(N319), .IN2(N322), .Q(\main/n66 ) );
  AND2X1 \main/U72  ( .IN1(\main/n20 ), .IN2(N319), .Q(\main/n67 ) );
  INVX0 \main/U71  ( .INP(N322), .ZN(\main/n20 ) );
  INVX0 \main/U70  ( .INP(N1821), .ZN(N2012) );
  NOR2X0 \main/U69  ( .IN1(\main/n19 ), .IN2(\main/n18 ), .QN(N1821) );
  AO22X1 \main/U68  ( .IN1(\main/n74 ), .IN2(N90), .IN3(\main/n75 ), .IN4(N77), 
        .Q(\main/n18 ) );
  AO22X1 \main/U67  ( .IN1(\main/n76 ), .IN2(N64), .IN3(\main/n77 ), .IN4(N52), 
        .Q(\main/n19 ) );
  NAND4X0 \main/U66  ( .IN1(\main/n17 ), .IN2(\main/n16 ), .IN3(\main/n15 ), 
        .IN4(\main/n14 ), .QN(N2020) );
  NAND4X0 \main/U65  ( .IN1(\main/n13 ), .IN2(\main/n12 ), .IN3(\main/n11 ), 
        .IN4(\main/n10 ), .QN(N2016) );
  NAND4X0 \main/U64  ( .IN1(\main/n9 ), .IN2(\main/n8 ), .IN3(\main/n7 ), 
        .IN4(\main/n6 ), .QN(N2014) );
  NAND4X0 \main/U63  ( .IN1(\main/n5 ), .IN2(\main/n4 ), .IN3(\main/n3 ), 
        .IN4(\main/n2 ), .QN(N2022) );
  NOR2X0 \main/U62  ( .IN1(N234), .IN2(\main/n32 ), .QN(\main/n77 ) );
  NOR2X0 \main/U61  ( .IN1(N227), .IN2(\main/n1 ), .QN(\main/n76 ) );
  NOR2X0 \main/U60  ( .IN1(\main/n32 ), .IN2(\main/n1 ), .QN(\main/n75 ) );
  INVX0 \main/U59  ( .INP(N234), .ZN(\main/n1 ) );
  INVX0 \main/U58  ( .INP(N227), .ZN(\main/n32 ) );
  NOR2X0 \main/U57  ( .IN1(N227), .IN2(N234), .QN(\main/n74 ) );
  NAND2X0 \main/U56  ( .IN1(N325), .IN2(\main/n31 ), .QN(N1269) );
  NAND2X0 \main/U55  ( .IN1(N231), .IN2(\main/n31 ), .QN(N1029) );
  NAND2X0 \main/U54  ( .IN1(N237), .IN2(N7), .QN(N1028) );
  NAND2X0 \main/U53  ( .IN1(\main/n77 ), .IN2(N47), .QN(\main/n2 ) );
  NAND2X0 \main/U52  ( .IN1(N14), .IN2(\main/n90 ), .QN(\main/n149 ) );
  NAND2X0 \main/U51  ( .IN1(\main/n77 ), .IN2(N51), .QN(\main/n6 ) );
  NAND2X0 \main/U50  ( .IN1(N11), .IN2(\main/n211 ), .QN(\main/n212 ) );
  NAND2X0 \main/U49  ( .IN1(\main/n77 ), .IN2(N48), .QN(\main/n14 ) );
  NAND2X0 \main/U48  ( .IN1(\main/n75 ), .IN2(N79), .QN(\main/n47 ) );
  NAND2X0 \main/U47  ( .IN1(\main/n141 ), .IN2(\main/n208 ), .QN(\main/n137 )
         );
  NAND2X0 \main/U46  ( .IN1(\main/n77 ), .IN2(N43), .QN(\main/n27 ) );
  NAND2X0 \main/U45  ( .IN1(N275), .IN2(N2018), .QN(\main/n165 ) );
  NAND2X0 \main/U44  ( .IN1(\main/n66 ), .IN2(N111), .QN(\main/n62 ) );
  NAND2X0 \main/U43  ( .IN1(N284), .IN2(\main/n134 ), .QN(\main/n204 ) );
  NAND2X0 \main/U42  ( .IN1(\main/n155 ), .IN2(N230), .QN(\main/n96 ) );
  NAND2X0 \main/U41  ( .IN1(\main/n141 ), .IN2(N2022), .QN(\main/n131 ) );
  NAND2X0 \main/U40  ( .IN1(N8), .IN2(\main/n114 ), .QN(\main/n128 ) );
  NAND2X0 \main/U39  ( .IN1(N2012), .IN2(\main/n123 ), .QN(\main/n125 ) );
  NAND2X0 \main/U38  ( .IN1(N8), .IN2(N2016), .QN(\main/n110 ) );
  NAND2X0 \main/U37  ( .IN1(N8), .IN2(N2014), .QN(\main/n106 ) );
  NAND2X0 \main/U36  ( .IN1(\main/n115 ), .IN2(N8), .QN(\main/n105 ) );
  NAND2X0 \main/U35  ( .IN1(\main/n74 ), .IN2(N88), .QN(\main/n13 ) );
  NAND2X0 \main/U34  ( .IN1(\main/n75 ), .IN2(N75), .QN(\main/n12 ) );
  NAND2X0 \main/U33  ( .IN1(\main/n77 ), .IN2(N50), .QN(\main/n10 ) );
  NAND2X0 \main/U32  ( .IN1(\main/n76 ), .IN2(N60), .QN(\main/n3 ) );
  NAND2X0 \main/U31  ( .IN1(\main/n74 ), .IN2(N85), .QN(\main/n5 ) );
  NAND2X0 \main/U30  ( .IN1(\main/n75 ), .IN2(N72), .QN(\main/n4 ) );
  NAND2X0 \main/U29  ( .IN1(\main/n76 ), .IN2(N63), .QN(\main/n7 ) );
  NAND2X0 \main/U28  ( .IN1(\main/n74 ), .IN2(N89), .QN(\main/n9 ) );
  NAND2X0 \main/U27  ( .IN1(\main/n75 ), .IN2(N76), .QN(\main/n8 ) );
  NAND2X0 \main/U26  ( .IN1(\main/n74 ), .IN2(N91), .QN(\main/n44 ) );
  NAND2X0 \main/U25  ( .IN1(\main/n75 ), .IN2(N78), .QN(\main/n43 ) );
  NAND2X0 \main/U24  ( .IN1(\main/n77 ), .IN2(N53), .QN(\main/n41 ) );
  NAND2X0 \main/U23  ( .IN1(\main/n76 ), .IN2(N61), .QN(\main/n15 ) );
  NAND2X0 \main/U22  ( .IN1(\main/n74 ), .IN2(N86), .QN(\main/n17 ) );
  NAND2X0 \main/U21  ( .IN1(\main/n75 ), .IN2(N73), .QN(\main/n16 ) );
  NAND2X0 \main/U20  ( .IN1(\main/n76 ), .IN2(N62), .QN(\main/n11 ) );
  NAND2X0 \main/U19  ( .IN1(\main/n74 ), .IN2(N93), .QN(\main/n81 ) );
  NAND2X0 \main/U18  ( .IN1(\main/n75 ), .IN2(N80), .QN(\main/n80 ) );
  NAND2X0 \main/U17  ( .IN1(\main/n77 ), .IN2(N55), .QN(\main/n78 ) );
  NAND2X0 \main/U16  ( .IN1(\main/n76 ), .IN2(N66), .QN(\main/n46 ) );
  NAND2X0 \main/U15  ( .IN1(\main/n74 ), .IN2(N92), .QN(\main/n48 ) );
  NAND2X0 \main/U14  ( .IN1(\main/n77 ), .IN2(N54), .QN(\main/n45 ) );
  NAND2X0 \main/U13  ( .IN1(\main/n76 ), .IN2(N56), .QN(\main/n28 ) );
  NAND2X0 \main/U12  ( .IN1(\main/n74 ), .IN2(N81), .QN(\main/n30 ) );
  NAND2X0 \main/U11  ( .IN1(\main/n75 ), .IN2(N68), .QN(\main/n29 ) );
  NAND2X0 \main/U10  ( .IN1(N278), .IN2(N2020), .QN(\main/n166 ) );
  NAND2X0 \main/U9  ( .IN1(\main/n76 ), .IN2(N65), .QN(\main/n42 ) );
  NAND2X0 \main/U8  ( .IN1(\main/n69 ), .IN2(N135), .QN(\main/n65 ) );
  NAND2X0 \main/U7  ( .IN1(\main/n67 ), .IN2(N99), .QN(\main/n63 ) );
  NAND2X0 \main/U6  ( .IN1(\main/n76 ), .IN2(N67), .QN(\main/n79 ) );
  NAND2X0 \main/U5  ( .IN1(\main/n68 ), .IN2(N123), .QN(\main/n64 ) );
  NAND2X0 \main/U4  ( .IN1(\main/n69 ), .IN2(N131), .QN(\main/n58 ) );
  NAND2X0 \main/U3  ( .IN1(\main/n67 ), .IN2(N95), .QN(\main/n56 ) );
  NAND2X0 \main/U2  ( .IN1(\main/n66 ), .IN2(N107), .QN(\main/n55 ) );
  NAND2X0 \main/U1  ( .IN1(\main/n68 ), .IN2(N119), .QN(\main/n57 ) );
  NOR4X0 \flip/U85  ( .IN1(\flip/n82 ), .IN2(\flip/n81 ), .IN3(\flip/n80 ), 
        .IN4(\flip/n79 ), .QN(N3875) );
  OR4X1 \flip/U84  ( .IN1(\flip/n78 ), .IN2(\flip/n77 ), .IN3(\flip/n76 ), 
        .IN4(\flip/n75 ), .Q(\flip/n79 ) );
  NAND4X0 \flip/U83  ( .IN1(\flip/n74 ), .IN2(\flip/n73 ), .IN3(\flip/n72 ), 
        .IN4(\flip/n71 ), .QN(\flip/n75 ) );
  OA221X1 \flip/U82  ( .IN1(N138), .IN2(keyinput35), .IN3(N90), .IN4(
        keyinput38), .IN5(\flip/n70 ), .Q(\flip/n71 ) );
  AOI22X1 \flip/U81  ( .IN1(N138), .IN2(keyinput35), .IN3(N90), .IN4(
        keyinput38), .QN(\flip/n70 ) );
  OA221X1 \flip/U80  ( .IN1(N54), .IN2(keyinput34), .IN3(N284), .IN4(
        keyinput36), .IN5(\flip/n69 ), .Q(\flip/n72 ) );
  AOI22X1 \flip/U79  ( .IN1(N54), .IN2(keyinput34), .IN3(N284), .IN4(
        keyinput36), .QN(\flip/n69 ) );
  OA221X1 \flip/U78  ( .IN1(N74), .IN2(keyinput43), .IN3(N87), .IN4(keyinput40), .IN5(\flip/n68 ), .Q(\flip/n73 ) );
  AOI22X1 \flip/U77  ( .IN1(N74), .IN2(keyinput43), .IN3(N87), .IN4(keyinput40), .QN(\flip/n68 ) );
  OA221X1 \flip/U76  ( .IN1(N287), .IN2(keyinput44), .IN3(N89), .IN4(
        keyinput46), .IN5(\flip/n67 ), .Q(\flip/n74 ) );
  AOI22X1 \flip/U75  ( .IN1(N287), .IN2(keyinput44), .IN3(N89), .IN4(
        keyinput46), .QN(\flip/n67 ) );
  NAND4X0 \flip/U74  ( .IN1(\flip/n66 ), .IN2(\flip/n65 ), .IN3(\flip/n64 ), 
        .IN4(\flip/n63 ), .QN(\flip/n76 ) );
  OA221X1 \flip/U73  ( .IN1(N140), .IN2(keyinput51), .IN3(N113), .IN4(
        keyinput56), .IN5(\flip/n62 ), .Q(\flip/n63 ) );
  AOI22X1 \flip/U72  ( .IN1(N140), .IN2(keyinput51), .IN3(N113), .IN4(
        keyinput56), .QN(\flip/n62 ) );
  OA221X1 \flip/U71  ( .IN1(N119), .IN2(keyinput50), .IN3(N79), .IN4(
        keyinput48), .IN5(\flip/n61 ), .Q(\flip/n64 ) );
  AOI22X1 \flip/U70  ( .IN1(N119), .IN2(keyinput50), .IN3(N79), .IN4(
        keyinput48), .QN(\flip/n61 ) );
  OA221X1 \flip/U69  ( .IN1(N43), .IN2(keyinput61), .IN3(N266), .IN4(
        keyinput62), .IN5(\flip/n60 ), .Q(\flip/n65 ) );
  AOI22X1 \flip/U68  ( .IN1(N43), .IN2(keyinput61), .IN3(N266), .IN4(
        keyinput62), .QN(\flip/n60 ) );
  OA221X1 \flip/U67  ( .IN1(N64), .IN2(keyinput63), .IN3(N107), .IN4(
        keyinput57), .IN5(\flip/n59 ), .Q(\flip/n66 ) );
  AOI22X1 \flip/U66  ( .IN1(N64), .IN2(keyinput63), .IN3(N107), .IN4(
        keyinput57), .QN(\flip/n59 ) );
  NAND4X0 \flip/U65  ( .IN1(\flip/n58 ), .IN2(\flip/n57 ), .IN3(\flip/n56 ), 
        .IN4(\flip/n55 ), .QN(\flip/n77 ) );
  XNOR2X1 \flip/U64  ( .IN1(N104), .IN2(keyinput55), .Q(\flip/n55 ) );
  XNOR2X1 \flip/U63  ( .IN1(N294), .IN2(keyinput54), .Q(\flip/n56 ) );
  XNOR2X1 \flip/U62  ( .IN1(N88), .IN2(keyinput53), .Q(\flip/n57 ) );
  XNOR2X1 \flip/U61  ( .IN1(N117), .IN2(keyinput52), .Q(\flip/n58 ) );
  NAND4X0 \flip/U60  ( .IN1(\flip/n54 ), .IN2(\flip/n53 ), .IN3(\flip/n52 ), 
        .IN4(\flip/n51 ), .QN(\flip/n78 ) );
  XNOR2X1 \flip/U59  ( .IN1(N52), .IN2(keyinput32), .Q(\flip/n51 ) );
  XNOR2X1 \flip/U58  ( .IN1(N278), .IN2(keyinput60), .Q(\flip/n52 ) );
  XNOR2X1 \flip/U57  ( .IN1(N49), .IN2(keyinput59), .Q(\flip/n53 ) );
  XNOR2X1 \flip/U56  ( .IN1(N128), .IN2(keyinput58), .Q(\flip/n54 ) );
  NAND4X0 \flip/U55  ( .IN1(\flip/n50 ), .IN2(\flip/n49 ), .IN3(\flip/n48 ), 
        .IN4(\flip/n47 ), .QN(\flip/n80 ) );
  XNOR2X1 \flip/U54  ( .IN1(N53), .IN2(keyinput41), .Q(\flip/n47 ) );
  XNOR2X1 \flip/U53  ( .IN1(N8), .IN2(keyinput39), .Q(\flip/n48 ) );
  XNOR2X1 \flip/U52  ( .IN1(N63), .IN2(keyinput37), .Q(\flip/n49 ) );
  XNOR2X1 \flip/U51  ( .IN1(N259), .IN2(keyinput33), .Q(\flip/n50 ) );
  NAND4X0 \flip/U50  ( .IN1(\flip/n46 ), .IN2(\flip/n45 ), .IN3(\flip/n44 ), 
        .IN4(\flip/n43 ), .QN(\flip/n81 ) );
  XNOR2X1 \flip/U49  ( .IN1(N73), .IN2(keyinput49), .Q(\flip/n43 ) );
  XNOR2X1 \flip/U48  ( .IN1(N68), .IN2(keyinput47), .Q(\flip/n44 ) );
  XNOR2X1 \flip/U47  ( .IN1(N85), .IN2(keyinput45), .Q(\flip/n45 ) );
  XNOR2X1 \flip/U46  ( .IN1(N65), .IN2(keyinput42), .Q(\flip/n46 ) );
  NOR4X0 \flip/U45  ( .IN1(\flip/n42 ), .IN2(\flip/n41 ), .IN3(\flip/n40 ), 
        .IN4(\flip/n39 ), .QN(\flip/n82 ) );
  OR4X1 \flip/U44  ( .IN1(\flip/n38 ), .IN2(\flip/n37 ), .IN3(\flip/n36 ), 
        .IN4(\flip/n35 ), .Q(\flip/n39 ) );
  NAND4X0 \flip/U43  ( .IN1(\flip/n34 ), .IN2(\flip/n33 ), .IN3(\flip/n32 ), 
        .IN4(\flip/n31 ), .QN(\flip/n35 ) );
  XNOR2X1 \flip/U42  ( .IN1(N113), .IN2(keyinput24), .Q(\flip/n31 ) );
  XNOR2X1 \flip/U41  ( .IN1(N107), .IN2(keyinput25), .Q(\flip/n32 ) );
  XNOR2X1 \flip/U40  ( .IN1(N52), .IN2(keyinput0), .Q(\flip/n33 ) );
  XNOR2X1 \flip/U39  ( .IN1(N278), .IN2(keyinput28), .Q(\flip/n34 ) );
  NAND4X0 \flip/U38  ( .IN1(\flip/n30 ), .IN2(\flip/n29 ), .IN3(\flip/n28 ), 
        .IN4(\flip/n27 ), .QN(\flip/n36 ) );
  XNOR2X1 \flip/U37  ( .IN1(N87), .IN2(keyinput8), .Q(\flip/n27 ) );
  XNOR2X1 \flip/U36  ( .IN1(N74), .IN2(keyinput11), .Q(\flip/n28 ) );
  XNOR2X1 \flip/U35  ( .IN1(N89), .IN2(keyinput14), .Q(\flip/n29 ) );
  XNOR2X1 \flip/U34  ( .IN1(N79), .IN2(keyinput16), .Q(\flip/n30 ) );
  NAND4X0 \flip/U33  ( .IN1(\flip/n26 ), .IN2(\flip/n25 ), .IN3(\flip/n24 ), 
        .IN4(\flip/n23 ), .QN(\flip/n37 ) );
  XNOR2X1 \flip/U32  ( .IN1(N117), .IN2(keyinput20), .Q(\flip/n23 ) );
  XNOR2X1 \flip/U31  ( .IN1(N73), .IN2(keyinput17), .Q(\flip/n24 ) );
  XNOR2X1 \flip/U30  ( .IN1(N68), .IN2(keyinput15), .Q(\flip/n25 ) );
  XNOR2X1 \flip/U29  ( .IN1(N85), .IN2(keyinput13), .Q(\flip/n26 ) );
  NAND4X0 \flip/U28  ( .IN1(\flip/n22 ), .IN2(\flip/n21 ), .IN3(\flip/n20 ), 
        .IN4(\flip/n19 ), .QN(\flip/n38 ) );
  XNOR2X1 \flip/U27  ( .IN1(N49), .IN2(keyinput27), .Q(\flip/n19 ) );
  XNOR2X1 \flip/U26  ( .IN1(N128), .IN2(keyinput26), .Q(\flip/n20 ) );
  XNOR2X1 \flip/U25  ( .IN1(N294), .IN2(keyinput22), .Q(\flip/n21 ) );
  XNOR2X1 \flip/U24  ( .IN1(N88), .IN2(keyinput21), .Q(\flip/n22 ) );
  NAND4X0 \flip/U23  ( .IN1(\flip/n18 ), .IN2(\flip/n17 ), .IN3(\flip/n16 ), 
        .IN4(\flip/n15 ), .QN(\flip/n40 ) );
  XNOR2X1 \flip/U22  ( .IN1(N63), .IN2(keyinput5), .Q(\flip/n15 ) );
  XNOR2X1 \flip/U21  ( .IN1(N8), .IN2(keyinput7), .Q(\flip/n16 ) );
  OA221X1 \flip/U20  ( .IN1(\flip/n14 ), .IN2(keyinput9), .IN3(\flip/n13 ), 
        .IN4(keyinput10), .IN5(\flip/n12 ), .Q(\flip/n17 ) );
  AOI22X1 \flip/U19  ( .IN1(\flip/n14 ), .IN2(keyinput9), .IN3(\flip/n13 ), 
        .IN4(keyinput10), .QN(\flip/n12 ) );
  INVX0 \flip/U18  ( .INP(N65), .ZN(\flip/n13 ) );
  INVX0 \flip/U17  ( .INP(N53), .ZN(\flip/n14 ) );
  OA221X1 \flip/U16  ( .IN1(\flip/n11 ), .IN2(keyinput1), .IN3(N284), .IN4(
        keyinput4), .IN5(\flip/n10 ), .Q(\flip/n18 ) );
  AOI22X1 \flip/U15  ( .IN1(\flip/n11 ), .IN2(keyinput1), .IN3(N284), .IN4(
        keyinput4), .QN(\flip/n10 ) );
  INVX0 \flip/U14  ( .INP(N259), .ZN(\flip/n11 ) );
  AO221X1 \flip/U13  ( .IN1(N54), .IN2(keyinput2), .IN3(keyinput6), .IN4(N90), 
        .IN5(\flip/n9 ), .Q(\flip/n41 ) );
  OAI22X1 \flip/U12  ( .IN1(N54), .IN2(keyinput2), .IN3(N90), .IN4(keyinput6), 
        .QN(\flip/n9 ) );
  NAND4X0 \flip/U11  ( .IN1(\flip/n8 ), .IN2(\flip/n7 ), .IN3(\flip/n6 ), 
        .IN4(\flip/n5 ), .QN(\flip/n42 ) );
  OA221X1 \flip/U10  ( .IN1(N287), .IN2(keyinput12), .IN3(N138), .IN4(
        keyinput3), .IN5(\flip/n4 ), .Q(\flip/n5 ) );
  AOI22X1 \flip/U9  ( .IN1(N287), .IN2(keyinput12), .IN3(N138), .IN4(keyinput3), .QN(\flip/n4 ) );
  OA221X1 \flip/U8  ( .IN1(N140), .IN2(keyinput19), .IN3(N119), .IN4(
        keyinput18), .IN5(\flip/n3 ), .Q(\flip/n6 ) );
  AOI22X1 \flip/U7  ( .IN1(N140), .IN2(keyinput19), .IN3(N119), .IN4(
        keyinput18), .QN(\flip/n3 ) );
  OA221X1 \flip/U6  ( .IN1(N266), .IN2(keyinput30), .IN3(N64), .IN4(keyinput31), .IN5(\flip/n2 ), .Q(\flip/n7 ) );
  AOI22X1 \flip/U5  ( .IN1(N266), .IN2(keyinput30), .IN3(N64), .IN4(keyinput31), .QN(\flip/n2 ) );
  OA221X1 \flip/U4  ( .IN1(N104), .IN2(keyinput23), .IN3(N43), .IN4(keyinput29), .IN5(\flip/n1 ), .Q(\flip/n8 ) );
  AOI22X1 \flip/U3  ( .IN1(N104), .IN2(keyinput23), .IN3(N43), .IN4(keyinput29), .QN(\flip/n1 ) );
endmodule

