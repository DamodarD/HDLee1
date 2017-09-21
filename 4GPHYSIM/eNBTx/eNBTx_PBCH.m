function [resourceGrid] = eNBTx_PBCH(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_PBCH
%  DATE CREATED		:   3/7/2017
%  DESCRIPTION      :   PBCH is a special channel to carry MIB and has following characteristics :
%  						It carries only the MIB.
%  						It is using QPSK.
%  						Mapped to 6 Resource Blocks (72 subcarriers), centered around DC subcarrier in sub frame 0.
%  						Mapped to Resource Elements which is not reserved for transmission of reference signals, PDCCH or PHICH
%  INPUT            :   eNodeB, resourceGrid                    
%  OUTPUT           :   Updated Resource grid
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
mib 			= lteMIB(eNB);
PbchBRP 		= lteBCH(eNB,mib);
DLPBCH 			= ltePBCH(eNB,PbchBRP);
quarterLen 		= length(DLPBCH)/4;
PBCH_Ind 		= ltePBCHIndices(eNB);
for i = 1:eNB.CellRefP
	resourceGrid(PBCH_Ind(:,i)) = DLPBCH(1:quarterLen,i);
	%resourceGrid(PBCH_Ind(:,i)) = DLPBCH((mod(sfn,4)*quarterLen)+1:quarterLen*(mod(sfn,4)+1),i);
end