function [resourceGrid] = eNBTx_CellRefSignal(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_CellRefSignal
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   In the function LTE_mapCellRefSignal(), the symbol-level
%						and the slot-level mapping is implemented. If the number of
%						symbols is given as -1, then all the symbols in a slot will
%						mapped in only one function call. Else, if specific symbol
%						number is passed, mapping is done at symbol level and this
%						function has to be called for every symbol.
%  INPUT            :   eNB                     
%  OUTPUT           :   resourceGrid
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
RS_Symb 				= lteCellRS(eNB);  %lteCellRS(eNB,Ports(0,1,2,3));
RS_Ind 					= lteCellRSIndices(eNB); %lteCellRSIndices(ENB,PORTS(0,1,2,3),OPTS)
resourceGrid(RS_Ind) 	= RS_Symb;
size(resourceGrid)