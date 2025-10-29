% load model as normal

rxnsToAdd.rxns = {'MAR20188'};
rxnsToAdd.mets = {'MAM01098c', 'MAM01098m'};
rxnsToAdd.stoichCoeffs = [1, -1];
rxnsToAdd.rxnNames = {'Export of 5'-deoxyadenosine from mitochondria'};
rxnsToAdd.lb = -1000;
rxnsToAdd.ub = 1000;
rxnsToAdd.subSystems = {'Transport reactions'};
rxnsToAdd.rxnReferences = {'PMID:34126623'};
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

reactions.rxns{idx} = 'MAR20188';
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

