// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract OADreamers_2 {
    // @dev Mapping to store existence of nftIds
    mapping(uint16 => bool) private nftIdExists;

    function addFirstPart() public {
        uint16[1000] memory dreamerIds = [7320,7316,7312,7310,7307,73,7289,7287,7286,7285,7282,7277,7273,7272,7271,7258,7255,7251,7246,7242,7241,7240,7239,7238,7235,7231,7230,7223,7220,7218,7217,7210,7206,7193,7187,7186,7185,7182,718,7176,7173,7171,7160,716,7159,7157,7153,715,7148,7147,7142,7141,7140,7138,7135,7128,7121,7114,7107,7101,7092,709,7088,7087,7086,7084,7077,7076,7075,7071,7070,707,7065,7057,7056,7055,7054,7053,7049,7047,7042,7040,7035,7033,7024,7022,7020,702,7015,7014,701,7009,7008,7,6997,6992,6986,6985,6984,6982,6981,6979,6977,6968,6966,6963,6959,6948,6947,6939,6937,6932,6931,6917,6909,6897,6892,689,6887,6884,6881,6879,6872,6862,686,6849,6848,6836,6833,6831,683,6819,6817,6812,6810,681,6808,6799,6796,6792,6789,6786,6782,6781,6778,6776,6775,6773,6770,6769,6766,6765,6761,6759,6757,6754,6753,6744,6734,6732,6730,6725,6718,6717,6714,6710,6708,6703,6697,6695,6693,6691,6689,6688,6679,6674,6673,6666,6665,6662,6658,6654,6652,6645,6640,6638,663,6627,6624,6623,6621,6619,6615,6610,661,6608,6607,6601,6600,660,6599,6595,6594,6592,6591,6589,6588,6580,6579,6577,6573,6569,6567,656,6549,6545,6544,6534,6533,6532,6526,6522,6509,6508,6504,6503,6501,6500,6497,6495,6492,6486,6483,6480,6479,6478,6473,6471,647,6469,6466,6465,6462,6461,6458,6456,6455,6454,645,6446,6445,6441,6439,6433,6432,643,6426,6422,6421,6414,6410,641,6406,640,6399,6397,6396,6395,6388,638,6373,6372,6370,6369,6368,6360,6342,6340,634,6338,6331,6330,633,6322,6315,6313,6310,6304,6300,6298,6290,6286,6280,6272,6264,6263,6262,6261,6256,6252,6251,6250,6247,6244,6240,6225,6219,6218,6215,621,6208,6205,6199,6196,6192,6188,6183,6182,6181,6180,6171,6168,6165,6163,6161,6158,6149,6141,614,6139,6138,6137,6129,6123,6107,6104,6096,6094,6091,609,6087,6086,6084,6081,608,6079,6075,6072,6071,607,6065,6061,606,6056,6049,6048,6046,6045,6037,6034,6032,6031,6030,6024,6018,6017,6016,6015,6009,6008,6007,5998,5997,5995,5993,5989,5983,598,5979,5978,5977,5973,5970,5966,5963,5960,5958,5957,5952,5951,595,5945,5943,5942,5939,5938,5936,5931,5923,5922,5913,5912,5911,591,5907,5904,590,5898,5897,5895,5894,5893,5892,5888,588,5879,5878,5877,5876,5875,5866,5863,5862,5859,5857,5854,5853,585,5847,5840,5839,5836,5833,5824,5823,5822,5808,5806,5805,5803,5802,5800,5799,5795,5791,579,5785,578,5779,5778,5776,5775,5773,5769,5765,5764,5763,5750,5749,5745,5743,5742,5732,5729,5728,5727,5721,5718,5717,5716,5715,5703,5702,570,5697,5694,5691,5684,5681,5680,567,5667,5662,5661,5658,5657,5656,5655,5654,5652,5651,5650,5643,5639,5635,5634,5626,5624,5623,5622,562,561,5607,5606,5605,5600,56,5598,5595,559,558,5579,5576,5574,5569,5567,5561,5559,5558,5552,555,5548,5546,5543,5536,5531,553,5524,5522,5519,5518,5515,5514,5511,5510,551,5508,5505,5503,5494,5491,5486,5478,5476,547,5468,5467,5460,5458,5456,5443,5441,5438,5432,5431,5430,5427,5423,5421,5420,5419,5415,541,5403,5397,5390,5388,538,5376,5375,5373,5368,5364,5363,5359,5354,5353,535,5347,5346,5342,5341,534,5334,5332,5330,5329,5328,5327,5326,5325,5320,5316,5307,5303,5299,5289,5283,5280,528,5277,5275,5262,5258,5249,5248,5246,5245,5241,5239,5235,5233,5231,5230,5229,5227,5224,5223,5221,5215,5210,521,5201,5195,5191,5189,5183,5182,5181,5172,5163,5159,5156,5150,515,5148,5146,5142,5139,5130,5129,5127,5126,5123,5122,5119,5115,5106,5102,5101,5096,5084,5083,5082,5081,5080,5079,5077,5076,5070,5067,5066,5065,5063,5059,5052,5046,5044,5043,5041,5038,5035,5034,5032,5030,503,5028,5026,5020,5017,5014,5013,501,5007,5006,5003,500,5,4999,4992,4991,4990,4988,4978,4977,4974,4971,4966,4963,4962,4959,4958,4957,4955,4950,495,4946,4945,4943,494,4937,4936,4934,4932,4927,4923,4922,4919,4917,4914,4905,4898,4894,4889,4888,4887,4879,4876,4875,4873,4870,4862,4861,4859,4857,4855,4854,4849,4848,4845,484,4836,4833,4832,4830,4829,4824,4823,4822,4821,4820,482,4817,4814,4812,4811,4802,48,4799,4798,4795,4793,4790,478,477,4766,4761,4760,4759,4757,4754,4751,475,4746,4744,4742,4740,4737,4736,4732,4729,4728,4724,4722,4721,472,4719,4718,4715,4714,4713,4709,4703,4700,4698,4697,4695,4694,4684,4681,4678,4675,4646,464,4638,4633,4632,4628,4626,4625,4624,4623,4618,4617,4613,4610,4602,460,4599,4597,4595,459,4584,4581,4580,4578,4574,4572,457,4565,4564,4562,456,4549,4546,4544,4539,4535,4534,4530,4529,4527,4521,4520,4518,4511,4499,4493,4487,4482,4480,4478,4477,4474,4471,447,4469,4468,4467,4459,4457,445,4449,4440,4435,4428,4426,4425,4424,4423,4419,4418,441,4409,4407,4404,440,4395,4394,4392,4391,4390,439,4386,4384,4378,4368,4367,4363,4353,4352,4346,4344,4341,4340,4333,4332,4331,4328,4325,4324,4321,432,4314,4312,4311,4310,4308,4305,4304,43,4296,4294,4291,4286,4283,4281,4276,4273,4269,4266,4264,4260,426,4250,4249,4247,4246,4244,4241,4240,4234,4233,4232,423,4225,4224,4222,4221,4216,4214,4212,4210,4203,420,4195,4193,4192,4187,4185,4173,4171,4168,4165,4164,4156,4154,4153,4152,4151,4150,4149,4147,4146,4145,4144,4142,4139,4137,4132,4130,413,4125,4124,4122,4121,4120,4114,4112,4111,4109,4108,4105,4101,4100,410,41,4099,4097,4096,4094,4091,409,4089,4087,4081,408,4076,4075,4072];
        for (uint16 i = 0; i < dreamerIds.length; i++) {
            nftIdExists[dreamerIds[i]] = true;
        }
    }

    function addSecondPart() public {
        uint16[1000] memory dreamerIds = [4071,4070,4063,4057,4052,4051,4048,4044,4036,4035,4032,4028,4027,4025,4021,4020,4016,4013,4012,4010,401,4006,4004,4001,4000,4,3996,3994,3993,399,3987,3985,3982,398,3971,3968,3967,3966,3965,3964,396,3957,3955,3954,3949,3948,3946,3936,3933,3932,3931,3930,393,392,3916,3915,3914,3907,3905,3904,3902,39,3892,3887,388,3877,3866,3864,3862,386,3858,3848,3838,3835,383,3826,3822,3821,3812,381,3809,3805,3803,3802,3796,3795,3793,3791,379,3789,3786,378,3776,3775,3772,3770,3769,3768,3767,3765,3763,3762,3761,3760,376,3759,3753,3749,3744,3741,3736,3735,3733,3730,3728,3724,3723,3722,372,3718,3717,3715,3713,371,3706,3701,3690,369,3686,3685,3680,3678,3671,3666,3660,366,3659,3653,3652,3649,3646,3643,3633,3630,363,3624,3622,362,3615,3614,3611,3610,3605,3601,360,3598,3596,3595,3594,3590,3586,3583,3577,3575,3566,3558,3556,3542,3538,3537,3536,3528,3525,3524,3523,3520,3519,3513,351,3507,3504,3499,3498,3497,3496,349,3486,3483,348,3479,3478,3475,3474,347,3462,3453,3449,3447,3444,3438,3436,3431,3429,3427,3425,3423,3422,3418,3411,3404,3401,3396,3386,3385,3383,3380,338,3378,3377,3375,3371,3370,337,3367,3366,3365,336,3359,3357,3354,3353,3352,335,3348,3344,3342,3329,3320,332,3315,3314,3313,3311,331,3305,3301,3300,330,3298,3286,3283,3281,3276,3274,3271,327,3266,3262,3259,3251,3249,3247,3246,3245,3243,3242,3238,3234,3231,3230,3229,3228,3227,3222,3220,3213,3211,3209,3204,3201,3196,3194,3192,3191,3190,3188,3187,3184,3178,3176,3174,3170,3169,3163,3162,3161,3145,3144,3139,3138,3134,3131,3130,3123,3116,3111,3107,3106,3105,3102,3101,3097,3094,3090,3088,3087,3086,3085,3083,308,3077,3075,3071,307,3068,3067,3065,3061,3060,3059,3056,3054,3052,3051,305,3046,3044,3042,3038,3036,3031,3026,3025,302,3017,3015,3011,3001,300,2998,2995,299,2987,2984,298,2979,2970,2963,2960,2957,2951,2946,2945,2944,2940,294,2938,2937,2935,2927,2919,2915,2913,2912,291,2909,2907,2906,2903,2902,2901,2896,2893,2884,2879,2877,2876,2875,2870,2867,2862,2860,286,2855,285,2846,2845,2844,2841,284,2838,2834,2829,2828,2826,2824,282,2816,2815,2814,2813,2812,2809,2807,2806,2797,2796,279,2789,2788,2787,2784,2782,2781,2780,278,2777,2768,2767,2766,2765,2760,2757,2751,2746,2745,2741,274,2732,273,2729,2723,2722,2718,2717,2715,2712,2711,2708,2703,2702,2700,2699,2697,2692,2690,2683,2681,2679,2677,2669,2668,2664,2657,2650,2646,2645,2644,2641,264,2637,2627,2626,2625,2623,2622,2620,2619,2604,2602,260,2599,2598,2594,2593,2590,259,2576,2575,2571,2570,257,2566,2565,2559,2554,2552,255,2549,2542,2540,2539,253,2527,2525,2524,2522,2511,2509,2506,2505,2504,2498,2497,2495,2491,2489,2485,2482,2478,2477,2476,2470,247,2468,2466,2465,2461,2455,245,2449,2445,2441,2430,2428,2426,2421,2420,242,2418,2417,2416,2413,2412,2398,2397,2395,2394,2390,239,2389,2387,2384,2382,2379,2378,2370,236,2359,2357,2356,2355,2354,2353,2351,235,2349,2347,2344,2343,2339,2336,2334,2330,2327,2313,231,2309,2308,2301,23,2298,2297,2293,229,2288,2281,228,2279,2277,2276,2273,2269,2268,2261,2259,2257,2256,2249,2248,2247,2246,2244,2242,2241,2232,2230,223,2229,2227,2225,2222,222,2219,2212,2203,2202,2200,22,2199,2196,2192,2191,219,2185,2183,2181,2174,217,2165,2164,2159,2154,2152,2150,2144,2135,2132,2130,2129,2125,2124,2121,2120,2119,2116,2115,2114,2111,2110,2105,2101,2100,2093,209,2089,2085,2084,2081,2074,2071,207,2060,2058,2056,2055,2053,2051,2050,2048,2047,2041,2036,2035,2034,2031,2028,2027,2020,2014,2012,2011,2010,2009,2008,2006,2000,200,1999,1998,1996,1995,1988,1987,1983,1981,1978,1976,1974,1970,1969,1964,1963,196,1955,1953,1951,1950,1940,194,1939,1936,193,1927,1923,1918,1914,1913,1911,1910,191,1908,1904,19,1897,1894,1892,1890,1887,1884,1882,1879,1872,187,1868,1867,1863,1862,1853,1852,1847,1846,1843,1841,1840,1837,1836,1834,1832,1831,1830,183,1826,1814,1810,1809,1800,18,1797,1796,1794,179,1789,1780,1777,1776,1775,1774,1768,1767,1755,1754,1753,1745,174,1737,1732,1729,1718,1715,1713,1710,1708,1706,1700,1699,1693,1692,1691,1690,1688,1687,1669,1667,1663,1662,1658,1654,1653,1650,165,1647,1646,1643,1642,1641,1632,1631,1628,1627,1616,1613,1612,1611,1609,1603,16,1599,1598,1597,1593,1592,1591,1581,158,1576,1571,1570,1563,1553,155,1547,1546,1545,1540,1531,1526,1523,1520,152,1517,1513,1510,1505,1500,1499,1498,1495,1491,1485,1484,148,1479,1476,1472,1469,1467,1466,1465,1457,1456,1454,1452,1451,1446,1442,1440,1439,1437,1433,1427,1415,1413,1408,1407,1401,140,14,1399,1398,1391,1390,1388,1387,1383,1373,1372,1370,1356,1350,135,1346,1341,1336,1335,1321,1320,1319,1318,1311,1309,1308,1303,1301,13,1295,1290,1287,1285,1282,1279,1278,1277,1276,1269,1268,1266,1262,126,1259,1255,125,1249,1246,1245,1239,1237,1236,1231,1229,1227,1225,1224,1222,1221,1220,1218,1210,1209,1207,1204,1196,1194,1184,118,1174,117,1169,1167,1166,1165,1162,1160,1159,1156,1154,1153,1152,1147,1140,1132,113,1129,1128,1126,1123,1113,1110,111,1099,1097,1096,1093,1092,1089,1088,1085,1078,1077,107,1069,1062,1060,1056,1052,1040,1038,103,1025,1024,1023,1020,1016,1014,1013,1009,1002,1001,10,0];
        for (uint16 i = 0; i < dreamerIds.length; i++) {
            nftIdExists[dreamerIds[i]] = true;
        }
    }

    // Function to check if a number is in the collection
    function isNFTPresent(uint16 nftId) public view returns (bool) {
        return nftIdExists[nftId];
    }
}