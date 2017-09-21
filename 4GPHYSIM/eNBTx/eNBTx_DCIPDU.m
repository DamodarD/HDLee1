function [] = eNBTx_DCIPDU()
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_DCIPDU
%  DATE CREATED     :   3/7/2017
%  DESCRIPTION      :   Downlink control information encoding
%  INPUT            :   returns the vector resulting from downlink control information (DCI) processing of the input bit vector, 
%						dcibits, given the field settings in the structure, ue.
%						As described in TS 36.212 [1], Section 5.3.3, DCI processing involves CRC attachment with ue.
%						RNTI masking of the CRC, convolutional coding, and rate matching to the capacity of the PDCCH format.                   
%  OUTPUT           :   - 
%  CODE VERSION     :   0.1
%  Team				:   DD/VB
%* *************************************************************************************************
%% Initialize Global Parameters
codedDciBits = lteDCIEncode(pdcch, dciMessageBits);