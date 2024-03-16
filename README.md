

# Bilinear Interpolation for Image Scaling

## Overview
This MATLAB function `bilinearInterpolation` is designed to perform image scaling using bilinear interpolation. Bilinear interpolation is a method of resampling images that involves weighted averaging of the four nearest known pixel values surrounding the unknown pixel. It is commonly used in image processing to resize images while preserving smoothness and reducing aliasing artifacts.

## Usage
To use this function, follow these steps:
1. Ensure you have MATLAB installed on your system.
2. Copy the `bilinearInterpolation` function into your MATLAB working directory or add its directory to the MATLAB path.
3. Call the function `bilinearInterpolation` with the original image and the desired scaling factor as input arguments.

```matlab
scaledImage = bilinearInterpolation(originalImage, scaleFactor);
```

## Parameters
- `originalImage`: The input image to be scaled. It should be a 3-dimensional array representing an RGB image.
- `scaleFactor`: The factor by which the image will be scaled. A scaleFactor greater than 1 will enlarge the image, while a scaleFactor less than 1 will shrink the image.

## Output
The function returns the scaled image, which is a 3-dimensional array of the same class as the original image.

## Error Handling
- If the `scaleFactor` provided is less than or equal to 0, an error will be thrown indicating that the scale factor must be greater than zero.

## Implementation Details
- The function iterates over each channel of the image (e.g., Red, Green, Blue).
- For each pixel in the scaled image, it computes the corresponding coordinates in the original image using bilinear interpolation.
- It calculates the interpolated pixel value based on the four nearest pixels in the original image and their distances to the target point.
- The resulting interpolated value is assigned to the corresponding pixel in the scaled image.

## Notes
- Bilinear interpolation provides reasonable results for moderate scaling factors but may not preserve fine details in the image.
- For higher quality scaling and preservation of fine details, more advanced interpolation techniques such as bicubic interpolation may be preferred.

## Article
[Click]() for the article where I explain what bilinear interpolition is and how it works

## Author
This function was written by [Ömer Ahat](https://github.com/omerahat) for educational purposes.

## License
This code is provided under the license. You are free to modify and distribute it for non-commercial purposes.


