clc;
clear all;
close all;

%% Set path
dirname = 'D:\Research work\MONUSEG\Top_5_teams';
addpath('D:\Research work\MONUSEG\Top_5_teams');
listing = dir(dirname);
patient_names = listing(3:end);

%% Loop start with GT
correct_dirname = 'D:\Research work\MONUSEG\GT';
correct_listing = dir([correct_dirname,'\*.mat']);

%% Comparison of each image

for k = 1:5% Loop on participants
participant = (strcat(dirname,'\',patient_names(k).name));
cd(participant);
participant_name = dir();
participant_name(~[participant_name.isdir]) = [];
participant_name = strcat(participant,'\',participant_name(3).name);


for j = 1:14 % 14 images

correct_mask = load(strcat(correct_dirname,'\',correct_listing(j).name));
correct_mask = double(cell2mat(struct2cell(correct_mask)));

correct_list = unique(correct_mask); % set of unique gt nuclei
correct_list = correct_list(2:end); % exclude 0
ncorrect = numel(correct_list);

%%

cd(participant_name);
if exist(strcat(correct_listing(j).name(1:end-7),'.mat'))
    predicted = load(strcat(participant_name,'\',correct_listing(j).name(1:end-7),'.mat'));
else
    predicted = load(strcat(participant_name,'\',correct_listing(j).name(1:end-7),'_predicted_map.mat'));
end
predicted_map = double(cell2mat(struct2cell(predicted)));
predicted_indices = nonzeros(unique(predicted_map));

%%
miss_nuc = 0;
correct_nuc = 0;

for c = 1:ncorrect
    fprintf('Processing object # %d \n',c);
    temp_mask = (correct_mask==correct_list(c));
     pred = temp_mask.*predicted_map;%Has intersecting unique labels 
     matched_indices = nonzeros(unique(pred));
    
     if ~nnz(matched_indices) == 0%If non-zero, find intersecting pixels
            intersection_pixels = [];
            for i=1:numel(matched_indices)
               temp = temp_mask.* (pred==matched_indices(i));
               intersection_pixels(i) = sum(temp(:));      
            end
        
        [n idx]= max(intersection_pixels);
        matched_idx = matched_indices(idx);
        
        predicted_map(predicted_map == matched_idx) = 0;
        predicted_indices(predicted_indices == matched_idx) = [];
        
        correct_nuc = correct_nuc+1;
     else
         miss_nuc = miss_nuc+1;
     end

count = [correct_nuc miss_nuc];

end

%% combine results
p(j,1:2) = count;

end

overall_count{k} = p;
end
