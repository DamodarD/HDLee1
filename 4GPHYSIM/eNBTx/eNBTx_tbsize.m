function TBS = eNBTx_tbsize(MCS,Nprb)
%% *************************************************************************************************
%  FUNCTION NAME	:  eNBTx_eNBTx_tbsize
%  DATE CREATED     :  3/7/2017
%  DESCRIPTION      :  TB Size computation 
%  INPUT            :  MCS and Number of PRBS  
%  OUTPUT           :  TB size 
%  CODE VERSION     :  0.1
%  Team				:   DD/VB
%* *************************************************************************************************
eNBTx_tbsize(:,:,1) = [[16 32 56 88 120 152 176 208 224 256];
			   [24 56 88 144 176 208 224 256 328 344];
			   [32 72 144 176 208 256 296 328 376 424];
			   [40 104 176 208 256 328 392 440 504 568];
			   [56 120 208 256 328 408 488 552 632 696];
			   [72 144 224 328 424 504 600 680 776 872];
			   [328 176 256 392 504 600 712 808 936 1032];
			   [104 224 328 472 584 712 840 968 1096 1224];
			   [120 256 392 536 680 808 968 1096 1256 1384];
		       [136 296 456 616 776 936 1096 1256 1416 1544];
			   [144 328 504 680 872 1032 1224 1384 1544 1736];
			   [176 376 584 776 1000 1192 1384 1608 1800 2024];
			   [208 440 680 904 1128 1352 1608 1800 2024 2280];
			   [224 488 744 1000 1256 1544 1800 2024 2280 2536];
			   [256 552 840 1128 1416 1736 1992 2280 2600 2856];
			   [280 600 904 1224 1544 1800 2152 2472 2728 3112];
	    	   [328 632 968 1288 1608 1928 2280 2600 2984 3240];
			   [336 696 1064 1416 1800 2152 2536 2856 3240 3624];
			   [376 776 1160 1544 1992 2344 2792 3112 3624 4008];
			   [408 840 1288 1736 2152 2600 2984 3496 3880 4264];
			   [440 904 1384 1864 2344 2792 3240 3752 4136 4584];
			   [488 1000 1480 1992 2472 2984 3496 4008 4584 4968];
			   [520 1064 1608 2152 2664 3240 3752 4264 4776 5352];
			   [552 1128 1736 2280 2856 3496 4008 4584 5160 5736];
			   [584 1192 1800 2408 2984 3624 4264 4968 5544 5992];
			   [616 1256 1864 2536 3112 3752 4392 5160 5736 6200];
			   [712 1480 2216 2984 3752 4392 5160 5992 6712 7480]];

