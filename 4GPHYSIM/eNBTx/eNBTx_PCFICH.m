function [resourceGrid] = eNBTx_PCFICH(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_PCFICH
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   This file contain the functions to map control format indication
%						to the TTI
%  INPUT            :   eNB, resourceGrid                
%  OUTPUT           :   PCFICH Updated Grid
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
cfiBits 						= lteCFI(eNB);
pcfichSymbols 					= ltePCFICH(eNB, cfiBits);
pcfichIndices 					= ltePCFICHIndices(eNB);
resourceGrid(pcfichIndices) 	= pcfichSymbols;
