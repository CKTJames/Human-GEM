% load model as usual

rxns = 'MAR06404';
equations.mets = {'MAM00208m', 'MAM00209m', 'MAM02039m', 'MAM02552m', 'MAM02553m'};
equations.stoichCoeffs = [1, -1, -1, 1, -1]

ihuman = changeRxns(ihuman, rxns, equations, 1)

rxnIdx = strcmp(ihuman.rxns, rxns);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx)
ihuman.metComps(metsIdx)

exportModel(ihuman, 'Human-GEM_mod.xml')
save('Human-GEM_mod.mat', 'ihuman')
