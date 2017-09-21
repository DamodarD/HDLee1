function [resourceGrid] = eNBTx_PDCCH(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_PDCCH
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   This file contains the function to map the generated PDCCH
%						symbols onto the global frame buffer.
%  INPUT            :                       
%  OUTPUT           :   - 
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
global DCI_str;
pdcch 					= struct;
pdcch.RNTI 				= 1;
pdcch.PDCCHFormat 		= 1;
[dciMsg,dciMsgBits] 	= lteDCI(eNB,DCI_str);
codedDCIBits 			= lteDCIEncode(pdcch,dciMsgBits);
XX 						= bi2de(codedDCIBits');
yy 						= dec2hex(XX);
pdcchInfo 				= ltePDCCHInfo(eNB);
pdcchbits 				= -1*ones(pdcchInfo.MTot,1);
candidates 				= ltePDCCHSpace(eNB,pdcch);
pdcchbits(candidates(1,1):candidates(1,2)) = codedDCIBits;
[PDCCH_sym,PDCCH_info] 	= ltePDCCH(eNB,pdcchbits);
PDCCH_Ind 				= ltePDCCHIndices(eNB);
resourceGrid(PDCCH_Ind) = PDCCH_sym;
