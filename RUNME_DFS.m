clc; clear; close all;

data = load('data.mat');
cur_loc = 1;
h = figure();
show_maze(data, h);
draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'r', h);

% TODO: Implement DFS
%{
%Useful java.util.Stack() function calls
%stack=java.util.Stack();
%stack.peek()   %outputs the top object in the stack without removing it
%stack.push(i)  %pushes i onto the stack
%stack.pop()    %outputs the top object in the stack and removes it
%stack.empty()  %checks if the stack is empty
%stack.clear()  %clears stack
%}
stack=java.util.Stack();    %initializing empty stack
N=data.num_rows*data.num_cols;
visited=zeros(N,1); %visited nodes
parent=zeros(N,1);  %parent nodes
stack.push(cur_loc);    %pushing initial position onto stack
%data.goal%location of goals are 35 and 40
goal=1400;
%while (stack.empty()==0) && (cur_loc ~= data.goal(1)) && (cur_loc ~= data.goal(2))
while (stack.empty()==0) && (cur_loc ~= goal)
    i=stack.pop();
    cur_loc=i;
    draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'r', h);
    if (visited(i)==0)   %we have not visited i
        visited(i)=1;   %mark i as visited
        neighbors = sense_maze(i,data); %get neighbors of i
        for j=1:1:size(neighbors,2)   %iterate for all the neighbors to i
            if visited(neighbors(j))==0    %do if not visited
                stack.push(neighbors(j))
                parent(neighbors)=cur_loc;
            end
        end
    end
end
draw_cursor(cur_loc, [data.num_rows, data.num_cols], 'g', h);   %last location in green
fprintf('Number of iterations: %d', nnz(visited));

for i=1:1:stack.size()
    draw_cursor(stack.pop(), [data.num_rows, data.num_cols], 'g', h);
end