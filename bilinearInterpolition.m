function scaledImage = bilinearInterpolition(originalImage, scaleFactor)
    if scaleFactor <= 0
        error('Scale Factor Must Be Greater Than Zero');
    end

    [rows, cols, channels] = size(originalImage);
    newRows = round(rows * scaleFactor);
    newCols = round(cols * scaleFactor);
    scaledImage = zeros(newRows, newCols, channels, class(originalImage));

    for k = 1:channels
        for i = 1:newRows
            for j = 1:newCols
                x = 1 + (i - 1) * (rows - 1) / (newRows - 1);
                y = 1 + (j - 1) * (cols - 1) / (newCols - 1);

                xFloor = floor(x);
                xCeil = min(rows, xFloor + 1);

                yFloor = floor(y);
                yCeil = min(cols, yFloor + 1);

                if xFloor == xCeil
                    xCeil = xCeil + 1;
                end
                if yFloor == yCeil
                    yCeil = yCeil + 1;
                end

                xWeight = xCeil - x;
                yWeight = yCeil - y;

                q11 = originalImage(max(1, min(rows, xFloor)), max(1, min(cols, yFloor)), k);
                q21 = originalImage(max(1, min(rows, xCeil)), max(1, min(cols, yFloor)), k);
                q12 = originalImage(max(1, min(rows, xFloor)), max(1, min(cols, yCeil)), k);
                q22 = originalImage(max(1, min(rows, xCeil)), max(1, min(cols, yCeil)), k);

                interpolatedValue = ...
                    q11 * xWeight * yWeight + ...
                    q21 * (1 - xWeight) * yWeight + ...
                    q12 * xWeight * (1 - yWeight) + ...
                    q22 * (1 - xWeight) * (1 - yWeight);


                scaledImage(i, j, k) = interpolatedValue;
            end
        end
    end
end
