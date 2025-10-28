  GNU nano 6.2                                                                      add_MAM01098m.m *
% load model as usual

metsToAdd.mets = {'MAM01098m'}
metsToAdd.metNames = {'5-deoxyadenosine'}
metsToAdd.compartments = {'m'}
metsToAdd.metFormulas = {'C10H13N5O3'}
metsToAdd.metCharges = 0
metsToAdd.inchis = ''
metsToAdd.metFrom = 'HMRdatabase'

ihuman1 = addMets(ihuman, metsToAdd)

save('Human-GEM_mod.mat', 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')

% need to change MAM02643m and MAM20084m to cell arrays - pull them and check what they are, change

metabolites = importTsvFile('metabolites_mod.tsv')

idx = find(strcmp(metabolites.mets, 'MAM01098e'));

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

metabolites.mets{idx+1} = 'MAM01098m';
metabolites.metsNoComp{idx} = 'MAM01098';
metabolites.metBiGGID{idx} = 'dad_5';
metabolites.metKEGGID{idx} = 'C05198';
metabolites.metHMDBID(idx) = "";
metabolites.metChEBIID{idx} = '';
metabolites.metPubChemID(idx) = "";
metabolites.metLipidMapsID(idx) = "";
metabolites.metEHMNID(idx) = "";
metabolites.metHepatoNET1ID(idx) = "";
metabolites.metRecon3DID{idx} = '';
metabolites.metMetaNetXID{idx} = 'MNXM316';
metabolites.metHMR2ID{idx} = '';
metabolites.metRetired{idx} = '';

exportTsvFile(metabolites, 'metabolites_mod.tsv')
