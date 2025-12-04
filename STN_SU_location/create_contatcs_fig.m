%%
clear all;
clc;

coord = readtable('STN_loc/save_stn_loc_s_cv.csv');

% ea_mnifigure();


% Define the colormap
% Preallocate an array to store colors
% colors = zeros(height(coord), 3);

% Loop through each row of the table
for i = 1:height(coord)
        % Extract value_x and value_y from the current row
        x = coord{i, 'MNI_X'};
        y = coord{i, 'MNI_Y'};
        z = coord{i, 'MNI_Z'};
        value_x = [x, y, z];
    
    %   value_x = {coord{i, 'mni_linear_x'},coord{i, 'mni_linear_y',coord{i, 'mni_linear_z'}}; % Convert string to numeric array
        %value_y = coord{i, 'Intensity'};
        % Determine the range of values in value_y column
        %min_value_y = min(coord.min_p);
        %max_value_y = max(coord.min_p);
        
        % Map the value_y to an intensity value between 0 and 1
        %intensity = (value_y - min_value_y) / (max_value_y - min_value_y);
        intensity = 1;
        % Map intensity to a color using a colormap
        cmap = autumn; % You can use any other colormap you prefer
        color_index = round(intensity * (size(cmap, 1) - 1)) + 1;
        color_index = max(1, min(color_index, size(cmap, 1))); % Ensure color_index is within valid range
        color = cmap(color_index, :);
        
        % Store the color in the colors array
    %     colors(i, :) = color;
    
        hold on;
        ea_plot_colored_spheres(value_x,0.2,0.2,'cyan');
end