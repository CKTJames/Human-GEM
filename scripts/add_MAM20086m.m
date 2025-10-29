% load model as usual

metsToAdd.mets = {'MAM20086m'};
metsToAdd.metNames = {'GSSH'};
metsToAdd.compartments = {'m'};
metsToAdd.metFormulas = {'C10H17N3O6S2'};
metsToAdd.metCharges = 0;
metsToAdd.inchis = 'InChI=1S/C10H17N3O6S2/c11-5(10(18)19)1-2-7(14)13-6(4-21-20)9(17)12-3-8(15)16/h5-6,20H,1-4,11H2,(H,12,17)(H,13,14)(H,15,16)(H,18,19)/t5-,6-/m0/s1'

ihuman1 = addMets(ihuman, metsToAdd)

save('Human-GEM_mod.mat', 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')


metabolites = importTsvFile('metabolites_mod.tsv')

idx = numel(metabolites.mets) + 1;

metabolites.mets{idx} = 'MAM20086m';
metabolites.metsNoComp{idx} = 'MAM20086';
metabolites.metBiGGID{idx} = '';
metabolites.metKEGGID{idx} = 'C17267';
metabolites.metHMDBID(idx) = "";
metabolites.metChEBIID{idx} = 'CHEBI:52857';
metabolites.metPubChemID(idx) = "44176418";
metabolites.metLipidMapsID(idx) = "";
metabolites.metEHMNID(idx) = "";
metabolites.metHepatoNET1ID(idx) = "";
metabolites.metRecon3DID{idx} = '';
metabolites.metMetaNetXID{idx} = 'MNXM2032';
metabolites.metHMR2ID{idx} = '';
metabolites.metRetired{idx} = '';
