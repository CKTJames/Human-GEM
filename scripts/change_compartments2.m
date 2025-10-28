% load modified model as normal

metOrigIdx = strcmp(ihuman.mets, 'MAM00208c');
ihuman.mets(metOrigIdx) %just check that this is indeed the correct index

ihuman.metNames(metOrigIdx) % double check

ihuman.mets(metOrigIdx) = {'MAM00208m'}
ihuman.mets(metOrigIdx) % check

% change compartment
ihuman.metComps(metOrigIdx) = 3

% check reactions
rxn = 'MAR08434';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxn = 'MAR06404';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00208c'), :), 1));
ihuman.rxns(rxnIdx) % should be empty

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00208m'), :), 1));
ihuman.rxns(rxnIdx)

% change MAM00209c to m

metOrigIdx = strcmp(ihuman.mets, 'MAM00209c');
ihuman.mets(metOrigIdx)
ihuman.metNames(metOrigIdx)

ihuman.mets(metOrigIdx) = {'MAM00209m'}
ihuman.mets(metOrigIdx)

ihuman.metComps(metOrigIdx) = 3

% check reactions

rxn = 'MAR06404';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxn = 'MAR08433';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxn = 'MAR00022';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxn = 'MAR20168';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00209c'), :), 1));
ihuman.rxns(rxnIdx) % should be empty

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00209m'), :), 1));
ihuman.rxns(rxnIdx)

% change metabolite.tsv

metabolites = importTsvFile('metabolites_mod.tsv')
idx = strcmp(metabolites.mets, 'MAM00208c');
metabolites.mets(idx)
metabolites.mets(idx) = {'MAM00208m'}

idx = strcmp(metabolites.mets, 'MAM00209c');
metabolites.mets(idx)
metabolites.mets(idx) = {'MAM00209m'}

exportTsvFile(metabolites, 'metabolites_mod.tsv')
