cd ../RAVEN/installation
checkInstallation()

cd ../../Human-GEM/model
load('Human-GEM_mod.mat')

rxns = {'MAR06403'};
equations.mets = {'MAM00208m', 'MAM00210m', 'MAM01098m', 'MAM01821m', 'MAM02039m', 'MAM02042m', 'MAM02471m', 'MAM02554m', 'MAM02555m', 'MAM02877m', 'MAM20084m'};
equations.stoichCoeffs = [1, -1, 2, 4, -3, 2, 2, 1, -1, -2, -1]

ihuman = changeRxns(ihuman, rxns, equations, 1)

rxnIdx = strcmp(ihuman.rxns, rxns)
metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.mets(metsIdx)

% change GR rules

grRules = '(ENSG00000121897 and ENSG00000137714 and ENSG00000140905 and ENSG00000161513 and ENSG00000135070) or (ENSG00000121897 and ENSG00000137714 and ENSG00000140905 and ENSG00000161513 and ENSG00000165898) or (ENSG00000121897 and ENSG00000137714 and ENSG00000140905 and ENSG00000161513 and ENSG00000169599)'

ihuman = changeGRRules(ihuman, rxns, grRules)

% change references

rxnIdx = strcmp(ihuman.rxns, "MAR06403");
ihuman.rxnReferences(rxnIdx)

ihuman.rxnReferences(rxnIdx) = {'PMID:24777537;PMID:31493409;PMID:36281303;PMID:37453661'}

ihuman.rxnReferences(rxnIdx)

% save

exportModel(ihuman, 'Human-GEM_mod.xml')
save('Human-GEM_mod.mat', 'ihuman')



