[file_data,path_data]=uigetfile('*/*.csv','Import Data');
test=load([path_data file_data]);

data_seion = test(:,2:end);
datanormal = mapminmax(data_seion)'; %data yang telah dinormalisasi
setappdata(0,'file_d',file_data);