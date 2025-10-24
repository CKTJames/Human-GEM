function structure = importTsvFile(filename, numeric_cols)

if nargin < 2
    numeric_cols = [];
end

% This loading process is written in this seemingly overcomplicated manner
% because we want to import the data without knowing in advance how many
% columns there are, and to automatically interpret the column type based
% on the presence/absence of quotes "".

% read the second line of the file to determine the column formats
fid = fopen(filename);
fgetl(fid);  % skip first line (column names)
L = strsplit(fgetl(fid), '\t', 'CollapseDelimiters', false);
fclose(fid);

% load file import options and modify with expected column formats
opt = detectImportOptions(filename, 'FileType', 'text', 'Delimiter', '\t');
opt.VariableTypes(contains(L, '"')) = {'char'};
opt.VariableTypes(~contains(L, '"')) = {'double'};
opt.DataLines = [2 Inf];  % data starts from line 2 (readtable sometimes guesses this incorrectly)

% update column types
if all(ismember(opt.VariableTypes, 'double'))
    opt.VariableTypes(:) = {'char'};
end
if ~isempty(numeric_cols)
    opt.VariableTypes(numeric_cols) = {'double'};
end

% import the file as a table and convert to structure
tab = readtable(filename, opt);
structure = table2struct(tab, 'ToScalar', true);
