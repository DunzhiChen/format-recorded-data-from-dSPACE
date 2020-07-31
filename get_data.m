% Input : .mat file exported from ControlDesk recorded data
% Output: a structure with and time and each recorded signal as a field

% To use the output data, click the output data to see what is recorded
function data_from_dSPACE=get_data(experiment_data)
experiment = load(experiment_data);

% Get the field name

% Change the data field name, so that the code below can be reused
oldField = fieldnames(experiment);
newField = 'data';
[experiment.(newField)] = [experiment.(oldField{1,1})];
experiment = rmfield(experiment,oldField{1,1});

% Get the number of variables logged
temp = size(experiment.data.Y);
n   = temp(2);

% Create a new structure with fields using the variables names
for i=1:1:n
    a = experiment.data.Y(i).Name;
 name = matlab.lang.makeValidName(a);
 data.(name)=experiment.data.Y(i).Data;
end
data.time = experiment.data.X.Data; % time

data_from_dSPACE = data;
end