# Image Processing Filters using MATLAB

This project demonstrates several spatial filtering techniques used in digital image processing using MATLAB.

The objective is to compare different filters used for:
- noise reduction
- image smoothing
- edge enhancement

## Overview

Image processing converts an image into digital form and applies operations to enhance the image or extract useful information.

A digital image is composed of pixels. In an 8-bit grayscale image, pixel values range from **0 to 255**, representing light intensity.

Filtering techniques are used to:

- remove noise
- smooth images
- detect edges
- enhance image features

## Types of Noise

Common noise in images includes:

- Gaussian noise
- Salt and pepper noise
- Shot noise
- Quantization noise

Noise is unwanted variation in pixel intensity that degrades image quality.

## Filters Implemented

### Mean Filter
The mean filter replaces each pixel with the average value of its neighbourhood.

Advantages:
- smooths image
- reduces random noise

Disadvantage:
- blurs edges

### Median Filter
The median filter replaces each pixel with the median value of neighbouring pixels.

Advantages:
- removes salt-and-pepper noise
- preserves edges better than mean filter

### Conservative Filter
The conservative filter limits each pixel value within the minimum and maximum values in its neighbourhood.

Advantages:
- preserves edges
- removes impulse noise

### Weighted Average Filter
In this filter the center pixel has greater weight than surrounding pixels.

### Gaussian Filter
A Gaussian filter smooths the image using a Gaussian distribution where pixels near the centre have higher influence.

## MATLAB Implementation

Image filtering in MATLAB is performed using:

