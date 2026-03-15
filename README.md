# Image Processing Filters using MATLAB

This project demonstrates several spatial filtering techniques used in digital image processing. The goal is to reduce noise, smooth images, and detect edges using MATLAB.

## Overview

Image processing converts images into digital form and applies algorithms to enhance image quality or extract useful information.

In an 8-bit grayscale image, pixel values range from **0 to 255**, representing light intensity at each pixel.

Filtering techniques are widely used to:
- remove noise
- smooth images
- enhance edges
- detect features

## Types of Noise

Common image noise includes:

- Gaussian noise
- Salt-and-pepper noise
- Shot noise
- Quantization noise

Noise is an undesirable variation in pixel intensity that degrades image quality.  
:contentReference[oaicite:1]{index=1}

## Filters Implemented

### Mean Filter
The mean filter replaces each pixel value with the average of its neighborhood.

Advantages:
- smooths image
- reduces random noise

Disadvantages:
- blurs edges

### Median Filter
The median filter replaces each pixel value with the median value of its surrounding pixels.

Advantages:
- removes salt-and-pepper noise
- preserves edges better than mean filter

### Conservative Filter
The conservative filter limits each pixel value within the minimum and maximum values of its neighborhood.

Advantages:
- preserves edges
- reduces impulse noise

### Weighted Average Filter
In this filter the center pixel has a larger weight compared to other pixels, allowing better control of smoothing.

### Gaussian Filter
A Gaussian filter is a smoothing filter where weights follow a Gaussian distribution. Pixels near the center receive higher weight.

## MATLAB Implementation

Filtering modifies pixels based on their neighborhood values.

General form:

Where:

- **A** = input image  
- **h** = filter matrix  
- **B** = filtered image

## Example Image

![Original Image](images/original_image.png)

## Filter Results

### Mean Filter
![Mean Filter](images/mean_filter.png)

### Median Filter
![Median Filter](images/median_filter.png)

### Conservative Filter
![Conservative Filter](images/conservative_filter.png)

### Average Filter
![Average Filter](images/average_filter.png)

### Gaussian Filter
![Gaussian Filter](images/gaussian_filter.png)

## Graphical User Interface (GUI)

A MATLAB GUI was created using the **GUIDE** tool.

Features:
- Load image
- Apply filters
- Display original and filtered image
- Switch between filters

The GUI contains:
- image display axes
- filter buttons
- image navigation controls

## Results

The filters successfully demonstrate different smoothing and enhancement techniques.

Observations:

- Mean filter reduces noise but blurs edges.
- Median filter removes impulse noise effectively.
- Gaussian filter provides smooth blurring.
- Conservative filter preserves edges better than average filters.

## Applications

These techniques are widely used in:

- computer vision
- medical imaging
- satellite image processing
- object detection
- noise removal

## Tools Used

- MATLAB
- MATLAB GUIDE GUI

## Author

Disha Harwalkar
