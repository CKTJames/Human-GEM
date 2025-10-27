#move MAR06402 from m to c and remove apoA1 from reactants

cd ../RAVEN/installation
checkInstallation()

cd ../../Human-GEM/model
load('Human-GEM_mod.mat')

#use changeRxns function

rxns = {'MAR06402'}

equations.mets = {'MAM02643m', 'MAM00210m', 'MAM02484m'}
equations.stoichCoeffs = [-1, 1, 1]

ihuman = changeRxns(ihuman, rxns, equations, 1)

rxnIdx = strcmp(ihuman.rxns, rxns);
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx)

% change reference
 ihuman.rxnReferences(rxnIdx) = {'PMID:24777537;PMID:28757203'}

% change GR rules

ihuman = changeGrRules(ihuman,rxns,'ENSG00000004779 and ENSG00000140905 and ENSG00000175536');
ihuman.grRules(rxnIdx)

save('ihuman', 'Human-GEM_mod.mat'
exportModel(ihuman, 'Human-GEM_mod.xml'

