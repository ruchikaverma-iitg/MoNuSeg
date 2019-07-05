% Script to count correctly classified nuclei and missing nuclei in each predicted mask
% Created by Ruchika Verma, please cite the following paper if you use this code-
% N. Kumar, R. Verma, S. Sharma, S. Bhargava, A. Vahadane and A. Sethi, 
% "A Dataset and a Technique for Generalized Nuclear Segmentation for 
% Computational Pathology," in IEEE Transactions on Medical Imaging, 
% vol. 36, no. 7, pp. 1550-1560, July 2017

clc;
clear all;
close all;

% Set path
dirname = 'D:\Research work\MONUSEG\Top_5_teams';
addpath('D:\Research work\MONUSEG\Top_5_teams');
listing = dir(dirname);
patient_names = listing(3:end);

% Loop start with GT
correct_dirname = 'D:\Research work\MONUSEG\GT';
correct_listing = dir([correct_dirname,'\*.mat']);

%  Loop on participants
for k = 1:5% participants
participant = (strcat(dirname,'\',patient_names(k).name));
cd(participant);
participant_name = dir();
participant_name(~[participant_name.isdir]) = [];
participant_name = strcat(participant,'\',participant_name(3).name);


% Comparison of each image
for j = 1:14 % 14 images

correct_mask = load(strcat(correct_dirname,'\',correct_listing(j).name));
correct_mask = double(cell2mat(struct2cell(correct_mask)));

correct_list = unique(correct_mask); % set of unique gt nuclei
correct_list = correct_list(2:end); % exclude 0
ncorrect = numel(correct_list);

% Load predicted mask in predicted_map and count unique indices in predicted_indices
cd(participant_name);
if exist(strcat(correct_listing(j).name(1:end-7),'.mat'))
    predicted = load(strcat(participant_name,'\',correct_listing(j).name(1:end-7),'.mat'));
else
    predicted = load(strcat(participant_name,'\',correct_listing(j).name(1:end-7),'_predicted_map.mat'));
end
predicted_map = double(cell2mat(struct2cell(predicted)));
predicted_indices = nonzeros(unique(predicted_map));

% Count correctly classified nuclei and missing nuclei
miss_nuc = 0; % missing nuclei
correct_nuc = 0; % correctly classified nuclei

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

% combine results
p(j,1:2) = count;

end

overall_count{k} = p;%% It will save results for top 5 teams

end
