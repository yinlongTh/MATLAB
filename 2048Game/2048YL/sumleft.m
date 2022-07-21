function [mat, changed] = sumleft(mat) %sum with neighbor
changed = false;

for i = 1:1:4
    for j =1:1:3
        
        if mat(i,j) == mat(i,j+1) &&mat(i,j) ~=0
            mat(i,j) = mat(i,j)*2;
            mat(i,j+1) = 0;

        end
    end
end

changed = true;

end