% load model as usual

metsToAdd.mets = {'MAM20085m'}
metsToAdd.metNames = {'2Fe2S iron-sulfur cluster'}
metsToAdd.compartments = {'m'}
metsToAdd.metFormulas = {'S2Fe2'}
metsToAdd.metCharges = 2
metsToAdd.inchis = 'InChI=1S/2Fe.2S/q2*+1;;'

ihuman1 = addMets(ihuman, metsToAdd)

save('Human-GEM_mod.mat', 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')

% need to change MAM02643m and MAM20084m to cell arrays - pull them and check what they are, change

metabolites = importTsvFile('metabolites_mod.tsv')

idx = numel(metabolites.mets) + 1;

metabolites.mets{idx} = 'MAM20085m';
metabolites.metsNoComp{idx} = 'MAM20085';
metabolites.metBiGGID{idx} = '2fe2s';
metabolites.metKEGGID{idx} = "";
metabolites.metHMDBID(idx) = "";
metabolites.metChEBIID{idx} = 'CHEBI:33737';
metabolites.metPubChemID(idx) = "5460691";
metabolites.metLipidMapsID(idx) = "";
metabolites.metEHMNID(idx) = "";
metabolites.metHepatoNET1ID(idx) = "";
metabolites.metRecon3DID{idx} = '';
metabolites.metMetaNetXID{idx} = 'MNXM1107419';
metabolites.metHMR2ID{idx} = '';
metabolites.metRetired{idx} = '';