eNBTx_tbsize(:,:,2)=    [[288 328 344 376 392 424 456 488 504 536];[376 424 456 488 520 568 600 632 680 712];
                [472 520 568 616 648 696 744 776 840 872];[616 680 744 808 872 904 968 1032 1096 1160];
                [776 840 904 1000 1064 1128 1192 1288 1352 1416];[968 1032 1128 1224 1320 1384 1480 1544 1672 1736];
                [1128 1224 1352 1480 1544 1672 1736 1864 1992 2088];[1320 1480 1608 1672 1800 1928 2088 2216 2344 2472];
                [1544 1672 1800 1928 2088 2216 2344 2536 2664 2792];[1736 1864 2024 2216 2344 2536 2664 2856 2984 3112];
                [1928 2088 2280 2472 2664 2792 2984 3112 3368 3496];[2216 2408 2600 2792 2984 3240 3496 3624 3880 4008];
                [2472 2728 2984 3240 3368 3624 3880 4136 4392 4584];[2856 3112 3368 3624 3880 4136 4392 4584 4968 5160];
                [3112 3496 3752 4008 4264 4584 4968 5160 5544 5736];[3368 3624 4008 4264 4584 4968 5160 5544 5736 6200];
                [3624 3880 4264 4584 4968 5160 5544 5992 6200 6456];[4008 4392 4776 5160 5352 5736 6200 6456 6712 7224];
                [4392 4776 5160 5544 5992 6200 6712 7224 7480 7992];[4776 5160 5544 5992 6456 6968 7224 7736 8248 8504];
                [5160 5544 5992 6456 6968 7480 7992 8248 8760 9144];[5544 5992 6456 6968 7480 7992 8504 9144 9528 9912];
                [5992 6456 6968 7480 7992 8504 9144 9528 10296 10680];[6200 6968 7480 7992 8504 9144 9912 10296 11064 11448];
                [6712 7224 7992 8504 9144 9912 10296 11064 11448 12216];[6968 7480 8248 8760 9528 10296 10680 11448 12216 12576];
                [8248 8760 9528 10296 11064 11832 12576 13536 14112 14688]]; 

 eNBTx_tbsize(:,:,3)=   [[568 600 616 648 680 712 744 776 776 808];[744 776 808 872 904 936 968 1000 1032 1064];
                [936 968 1000 1064 1096 1160 1192 1256 1288 1320];[1224 1256 1320 1384 1416 1480 1544 1608 1672 1736];
                [1480 1544 1608 1736 1800 1864 1928 1992 2088 2152];[1864 1928 2024 2088 2216 2280 2344 2472 2536 2664];
                [2216 2280 2408 2472 2600 2728 2792 2984 2984 3112];[2536 2664 2792 2984 3112 3240 3368 3368 3496 3624];
                [2984 3112 3240 3368 3496 3624 3752 3880 4008 4264];[3368 3496 3624 3752 4008 4136 4264 4392 4584 4776];
                [3752 3880 4008 4264 4392 4584 4776 4968 5160 5352];[4264 4392 4584 4776 4968 5352 5544 5736 5992 5992];
                [4776 4968 5352 5544 5736 5992 6200 6456 6712 6712];[5352 5736 5992 6200 6456 6712 6968 7224 7480 7736];
                [5992 6200 6456 6968 7224 7480 7736 7992 8248 8504];[6456 6712 6968 7224 7736 7992 8248 8504 8760 9144];
                [6712 7224 7480 7736 7992 8504 8760 9144 9528 9912];[7480 7992 8248 8760 9144 9528 9912 10296 10296 10680];
                [8248 8760 9144 9528 9912 10296 10680 11064 11448 11832];[9144 9528 9912 10296 10680 11064 11448 12216 12576 12960];
                [9912 10296 10680 11064 11448 12216 12576 12960 13536 14112];[10680 11064 11448 12216 12576 12960 13536 14112 14688 15264];
                [11448 11832 12576 12960 13536 14112 14688 15264 15840 16416];[12216 12576 12960 13536 14112 14688 15264 15840 16416 16992];
                [12960 13536 14112 14688 15264 15840 16416 16992 17568 18336];[13536 14112 14688 15264 15840 16416 16992 17568 18336 19080];
                [15264 16416 16992 17568 18336 19080 19848 20616 21384 22152]];
            
 eNBTx_tbsize(:,:,4)=   [[840 872 904 936 968 1000 1032 1032 1064 1096];[1128 1160 1192 1224 1256 1288 1352 1384 1416 1416];[
                1384 1416 1480 1544 1544 1608 1672 1672 1736 1800];[1800 1864 1928 1992 2024 2088 2152 2216 2280 2344];
                [2216 2280 2344 2408 2472 2600 2664 2728 2792 2856];[2728 2792 2856 2984 3112 3112 3240 3368 3496 3496];
                [3240 3368 3496 3496 3624 3752 3880 4008 4136 4136];[3752 3880 4008 4136 4264 4392 4584 4584 4776 4968];
                [4392 4584 4584 4776 4968 4968 5160 5352 5544 5544];[4968 5160 5160 5352 5544 5736 5736 5992 6200 6200];
                [5544 5736 5736 5992 6200 6200 6456 6712 6712 6968];[6200 6456 6712 6968 6968 7224 7480 7736 7736 7992];
                [6968 7224 7480 7736 7992 8248 8504 8760 8760 9144];[7992 8248 8504 8760 9144 9144 9528 9912 9912 10296];
                [8760 9144 9528 9912 9912 10296 10680 11064 11064 11448];[9528 9912 10296 10296 10680 11064 11448 11832 11832 12216];
                [9912 10296 10680 11064 11448 11832 12216 12216 12576 12960];[11064 11448 11832 12216 12576 12960 13536 13536 14112 14688];
                [12216 12576 12960 13536 14112 14112 14688 15264 15264 15840];[13536 13536 14112 14688 15264 15264 15840 16416 16992 16992];
                [14688 14688 15264 15840 16416 16992 16992 17568 18336 18336];[15840 15840 16416 16992 17568 18336 18336 19080 19848 19848];
                [16992 16992 17568 18336 19080 19080 19848 20616 21384 21384];[17568 18336 19080 19848 19848 20616 21384 22152 22152 22920];
                [19080 19848 19848 20616 21384 22152 22920 22920 23688 24496];[19848 20616 20616 21384 22152 22920 23688 24496 24496 25456];
                [22920 23688 24496 25456 25456 26416 27376 28336 29296 29296]];
            
 eNBTx_tbsize(:,:,5)=   [[1128 1160 1192 1224 1256 1256 1288 1320 1352 1384];
                [1480 1544 1544 1608 1608 1672 1736 1736 1800 1800];[1800 1864 1928 1992 2024 2088 2088 2152 2216 2216];
                [2408 2472 2536 2536 2600 2664 2728 2792 2856 2856];[2984 2984 3112 3112 3240 3240 3368 3496 3496 3624];
                [3624 3752 3752 3880 4008 4008 4136 4264 4392 4392];[4264 4392 4584 4584 4776 4776 4968 4968 5160 5160];
                [4968 5160 5352 5352 5544 5736 5736 5992 5992 6200];[5736 5992 5992 6200 6200 6456 6456 6712 6968 6968];
                [6456 6712 6712 6968 6968 7224 7480 7480 7736 7992];[7224 7480 7480 7736 7992 7992 8248 8504 8504 8760];
                [8248 8504 8760 8760 9144 9144 9528 9528 9912 9912];[9528 9528 9912 9912 10296 10680 10680 11064 11064 11448];
                [10680 10680 11064 11448 11448 11832 12216 12216 12576 12960];[11832 12216 12216 12576 12960 12960 13536 13536 14112 14112];
                [12576 12960 12960 13536 13536 14112 14688 14688 15264 15264];[13536 13536 14112 14112 14688 14688 15264 15840 15840 16416];
                [14688 15264 15264 15840 16416 16416 16992 17568 17568 18336];[16416 16416 16992 17568 17568 18336 18336 19080 19080 19848];
                [17568 18336 18336 19080 19080 19848 20616 20616 21384 21384];[19080 19848 19848 20616 20616 21384 22152 22152 22920 22920];
                [20616 21384 21384 22152 22920 22920 23688 24496 24496 25456];[22152 22920 22920 23688 24496 24496 25456 25456 26416 27376];
                [23688 24496 24496 25456 25456 26416 27376 27376 28336 28336];[25456 25456 26416 26416 27376 28336 28336 29296 29296 30576];
                [26416 26416 27376 28336 28336 29296 29296 30576 31704 31704];[30576 30576 31704 32856 32856 34008 35160 35160 36696 36696]];
            
 eNBTx_tbsize(:,:,6)=   [[1416 1416 1480 1480 1544 1544 1608 1608 1608 1672];
                [1864 1864 1928 1992 1992 2024 2088 2088 2152 2152];[2280 2344 2344 2408 2472 2536 2536 2600 2664 2664];
                [2984 2984 3112 3112 3240 3240 3368 3368 3496 3496];[3624 3752 3752 3880 4008 4008 4136 4136 4264 4264];
                [4584 4584 4776 4776 4776 4968 4968 5160 5160 5352];[5352 5352 5544 5736 5736 5992 5992 5992 6200 6200];
                [6200 6456 6456 6712 6712 6712 6968 6968 7224 7224];[7224 7224 7480 7480 7736 7736 7992 7992 8248 8504];
                [7992 8248 8248 8504 8760 8760 9144 9144 9144 9528];[9144 9144 9144 9528 9528 9912 9912 10296 10296 10680];
                [10296 10680 10680 11064 11064 11448 11448 11832 11832 12216];[11832 11832 12216 12216 12576 12576 12960 12960 13536 13536];
                [12960 13536 13536 14112 14112 14688 14688 14688 15264 15264];[14688 14688 15264 15264 15840 15840 16416 16416 16992 16992];
                [15840 15840 16416 16416 16992 16992 17568 17568 18336 18336];[16416 16992 16992 17568 17568 18336 18336 19080 19080 19848];
                [18336 19080 19080 19848 19848 20616 20616 20616 21384 21384];[19848 20616 21384 21384 22152 22152 22920 22920 23688 23688];
                [22152 22152 22920 22920 23688 24496 24496 25456 25456 25456];[23688 24496 24496 25456 25456 26416 26416 27376 27376 28336];
                [25456 26416 26416 27376 27376 28336 28336 29296 29296 30576];[27376 28336 28336 29296 29296 30576 30576 31704 31704 32856];
                [29296 29296 30576 30576 31704 31704 32856 32856 34008 34008];[31704 31704 32856 32856 34008 34008 35160 35160 36696 36696];
                [32856 32856 34008 34008 35160 35160 36696 36696 37888 37888];[37888 37888 39232 40576 40576 40576 42368 42368 43816 43816]];
            
 eNBTx_tbsize(:,:,7)=   [[1672 1736 1736 1800 1800 1800 1864 1864 1928 1928];
                [2216 2280 2280 2344 2344 2408 2472 2472 2536 2536];[2728 2792 2856 2856 2856 2984 2984 3112 3112 3112];
                [3624 3624 3624 3752 3752 3880 3880 4008 4008 4136];[4392 4392 4584 4584 4584 4776 4776 4968 4968 4968];
                [5352 5544 5544 5736 5736 5736 5992 5992 5992 6200];[6456 6456 6456 6712 6712 6968 6968 6968 7224 7224];
                [7480 7480 7736 7736 7992 7992 8248 8248 8504 8504];[8504 8760 8760 9144 9144 9144 9528 9528 9528 9912];
                [9528 9912 9912 10296 10296 10296 10680 10680 11064 11064];[10680 11064 11064 11448 11448 11448 11832 11832 12216 12216];
                [12216 12576 12576 12960 12960 13536 13536 13536 14112 14112];[14112 14112 14112 14688 14688 15264 15264 15264 15840 15840];
                [15840 15840 16416 16416 16992 16992 16992 17568 17568 18336];[17568 17568 18336 18336 18336 19080 19080 19848 19848 19848];
                [18336 19080 19080 19848 19848 20616 20616 20616 21384 21384];[19848 19848 20616 20616 21384 21384 22152 22152 22152 22920];
                [22152 22152 22920 22920 23688 23688 24496 24496 24496 25456];[24496 24496 24496 25456 25456 26416 26416 27376 27376 27376];
                [26416 26416 27376 27376 28336 28336 29296 29296 29296 30576];[28336 29296 29296 29296 30576 30576 31704 31704 31704 32856];
                [30576 31704 31704 31704 32856 32856 34008 34008 35160 35160];[32856 34008 34008 34008 35160 35160 36696 36696 36696 37888];
                [35160 35160 36696 36696 37888 37888 37888 39232 39232 40576];[36696 37888 37888 39232 39232 40576 40576 42368 42368 42368];
                [39232 39232 40576 40576 40576 42368 42368 43816 43816 43816];[45352 45352 46888 46888 48936 48936 48936 51024 51024 52752]];
            
