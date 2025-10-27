cd ../RAVEN/installation
checkInstallation()

cd ../../Human-GEM/model
load('Human-GEM.mat')

metsToAdd.mets = "MAM02643m"
metsToAdd.metNames = "octanoyl-[ACP]"
metsToAdd.compartments = "m"
metsToAdd.metCharges = -1

ihuman1 = addMets(ihuman, metsToAdd)

metabolites = importTsvFile("Human-GEM/model/metabolites.tsv")

idx = 4516;

fillfields = {'mets', 'metsNoComp', 'metKEGGID', 'metChEBIID'}

fields = fieldnames(metabolites)

for f = 1:numel(fields)
thisField = fields{f};

% Insert an empty cell placeholder for all fields
metabolites.(thisField)(idx+1:end+1) = metabolites.(thisField)(idx:end);
metabolites.(thisField){idx} = [];
end

metabolites.mets{idx} = 'MAM02643m'
metabolites.metsNoComp{idx} = 'MAM02643'
metabolites.metKEGGID{idx} = 'C05752';
metabolites.metChEBIID{idx} = 'MNXM979';

exportTsvFile(metabolites, 'metabolites_mod.tsv')
