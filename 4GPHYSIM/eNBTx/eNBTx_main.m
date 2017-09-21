function [] = eNBTx_Main()
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_Main
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   Main entry point for LTE eNode B Transmitter
%  INPUT            :   Configuration parameters                   
%  OUTPUT           :   Tx WaveForm 
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
	%% Initialize Global Parameters
	%close all;
	% Read System configuration 
	% Based on BW configuration choose
	%FFT 
	%DLRBs
	%Sampling Frequency
	eNBTx_Config.RadioLink.BW = '1.4MHZ';
	eNBTx_Config.RadioLink.noOfFrames = 1;
	numDLRb = getNumDLRb(eNBTx_Config.RadioLink.BW);
	MaxRB = numDLRb;
	%%  eNB structure initialization
	enb.CyclicPrefix 	= 'Normal';
	enb.CellRefP 		= 1;
	enb.DuplexMode 		= 'FDD';
	enb.CFI        		= 2;       
	enb.Ng              = 'One'; 
	enb.PHICHDuration   = 'Normal';
	enb.NDLRB 			= MaxRB;
	enb.NULRB 			= MaxRB;
	eNBTx_Config.RadioLink.CellID 		=  10;
	enb.NCellID = eNBTx_Config.RadioLink.CellID;
	%  eNB structure initialization <END>
	if(MaxRB==100)
		nPRB=100;RBstart=0;mcs=6;
	elseif(MaxRB==75)
		nPRB=75;RBstart=0;mcs=6;
	elseif(MaxRB==50)
		nPRB=50;RBstart=0;mcs=6;
	elseif(MaxRB==25)
		nPRB=25;RBstart=0;mcs=6;
	elseif(MaxRB==15)
		nPRB=15;RBstart=0;mcs=6;
	elseif(MaxRB==6)
		nPRB=6;RBstart=0;mcs=6;
	end 
	if((nPRB-1) <= floor(MaxRB/2))
		RIV = MaxRB*(nPRB-1)+RBstart;
	else
		RIV = MaxRB*(MaxRB-nPRB+1)+(MaxRB -1-RBstart);
	end 
	%% DCI Structure Global Initialization
	global DCI_str;
	DCI_str 				= struct;
	DCI_str.DCIFormat 		= 'Format1A';
	DCI_str.AllocationType	= 2;
	DCI_str.NDLRB 			= enb.NDLRB;
	DCI_str.ModCoding 		= mcs;
	DCI_str.Allocation.RIV 	= RIV;
	DCI_str.TBS 			= eNBTx_tbsize(DCI_str.ModCoding,enb.NDLRB);
	DCI_str.HARQNo 			= 0;
	DCI_str.NewData 		= 0;
	DCI_str.RV 				= 0;
	DCI_str.TPCPUCCH 		= 0;
	DCI_str.TDDIndex 		= 0; 
	for frameIdx = 1: eNBTx_Config.RadioLink.noOfFrames %Frame Index Logic to be Implemented
		for subframeIdx =0:9
			enb.NSubframe = subframeIdx;
			resourceGrid = lteDLResourceGrid(enb);
			%CELL RS 
			resourceGrid = eNBTx_CellRefSignal(enb, resourceGrid);	
			%ltePSS, lteSSS 
			if (subframeIdx == 0) || (subframeIdx == 5)
				resourceGrid = eNBTx_Sync(enb, resourceGrid);		
			end
			if (subframeIdx == 0)
				% ltePBCH
				resourceGrid = eNBTx_PBCH(enb, resourceGrid);
			end
			% ltePCFICH
			resourceGrid = eNBTx_PCFICH(enb, resourceGrid);
			% ltePHICH
			resourceGrid = eNBTx_PHICH(enb, resourceGrid);
			if (subframeIdx == 5 || subframeIdx == 9)
				% ltePDCCH
				resourceGrid = eNBTx_PDCCH(enb, resourceGrid);
				% ltePDSCH
				resourceGrid = eNBTx_PDSCH(enb, resourceGrid, RBstart);	
			end
			[IQ,info] = lteOFDMModulate(enb,resourceGrid);
			Frame_IQ(:,subframeIdx+1) = IQ(:,1);
		end
	end
    save Subframe.mat Frame_IQ;
    save enbcfg.mat enb;
end

function ndlrb = getNumDLRb(bw)
    switch((bw))
        case '1.4MHZ'
            ndlrb = 6;
        case '3MHZ'
            ndlrb = 15;
        case '5MHZ'
            ndlrb = 25;
        case '10MHZ'
            ndlrb = 50;
        case '15MHZ'
            ndlrb = 75;
        case '20MHZ'
            ndlrb = 100;           
        otherwise
            error('lte:error','The function call resulted in an error: The input parameter field BW should be one of {1.4MHz, 3MHz, 5MHz, 10MHz, 15MHz, 20MHz} of type string');
    end
end 