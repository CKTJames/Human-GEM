metsToAdd.mets = "MAM20084m"
metsToAdd.metNames = "4Fe4S iron-sulfur cluster"
metsToAdd.compartments = "m"
metsToAdd.metFormulas = "S4Fe4"
metsToAdd.metCharges = 2
metsToAdd.inchis = "InChI=1S/4Fe.4S/q;;2*+1;;;;"

ihuman1 = addMets(ihuman, metsToAdd)

save('Human-GEM_mod.mat', 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')

metabolites = importTsvFile('metabolites_mod.tsv')

idx = numel(metabolites.mets) + 1;

metabolites.mets{idx} = 'MAM20084m';
metabolites.metsNoComp{idx} = 'MAM20084';
metabolites.metBiGGID{idx} = '4fe4s';
metabolites.metKEGGID{idx} = "";
metabolites.metHMDBID(idx) = "";
metabolites.metChEBIID{idx} = 'CHEBI:33722';
metabolites.metPubChemID(idx) = "6398953";
metabolites.metLipidMapsID(idx) = "";
metabolites.metEHMNID(idx) = "";
metabolites.metHepatoNET1ID(idx) = "";
metabolites.metRecon3DID{idx} = '';
metabolites.metMetaNetXID{idx} = 'MNXM732007';
metabolites.metHMR2ID{idx} = '';
metabolites.metRetired{idx} = '';



