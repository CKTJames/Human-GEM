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