eNBTx_tbsize(:,:,8)=    [[1992 1992 2024 2088 2088 2088 2152 2152 2216 2216];
                [2600 2600 2664 2728 2728 2792 2792 2856 2856 2856];[3240 3240 3240 3368 3368 3368 3496 3496 3496 3624];
                [4136 4264 4264 4392 4392 4392 4584 4584 4584 4776];[5160 5160 5160 5352 5352 5544 5544 5544 5736 5736];
                [6200 6200 6456 6456 6712 6712 6712 6968 6968 6968];[7480 7480 7736 7736 7736 7992 7992 8248 8248 8248];
                [8760 8760 8760 9144 9144 9144 9528 9528 9528 9912];[9912 9912 10296 10296 10680 10680 10680 11064 11064 11064];
                [11064 11448 11448 11832 11832 11832 12216 12216 12576 12576];[12576 12576 12960 12960 12960 13536 13536 13536 14112 14112];
                [14112 14688 14688 14688 15264 15264 15840 15840 15840 16416];[16416 16416 16416 16992 16992 17568 17568 17568 18336 18336];
                [18336 18336 19080 19080 19080 19848 19848 19848 20616 20616];[20616 20616 20616 21384 21384 22152 22152 22152 22920 22920];
                [22152 22152 22152 22920 22920 23688 23688 23688 24496 24496];[22920 23688 23688 24496 24496 24496 25456 25456 25456 26416];
                [25456 26416 26416 26416 27376 27376 27376 28336 28336 29296];[28336 28336 29296 29296 29296 30576 30576 30576 31704 31704];
                [30576 30576 31704 31704 32856 32856 32856 34008 34008 34008];[32856 34008 34008 34008 35160 35160 35160 36696 36696 36696];
                [35160 36696 36696 36696 37888 37888 39232 39232 39232 40576];[37888 39232 39232 40576 40576 40576 42368 42368 42368 43816];
                [40576 40576 42368 42368 43816 43816 43816 45352 45352 45352];[43816 43816 45352 45352 45352 46888 46888 46888 48936 48936];
                [45352 45352 46888 46888 46888 48936 48936 48936 51024 51024];[52752 52752 55056 55056 55056 55056 57336 57336 57336 59256]];
            
 eNBTx_tbsize(:,:,9)=   [[2280 2280 2280 2344 2344 2408 2408 2472 2472 2536];
                [2984 2984 2984 3112 3112 3112 3240 3240 3240 3240];[3624 3624 3752 3752 3880 3880 3880 4008 4008 4008];
                [4776 4776 4776 4968 4968 4968 5160 5160 5160 5352];[5736 5992 5992 5992 5992 6200 6200 6200 6456 6456];
                [7224 7224 7224 7480 7480 7480 7736 7736 7736 7992];[8504 8504 8760 8760 8760 9144 9144 9144 9144 9528];
                [9912 9912 10296 10296 10296 10680 10680 10680 11064 11064];[11448 11448 11448 11832 11832 12216 12216 12216 12576 12576];
                [12960 12960 12960 13536 13536 13536 13536 14112 14112 14112];[14112 14688 14688 14688 14688 15264 15264 15264 15840 15840];
                [16416 16416 16992 16992 16992 17568 17568 17568 18336 18336];[18336 19080 19080 19080 19080 19848 19848 19848 20616 20616];
                [20616 21384 21384 21384 22152 22152 22152 22920 22920 22920];[22920 23688 23688 24496 24496 24496 25456 25456 25456 25456];
                [24496 25456 25456 25456 26416 26416 26416 27376 27376 27376];[26416 26416 27376 27376 27376 28336 28336 28336 29296 29296];
                [29296 29296 30576 30576 30576 30576 31704 31704 31704 32856];[31704 32856 32856 32856 34008 34008 34008 35160 35160 35160];
                [35160 35160 35160 36696 36696 36696 37888 37888 37888 39232];[37888 37888 39232 39232 39232 40576 40576 40576 42368 42368];
                [40576 40576 42368 42368 42368 43816 43816 43816 45352 45352];[43816 43816 45352 45352 45352 46888 46888 46888 48936 48936];
                [46888 46888 46888 48936 48936 48936 51024 51024 51024 51024];[48936 51024 51024 51024 52752 52752 52752 52752 55056 55056];
                [51024 52752 52752 52752 55056 55056 55056 55056 57336 57336];[59256 59256 61664 61664 61664 63776 63776 63776 66592 66592]];
            
