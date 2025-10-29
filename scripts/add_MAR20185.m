% load model as normal

rxnsToAdd.rxns = {'MAR20185'};
rxnsToAdd.mets = {'MAM01307m', 'MAM01628m', 'MAM01821m', 'MAM02039m', 'MAM02554m', 'MAM02555m', 'MAM20085m'};
rxnsToAdd.stoichCoeffs = [2, -2, -2, 1, 1, -1, 1];
rxnsToAdd.rxnNames = {'De novo synthesis of 2Fe2S'};
rxnsToAdd.lb = 0;
rxnsToAdd.ub = 1000;
rxnsToAdd.subSystems = {'Sulfur metabolism'};
rxnsToAdd.grRules = {'ENSG00000004779 and ENSG00000136003 and ENSG00000161513 and ENSG00000165060 and ENSG00000214113 and ENSG00000244005 and ENSG00000267673'}
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

reactions.rxns{idx} = 'MAR20185';
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

