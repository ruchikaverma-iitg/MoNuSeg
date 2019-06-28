# MoNuSeg

This repository contains my implementations of the algorithms which [MoNuSeg](https://monuseg.grand-challenge.org/) organizers used for evaluation of the [MoNuSeg challenge](https://monuseg.grand-challenge.org/) at [Miccai 2018](https://www.miccai2018.org/en/)

Please cite the following paper if you use this code-
[Kumar, N., Verma, R., Sharma, S., Bhargava, S., Vahadane, A., & Sethi, A. (2017). A dataset and a technique for generalized nuclear segmentation for computational pathology. IEEE transactions on medical imaging, 36(7), 1550-1560](https://ieeexplore.ieee.org/document/7872382)



| **File name** | **Description** |
| ------------- | ------------- |
| [1) compute_AJI](https://github.com/RuchikaVermaVaid/MoNuSeg/blob/master/compute_AJI.m) | Compute average AJI across all nuclei for each image of each participant|
| [2) combine_top_5](https://github.com/RuchikaVermaVaid/MoNuSeg/blob/master/combine_top_5.m) | Combine predicted masks of top 5 participants to get combined predicted masks of each image|
