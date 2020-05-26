clc; clear; close all;

data = load('data.mat');
cur_loc = 1;
h = figure();
show_maze(data, h);
draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'r', h);

% TODO: Implement DFS
%{
%Useful java.util.LinkedList() function calls
%LL=java.util.LinkedList();
%LL.add(i)  %add i onto the linked list
%LL.removeFirst()    %outputs first element in and removes it from list
%LL.isEmpty()  %checks if the linked list is empty
%LL.clear()  %clears linked list
%LL.size()  %size of linked list
%}
LL=java.util.LinkedList();  %initializing linked list
N=data.num_rows*data.num_cols;
visited=zeros(N,1); %visited nodes
LL.add(cur_loc);    %add initial position
visited(cur_loc)=1;   %mark as visited

goal=1400;
%while (~LL.isEmpty()) && (cur_loc ~= data.goal(1)) && (cur_loc ~= data.goal(2))%run while linked list has content
while (~LL.isEmpty()) && (cur_loc ~= goal)
    i=LL.removeFirst(); %remove fisrst added element on list
    cur_loc=i;
    visited(i)=1;   %mark as visited
    neighbors = sense_maze(i,data);
    draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'r', h);
    for j=1:1:size(neighbors,2)
        if ~visited(neighbors(j))    %do if not visited
            LL.add(neighbors(j))   %add neighbor onto list
        end
    end
end
draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'g', h);   %last location in green
fprintf('Number of iterations: %d', nnz(visited));
%{
if(find(data.goal(2)))
    draw_cursor(data.goal(1), [data.num_rows, data.num_cols], 'b', h);
else
    draw_cursor(data.goal(2), [data.num_rows, data.num_cols], 'b', h);
end
%}