function [subframe] = UERx_main()
%% *************************************************************************************************
%  FUNCTION NAME	:   UERx_main
%  DATE CREATED     :   
%  DESCRIPTION      :   
%  INPUT            :                       
%  OUTPUT           :   - 
%  CODE VERSION     :   0.1
%* *************************************************************************************************
%% Initialize Global Parameters
load ..\Subframe.mat;
load ..\enbcfg.mat;
enb = [];
enb.NDLRB = 6;
enb.CellRefP = 1;
enb.NSubframe = 0;
[cellid,offset,peak] = lteCellSearch(enb,Frame_IQ);
enb.NCellID = cellid;
fprintf('\nPerforming frequency offset estimation...\n');
separator = repmat('-',1,50);
cec.PilotAverage = 'UserDefined';     % Type of pilot averaging
cec.FreqWindow = 9;                   % Frequency window size    
cec.TimeWindow = 9;                   % Time window size    
cec.InterpType = 'cubic';             % 2D interpolation type
cec.InterpWindow = 'Centered';        % Interpolation window type
cec.InterpWinSize = 3;                % Interpolation window size  
fprintf('Performing OFDM demodulation...\n\n');
griddims = lteResourceGridSize(enb); % Resource grid dimensions
L = griddims(2);                     % Number of OFDM symbols in a subframe 
rxgrid = lteOFDMDemodulate(enb, Frame_IQ);    
[hest, nest] = lteDLChannelEstimate(enb, cec, rxgrid(:,1:L,:));
fprintf('Performing MIB decoding...\n');
pbchIndices = ltePBCHIndices(enb);
[pbchRx, pbchHest] = lteExtractResources( ...
    pbchIndices, rxgrid(:,1:L,enb.NSubframe+1), hest(:,1:L,:,enb.NSubframe+1));

[bchBits, pbchSymbols, nfmod4, mib, enb.CellRefP] = ltePBCHDecode( ...
    enb, pbchRx, pbchHest, nest); 
enb = lteMIB(mib, enb); 
fprintf('Cell-wide settings after MIB decoding:\n');
disp(enb);

if (enb.CellRefP==0)
    fprintf('MIB decoding failed (enb.CellRefP=0).\n\n');
    return;
end
if (enb.NDLRB==0)
    fprintf('MIB decoding failed (enb.NDLRB=0).\n\n');
    return;
end

for SFIdx = 0:9
    fprintf('************* Subframe %d **********\n',SFIdx);
    fprintf('%s\n',separator);
    fprintf('SIB1 decoding for frame %d\n',mod(enb.NFrame,1024));
    fprintf('%s\n\n',separator);
    CurrSF = SFIdx + 1;
    rxsubframe = rxgrid(:,1:L,CurrSF);
    enb.NSubframe = SFIdx;
    [hest,nest] = lteDLChannelEstimate(enb, cec, rxsubframe);   
    fprintf('Decoding CFI...\n\n');
    pcfichIndices = ltePCFICHIndices(enb);  % Get PCFICH indices
    [pcfichRx, pcfichHest] = lteExtractResources(pcfichIndices, rxsubframe, hest);
    cfiBits = ltePCFICHDecode(enb, pcfichRx, pcfichHest, nest);
    cfi = lteCFIDecode(cfiBits); % Get CFI
    enb.CFI = cfi;
    fprintf('Decoded CFI value: %d\n\n', enb.CFI);   
    alldci = {};
    if(SFIdx==5 || SFIdx==9)
        pdcchIndices = ltePDCCHIndices(enb); % Get PDCCH indices
        [pdcchRx, pdcchHest] = lteExtractResources(pdcchIndices, rxsubframe, hest);
        [dciBits, pdcchSymbols] = ltePDCCHDecode(enb, pdcchRx, pdcchHest, nest);
        fprintf('PDCCH search for SI-RNTI...\n\n');
        pdcch = struct('RNTI', 1);  
        pdcch.PDCCHFormat = 1;
        alldci = ltePDCCHSearch(enb, pdcch, dciBits); % Search PDCCH for DCI 
        disp(alldci);
    end
    for i = 1:numel(alldci)
        dci = alldci{i};
        fprintf('DCI message with SI-RNTI:\n');
        disp(dci);
        [pdsch, trblklen] = hPDSCHConfiguration(enb, dci, pdcch.RNTI);
        if ~isempty(pdsch)
            pdsch.NTurboDecIts = 5;
            fprintf('PDSCH settings after DCI decoding:\n');
            disp(pdsch);
            fprintf('Decoding SIB1...\n\n');
            [pdschIndices,pdschIndicesInfo] = ltePDSCHIndices(enb, pdsch, pdsch.PRBSet);
            [pdschRx, pdschHest] = lteExtractResources(pdschIndices, rxsubframe, hest);
            [dlschBits,pdschSymbols] = ltePDSCHDecode(enb, pdsch, pdschRx, pdschHest, nest);
            decState = [];
            [sib1, crc, decState] = lteDLSCHDecode(enb, pdsch, trblklen, dlschBits, decState);
            fprintf('SIB1 CRC: %d\n',crc);
            if crc == 0
                fprintf('Successful SIB1 recovery.\n\n');
            else
                fprintf('SIB1 decoding failed.\n\n');
            end
        else
            fprintf('Creating PDSCH configuration from DCI message failed.\n\n');
        end
    end
end
