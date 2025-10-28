  GNU nano 6.2                                                                      add_MAM01098m.m *
% load model as usual

metsToAdd.mets = {'MAM02042m'}
metsToAdd.metNames = {'H2S'}
metsToAdd.compartments = {'m'}
metsToAdd.metFormulas = {'HS'}
metsToAdd.metCharges = -1
metsToAdd.inchis = ''
metsToAdd.metFrom = 'HMRdatabase'

ihuman1 = addMets(ihuman, metsToAdd)

save('Human-GEM_mod.mat', 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')

% need to change MAM02643m and MAM20084m to cell arrays - pull them and check what they are, change

metabolites = importTsvFile('metabolites_mod.tsv')

idx = find(strcmp(metabolites.mets, 'MAM02042e'));

idx = idx+1;

fields = fieldnames(metabolites);

for f = 1:numel(fields)
    thisField = fields{f};
    data = metabolites.(thisField);

    if iscell(data)
        % Shift cell field
        metabolites.(thisField)(idx+1:end+1) = data(idx:end);
        metabolites.(thisField){idx} = '';
    elseif isnumeric(data)
        % Shift numeric field
        metabolites.(thisField)(idx+1:end+1) = data(idx:end);
        metabolites.(thisField)(idx) = NaN;
    else
        error('Unexpected field type in %s', thisField);
    end
end

metabolites.mets{idx} = 'MAM02042m';
metabolites.metsNoComp{idx} = 'MAM02042';
metabolites.metBiGGID{idx} = '';
metabolites.metKEGGID{idx} = 'C00283';
metabolites.metHMDBID(idx) = "";
metabolites.metChEBIID{idx} = 'CHEBI:16136';
metabolites.metPubChemID(idx) = "402";
metabolites.metLipidMapsID(idx) = "";
metabolites.metEHMNID(idx) = "";
metabolites.metHepatoNET1ID(idx) = "";
metabolites.metRecon3DID{idx} = '';
metabolites.metMetaNetXID{idx} = 'MNXM162964;MNXM89582';
metabolites.metHMR2ID{idx} = '';
metabolites.metRetired{idx} = '';

exportTsvFile(metabolites, 'metabolites_mod.tsv')
