% load model as normal

rxnsToAdd.rxns = {'MAR20186'};
rxnsToAdd.mets = {'MAM01802m', 'MAM01803m', 'MAM02026m', 'MAM02042m', 'MAM20086m'};
rxnsToAdd.stoichCoeffs = [-1, 1, -1, -1, 1];
rxnsToAdd.rxnNames = {'Sulfide:glutathione,quinone oxidoreductase'};
rxnsToAdd.lb = 0;
rxnsToAdd.ub = 1000;
rxnsToAdd.subSystems = {'Sulfur metabolism'};
rxnsToAdd.eccodes = {'1.8.5.8'};
rxnsToAdd.grRules = {'ENSG00000137767'}
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

reactions.rxns{idx} = 'MAR20186';
reactions.rxnKEGGID{idx} = 'R11929';
reactions.rxnBiGGID{idx} = '';
reactions.rxnEHMNID{idx} = '';
reactions.rxnHepatoNET1ID{idx} = '';
reactions.rxnREACTOMEID{idx} = '';
reactions.rxnRecon3DID{idx} = '';
reactions.rxnMetaNetXID{idx} = 'MNXR171837';
reactions.rxnHMR2ID{idx} = '';
reactions.rxnRatconID{idx} = '';
reactions.rxnTCDBID{idx} = '';
reactions.spontaneous(idx) = 0;
reactions.rxnRheaID{idx} = 'RHEA:62609';
reactions.rxnRheaMasterID{idx} = 'RHEA:62608';
reactions.rxnRetired{idx} = '';

exportTsvFile(reactions, 'reactions_mod.tsv')