eNBTx_tbsize(:,:,10)=   [[2536 2536 2600 2600 2664 2664 2728 2728 2728 2792];
                [3368 3368 3368 3496 3496 3496 3496 3624 3624 3624];[4136 4136 4136 4264 4264 4264 4392 4392 4392 4584];
                [5352 5352 5352 5544 5544 5544 5736 5736 5736 5736];[6456 6456 6712 6712 6712 6968 6968 6968 6968 7224];
                [7992 7992 8248 8248 8248 8504 8504 8760 8760 8760];[9528 9528 9528 9912 9912 9912 10296 10296 10296 10296];
                [11064 11448 11448 11448 11448 11832 11832 11832 12216 12216];[12576 12960 12960 12960 13536 13536 13536 13536 14112 14112];
                [14112 14688 14688 14688 15264 15264 15264 15264 15840 15840];[15840 16416 16416 16416 16992 16992 16992 16992 17568 17568];
                [18336 18336 19080 19080 19080 19080 19848 19848 19848 19848];[20616 21384 21384 21384 21384 22152 22152 22152 22920 22920];
                [23688 23688 23688 24496 24496 24496 25456 25456 25456 25456];[26416 26416 26416 27376 27376 27376 28336 28336 28336 28336];
                [28336 28336 28336 29296 29296 29296 29296 30576 30576 30576];[29296 30576 30576 30576 30576 31704 31704 31704 31704 32856];
                [32856 32856 34008 34008 34008 35160 35160 35160 35160 36696];[36696 36696 36696 37888 37888 37888 37888 39232 39232 39232];
                [39232 39232 40576 40576 40576 40576 42368 42368 42368 43816];[42368 42368 43816 43816 43816 45352 45352 45352 46888 46888];
                [45352 46888 46888 46888 46888 48936 48936 48936 48936 51024];[48936 48936 51024 51024 51024 51024 52752 52752 52752 55056];
                [52752 52752 52752 55056 55056 55056 55056 57336 57336 57336];[55056 57336 57336 57336 57336 59256 59256 59256 61664 61664];
                [57336 59256 59256 59256 61664 61664 61664 61664 63776 63776];[66592 68808 68808 68808 71112 71112 71112 73712 73712 75376]];
            
 eNBTx_tbsize(:,:,11)=  [[2792 2856 2856 2856 2984 2984 2984 2984 2984 3112];
                [3752 3752 3752 3752 3880 3880 3880 4008 4008 4008];[4584 4584 4584 4584 4776 4776 4776 4776 4968 4968];
                [5992 5992 5992 5992 6200 6200 6200 6200 6456 6456];[7224 7224 7480 7480 7480 7480 7736 7736 7736 7992];
                [8760 9144 9144 9144 9144 9528 9528 9528 9528 9528];[10680 10680 10680 10680 11064 11064 11064 11448 11448 11448];
                [12216 12576 12576 12576 12960 12960 12960 12960 13536 13536];[14112 14112 14688 14688 14688 14688 15264 15264 15264 15264];
                [15840 16416 16416 16416 16416 16992 16992 16992 16992 17568];[17568 18336 18336 18336 18336 18336 19080 19080 19080 19080];
                [20616 20616 20616 21384 21384 21384 21384 22152 22152 22152];[22920 23688 23688 23688 23688 24496 24496 24496 24496 25456];
                [26416 26416 26416 26416 27376 27376 27376 27376 28336 28336];[29296 29296 29296 29296 30576 30576 30576 30576 31704 31704];
                [30576 31704 31704 31704 31704 32856 32856 32856 34008 34008];[32856 32856 34008 34008 34008 34008 35160 35160 35160 35160];
                [36696 36696 36696 37888 37888 37888 39232 39232 39232 39232];[40576 40576 40576 40576 42368 42368 42368 42368 43816 43816];
                [43816 43816 43816 45352 45352 45352 46888 46888 46888 46888];[46888 46888 48936 48936 48936 48936 48936 51024 51024 51024];
                [51024 51024 51024 52752 52752 52752 52752 55056 55056 55056];[55056 55056 55056 57336 57336 57336 57336 59256 59256 59256];
                [57336 59256 59256 59256 59256 61664 61664 61664 61664 63776];[61664 61664 63776 63776 63776 63776 66592 66592 66592 66592];
                [63776 63776 66592 66592 66592 66592 68808 68808 68808 71112];[75376 75376 75376 75376 75376 75376 75376 75376 75376 75376]];
          
MO = [2 2 2 2 2 2 2 2 2 2 2 4 4 4 4 4 4 4 4 4 4 6 6 6 6 6 6 6 6 0 0 0];
ITBS = [0 1 2 3 4 5 6 7 8 9 10 10 11 12 13 14 15 15 16 17 18 19 20 21 22 23 24 25 26 0 0 0];
RV =  [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 3];
    
if(mod(Nprb,10)== 0);
	x=10;
else
	x=mod(Nprb,10);
end

TBS = eNBTx_tbsize(ITBS(MCS+1)+1,x,ceil(Nprb/10));
return;

end