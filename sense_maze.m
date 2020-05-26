function neighbors = sense_maze( curr_idx, data )
% Finds the neighbors of the current node in the maze
%   Inputs:
%       curr_idx: the current linear index in the maze
%       data: the data struct that was loaded at the beginning
    neighbors = find(data.node_graph(curr_idx, :));
end

