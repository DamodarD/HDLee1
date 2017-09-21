function [resourceGrid] = eNBTx_PHICH(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_PHICH
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   This file contain the functions to map Physical Hybrid ARQ
%						Indicator Channel on to the OFDM radio frame
%  INPUT            :   eNB and resourceGrid                     
%  OUTPUT           :   PHICH resourceGrid
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
hiset 					= [0,0,0]; %0 - NACK, 1 = ACK
[PHICH_sym,PHICH_info] 	= ltePHICH(eNB,hiset);
PHICH_Ind 				= ltePHICHIndices(eNB);
resourceGrid(PHICH_Ind) = PHICH_sym;