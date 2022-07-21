function [new_mat, changed] = moveleft(mat) %make everything to most left but not sum

    changed = false;

    new_mat = zeros(4,4);

 
    for i = 1:1:4
        pos = 1;
 
        for j = 1:1:4
            if mat(i,j) ~= 0
                 
                new_mat(i,pos) = mat(i,j);
                 
                if j ~= pos
                    changed = true;
                end
                pos = pos + 1;
            end
        end
    end

end