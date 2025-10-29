grRules = 'ENSG00000016391 or ENSG00000100033 or ENSG00000102967 or ENSG00000105379 or ENSG00000115159 or ENSG00000137767 or ENSG00000140374 or ENSG00000171503 or ENSG00000250799';
rxns = 'MAR06911'

ihuman = changeGrRules(ihuman, rxns, grRules)

save('Human-GEM_mod.mat' 'ihuman')
exportModel(ihuman, 'Human-GEM_mod.xml')


