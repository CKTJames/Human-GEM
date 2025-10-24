% load modified model as normal

metOrigIdx = strcmp(ihuman.mets, 'MAM00210c');
ihuman.mets(metOrigIdx) %just check that this is indeed the correct index

ihuman.metNames(metOrigIdx) % double check

ihuman.mets(metOrigIdx) = {'MAM00210m'}
ihuman.mets(metOrigIdx) % check

% change compartment
ihuman.metComps(metOrigIdx) = 3

% check reactions
rxn = 'MAR06403';
rxnIdx = strcmp(ihuman.rxns, rxn);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx, :)

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00210c'), :), 1));
ihuman.rxns(rxnIdx) % should be empty

rxnIdx = find(any(ihuman.S(ismember(ihuman.mets, 'MAM00210m'), :), 1));
ihuman.rxns(rxnIdx)

% change metabolite.tsv

metabolites = importTsvFile('metabolites_mod.tsv')
idx = strcmp(metabolites.mets, 'MAM00210c');
metabolites.mets(idx)
metabolites.mets(idx) = {'MAM00210m'}
exportTsvFile(metabolites, 'metabolites_mod.tsv')
