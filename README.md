# [MoNuSeg grand-challenge](https://monuseg.grand-challenge.org/) organized at [MICCAI 2018](https://www.miccai2018.org/en/)

Please cite the following papers if you use this repository-

[N. Kumar, R. Verma et al., "A Multi-organ Nucleus Segmentation Challenge," in IEEE Transactions on Medical Imaging (in press)](https://ieeexplore.ieee.org/document/8880654)

[Kumar, N., Verma, R., Sharma, S., Bhargava, S., Vahadane, A., & Sethi, A. (2017). A dataset and a technique for generalized nuclear segmentation for computational pathology. IEEE transactions on medical imaging, 36(7), 1550-1560](https://ieeexplore.ieee.org/document/7872382)



| **File name** | **Description** |
| ------------- | ------------- |
| [Aggregated_Jaccard_Index_v1_0](https://github.com/ruchikaverma-iitg/MoNuSeg/blob/master/Aggregated_Jaccard_Index_v1_0.m) | Compute average AJI across all nuclei for each image|
| [compute_AJI](https://github.com/RuchikaVermaVaid/MoNuSeg/blob/master/compute_AJI.m) | Compute average AJI (across all nuclei) per image for each participant|
| [Ensemble_mask](https://github.com/ruchikavermavaid/MoNuSeg/blob/master/ensemble_top_5.m) | Combine instance masks of top 5 techniques to get ensemble mask using majority voting|
| [correct_nd_missing_nuc_count](https://github.com/RuchikaVermaVaid/MoNuSeg/blob/master/correct_nd_missing_nuc_count.m) | Count correctly classified nuclei and missing nuclei in each predicted mask of top 5 techniques|
| [he_to_binary_mask_final](https://github.com/ruchikavermavaid/MoNuSeg/blob/master/he_to_binary_mask_final.m) | Use H&E stained image along with associated xml file to generate binary and colored mask|
| [Nuclei-Segmentation](https://github.com/ruchikaverma-iitg/Nuclei-Segmentation) | An implementation of Mask R-CNN algorithm for nuclei segmentation|

# [Nuclei-Segmentation](https://github.com/ruchikaverma-iitg/Nuclei-Segmentation)
An implementation of Mask R-CNN algorithm using [Matterport library](https://github.com/matterport/Mask_RCNN)
for nuclei segmentation from whole slide images of tissue sections can be found from the links given below: 

[Testing code](https://github.com/ruchikaverma-iitg/Nuclei-Segmentation/blob/master/Nuclei_Segmentation_testing_code.ipynb)

[Trained weights](https://drive.google.com/open?id=16oPaebQnZCMzEsEGvhSVPMvEhbKJPATQ)

