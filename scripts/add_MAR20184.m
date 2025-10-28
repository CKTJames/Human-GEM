% load model as normal

rxnsToAdd.rxns = {'MAR20184'};
rxnsToAdd.mets = {'MAM01285m', 'MAM01371m', 'MAM02039m', 'MAM02040m', 'MAM02554m', 'MAM02555m', 'MAM02751m', 'MAM20084m', 'MAM20085m'};
rxnsToAdd.stoichCoeffs = [2, -2, 3, -2, 1, -1, 2, 1, -2];
rxnsToAdd.rxnNames = {'Synthesis of 4Fe4S from 2Fe2S'};
rxnsToAdd.lb = 0;
rxnsToAdd.ub = 1000;
rxnsToAdd.subSystems = {'Sulfur metabolism'};
rxnsToAdd.grRules = {'ENSG00000100209 and ENSG00000109519 and ENSG00000113013 and ENSG00000135070 and ENSG00000161513 and ENSG00000165898 and ENSG00000181873 and ENSG00000182512 and ENSG00000267673'}
rxnsToAdd.rxnReferences = {'PMID:31918395;PMID:31935115'};
rxnsToAdd.rxnConfidenceScores = 0;

ihuman = addRxns(ihuman, rxnsToAdd, 1)

% check

rxnIdx = strcmp(ihuman.rxns, rxns)
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx)

exportModel(ihuman, 'Human-GEM_mod.xml')
save('Human-GEM_mod.mat', 'ihuman')

reactions = readTsvFile('reactions.tsv')

idx = numel(reactions.rxns) +1;

reactions.rxns{idx} = 'MAR20184';
reactions.rxnKEGGID{idx} = '';
reactions.rxnBiGGID{idx} = '';
reactions.rxnEHMNID{idx} = '';
reactions.rxnHepatoNET1ID{idx} = '';
reactions.rxnREACTOMEID{idx} = '';
reactions.rxnRecon3DID{idx} = '';
reactions.rxnMetaNetXID{idx} = '';
reactions.rxnHMR2ID{idx} = '';
reactions.rxnRatconID{idx} = '';
reactions.rxnTCDBID{idx} = '';
reactions.spontaneous(idx) = 0;
reactions.rxnRheaID{idx} = '';
reactions.rxnRheaMasterID{idx} = '';
reactions.rxnRetired{idx} = '';

exportTsvFile(reactions, 'reactions_mod.tsv')

