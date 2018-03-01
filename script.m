% get a list of csv files in a folder called ‘foldername’ and puts it in an array
% specify a full path for foldername -- aka something like  ‘C:/…………../'foldername'
files = dir ('*.txt');

% the file to write your min/max values to. make sure it already exists.
fileID = fopen('outputData.csv', 'w'); 
formatSpec = '%s,%10.4f,%10.4f\n'; 

% goes through all the files
for file = files' 

    % load a file into an array called csv file
    % note that this only works if you don’t have a header (i.e. you only have data in your file). if you have something like titles for each column in your file, then try “csv = importdata(file.name)”
    csv = load(file.name);

    % get portion of data
    data = csv(59,59:80);

    % find max
    mx = max(data);

    % find min
    mn = min(data);
    
    % print to file
    
    fprintf(fileID, formatSpec, file.name, mn, mx); 
    
end

fclose(fileID);
