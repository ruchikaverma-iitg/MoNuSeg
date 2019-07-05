% Script to computer Aggregated Jaccard Index
% Created by Ruchika Verma, please cite the following paper if you use this code-
% N. Kumar, R. Verma, S. Sharma, S. Bhargava, A. Vahadane and A. Sethi, 
% "A Dataset and a Technique for Generalized Nuclear Segmentation for 
% Computational Pathology," in IEEE Transactions on Medical Imaging, 
% vol. 36, no. 7, pp. 1550-1560, July 2017

clc;
clear all;
close all;

% Set path
dirname = 'D:\Research work\MONUSEG\Monuseg results';
addpath('D:\Research work\MONUSEG\Monuseg results');
listing = dir(dirname);
patient_names = listing(3:end);
main_aji = zeros(36,14);% participants, N_testing_images

for k = 1:36 % participants
% Predicted patient name
participant = (strcat(dirname,'\',patient_names(k).name));
cd(participant);
participant_name = dir();
participant_name(~[participant_name.isdir]) = [];
participant_name = strcat(participant,'\',participant_name(3).name);


% GT name
GT_dirname = 'D:\Research work\MONUSEG\GT';
GT_listing = dir([GT_dirname,'\*.mat']);
aji_individual = [];
for j = 1:14 %GT file name

load(strcat(GT_dirname,'\',GT_listing(j).name));
gt_map = binary_mask;

cd(participant_name);
if exist(strcat(GT_listing(j).name(1:end-7),'_predicted_map.mat'))
    predicted = load(strcat(participant_name,'\',GT_listing(j).name(1:end-7),'_predicted_map.mat'));
elseif exist(strcat(GT_listing(j).name(1:end-7),'.mat'))
   predicted = load(strcat(participant_name,'\',GT_listing(j).name(1:end-7),'.mat'));
else
    predicted = load(strcat(participant_name,'\',GT_listing(j).name(1:end-7),'_predicated.mat'));
end

predicted_map = double(cell2mat(struct2cell(predicted)));


aji_individual = [aji_individual;Aggregated_Jaccard_Index_v1_0(gt_map,predicted_map)];
predicted=[];
end

main_aji(k,:) = aji_individual;
end
% mean_aji(k) = mean(aji_individual);




