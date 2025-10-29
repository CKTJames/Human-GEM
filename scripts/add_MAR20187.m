% load model as normal

rxnsToAdd.rxns = {'MAR20187'};
rxnsToAdd.mets = {'MAM02026m', 'MAM02039m', 'MAM02040m', 'MAM02630m', 'MAM02949m', 'MAM20086m'};
rxnsToAdd.stoichCoeffs = [1, 2, -1, -1, 1, -1];
rxnsToAdd.rxnNames = {'Persulfide dioxygenase'};
rxnsToAdd.lb = 0;
rxnsToAdd.ub = 1000;
rxnsToAdd.subSystems = {'Sulfur metabolism'};
rxnsToAdd.eccodes = {'1.13.11.18'};
rxnsToAdd.grRules = {'ENSG00000105755'}
rxnsToAdd.rxnReferences = {'PMID:25225291'};
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

reactions.rxns{idx} = 'MAR20187';
reactions.rxnKEGGID{idx} = 'R08678';
reactions.rxnBiGGID{idx} = '';
reactions.rxnEHMNID{idx} = '';
reactions.rxnHepatoNET1ID{idx} = '';
reactions.rxnREACTOMEID{idx} = '';
reactions.rxnRecon3DID{idx} = '';
reactions.rxnMetaNetXID{idx} = 'MNXR112193';
reactions.rxnHMR2ID{idx} = '';
reactions.rxnRatconID{idx} = '';
reactions.rxnTCDBID{idx} = '';
reactions.spontaneous(idx) = 0;
reactions.rxnRheaID{idx} = 'RHEA:12982';
reactions.rxnRheaMasterID{idx} = 'RHEA:12981';
reactions.rxnRetired{idx} = '';

exportTsvFile(reactions, 'reactions_mod.tsv')

