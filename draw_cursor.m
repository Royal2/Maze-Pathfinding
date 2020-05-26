function draw_cursor(curr_pos, size, color, h)
    % Function to draw the cursor on the maze. 
    % Inputs:
    %   curr_pos: current position in linear indexing
    %   size: size of the maze [data.num_rows, data.num_cols]
    %   color: color of the cursor 'r' = red, 'g' = green
    %   h: handle to the figure with the maze already drawn
    figure(h);
    [r, c] = ind2sub(size, curr_pos);
    text(c-.05, r+.1, 'o', 'HorizontalAlignment', 'Center', 'color', color);
end

