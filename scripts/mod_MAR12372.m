cd RAVEN/installation
checkInstallation()

cd ../../Human-GEM_mod/model
load('Human-GEM.mat')

rxnID = 'MAR12372';
rxnIdx = strcmp(ihuman.rxns, rxnID);

metsIdx = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.metNames(metsIdx, :)


FAD = 'MAM01802x';
FADH = 'MAM01803x';

FADIdx = ihuman.mets(FAD);
FADHIdx = ihuman.mets(FADH);

ihuman.S(FADIdx, rxnIdx)
ihuman.S(FADHIdx, rxnIdx)

ihuman.S(FADIdx, rxnIdx) = 0;
ihuman.S(FADHIdx, rxnIdx) = 0;

metsIdx2 = find(any(ihuman.S(:, rxnIdx) ~= 0, 2));
ihuman.metNames(metsIdx2, :)

save(ihuman, 'Human-GEM_mod.mat')


