function [] = eNBTx_Config()
%% *************************************************************************************************
%  FUNCTION NAME	:   eNBTx_Config
%  DATE CREATED     :   
%  DESCRIPTION      :   
%  INPUT            :                       
%  OUTPUT           :   - 
%  CODE VERSION     :   0.1
%* *************************************************************************************************
%% Initialize Global Parameters

%Radio Link Parameters Configuration [Ideally below inputs can be given from GUI to be user friendly]
eNBTx_Config.RadioLink.BW 			= '1.4MHz', '3MHz', '5MHz', '10MHz', '20MHz' ; 
eNBTx_Config.RadioLink.CellID 		=  10; [0-511]
eNBTx_Config.RadioLink.DuplexType 	=  'TDD', 'FDD'; 
eNBTx_Config.RadioLink.UL-DLConfig  =  0; [0-7]
eNBTx_Config.RadioLink.SplSubFrmCfg =  5; 
eNBTx_Config.RadioLink.cpType		=  'Normal', 'extended';
eNBTx_Config.RadioLink.noOfFrames	=  10;

%PCFICH Configuration
eNBTx_Config.PCFICHCfg.pcfichPower	=  
eNBTx_Config.PCFICHCfg.CFI 			= 
eNBTx_Config.PCFICHCfg.CFI_TDD		= 

%PHICH Configuration
eNBTx_Config.PHICHCfg.PHICHPowerOff	=
eNBTx_Config.PHICHCfg.PHICHDuration	=
eNBTx_Config.PHICHCfg.Ng			=

%NUM Antenna Configurations
eNBTx_Config.ANT.numAnt				= 

%Impairment Configurations 
eNBTx_Config.Imp.FreqOffset 		= 
eNBTx_Config.Imp.TimingOffset		= 
eNBTx_Config.Imp.SNR 				= 
eNBTx_Config.Imp.ChannelModel 		= 
eNBTx_Config.Imp.TxCrossCorr 		= 
eNBTx_Config.Imp.RxCrossCorr 		= 


