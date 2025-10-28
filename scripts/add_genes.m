% load model as normal

genesToAdd.genes = {'ENSG00000100209'; 'ENSG00000105755'; 'ENSG00000109519'; 'ENSG00000113013'; 'ENSG00000135070'; 'ENSG00000136003'; 'ENSG00000137714'; 'ENSG00000137767'; ...
'ENSG00000165898'; 'ENSG00000169599'; 'ENSG00000181873'; 'ENSG00000182512'; 'ENSG00000244005'; 'ENSG00000267673'; 'ENSG00000214113'};
genesToAdd.geneShortNames = {'HSCB', 'ETHE1', 'GRPEL1', 'HSPA9', 'ISCA1', 'ISCU', 'FDX1', 'SQOR', 'ISCA2', 'NFU1', 'IBA57', 'GLRX5', 'NFS1', 'FDX2', 'LYRM4'};

genesToAdd.geneShortNames = genesToAdd.geneShortNames.';

% the below genes are already in the model
 % ENSG00000135070, ENSG00000137714, ENSG00000165898, ENSG00000169599

genesToAdd.genes = {'ENSG00000100209'; 'ENSG00000105755'; 'ENSG00000109519'; 'ENSG00000113013'; 'ENSG00000136003'; 'ENSG00000137767'; ...
'ENSG00000181873'; 'ENSG00000182512'; 'ENSG00000244005';  'ENSG00000267673'; 'ENSG00000214113'};
genesToAdd.geneShortNames = {'HSCB', 'ETHE1', 'GRPEL1', 'HSPA9', 'ISCU', 'SQOR', 'IBA57', 'GLRX5', 'NFS1', 'FDX2', 'LYRM4'};
genesToAdd.geneShortNames = genesToAdd.geneShortNames.';


ihuman = addGenesRaven(ihuman,genesToAdd)

genes = importTsvFile('genes.tsv')

geneStruct = importTsvFile('genesToAdd_20251028.tsv')

fields = fieldnames(genes);
for f = 1:numel(fields)
    fld = fields{f};
    genes.(fld) = [genes.(fld); geneStruct.(fld)];
end


gene = 'ENSG00000100209'; 
geneIdx = strcmp(genes.genes, gene);
genes.genes(geneIdx)
genes.geneSymbols(geneIdx)
exportTsvFile(genes, 'genes_mod.tsv')

