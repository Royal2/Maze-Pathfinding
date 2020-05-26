function show_maze(data, h)
row = data.num_rows;
col = data.num_cols;
rr = data.rr;
cc = data.cc;
ptr_left = data.ptr_left;
ptr_up = data.ptr_up;
ptr_right = data.ptr_right;
ptr_down = data.ptr_down;
figure(h)
line([.5,col+.5],[.5,.5]) % draw top border
line([.5,col+.5],[row+.5,row+.5]) % draw bottom border
line([.5,.5],[1.5,row+.5]) % draw left border
line([col+.5,col+.5],[.5,row-.5])  % draw right border
for ii=1:length(ptr_right)
    if ptr_right(ii)>0 % right passage blocked
        line([cc(ii)+.5,cc(ii)+.5],[rr(ii)-.5,rr(ii)+.5]);
        hold on
    end
    if ptr_down(ii)>0 % down passage blocked
        line([cc(ii)-.5,cc(ii)+.5],[rr(ii)+.5,rr(ii)+.5]);
        hold on
    end     
end
% Uncomment these to see the node numbering of the maze
% for r=1:row
%     for c=1:col
%         label = char(sprintf("%i", sub2ind([row, col], r, c)));
%         text(c-.05, r+.1, label, 'HorizontalAlignment', 'Center');
%     end
% end

axis equal
axis([.5,col+.5,.5,row+.5])
axis off
% set(gca,'YDir','reverse')
return




