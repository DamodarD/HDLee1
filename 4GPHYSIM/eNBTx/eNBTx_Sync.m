function [resourceGrid] = eNBTx_Sync(eNB, resourceGrid)
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_Sync
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   In LTE, there are two downlink synchronization signals which are used by the UE to obtain the cell identity and frame timing.
%  						Primary synchronization signal (PSS)
%						Secondary synchronization signal (SSS)
%  INPUT            :   eNb, resourceGrid                   
%  OUTPUT           :   Updated resourceGrid
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
%PSS Generation
pss 						= ltePSS(eNB);
antenna 					= 0;
pssIndices 					= ltePSSIndices(eNB, antenna);
sss 						= lteSSS(eNB);
antenna 					= 0;

%SSS Generation
sssIndices 					= lteSSSIndices(eNB, antenna);
subframe 					= lteDLResourceGrid(eNB);
resourceGrid(pssIndices) 	= pss;
resourceGrid(sssIndices) 	= sss;
%mesh(abs(resourceGrid))
%view(2)