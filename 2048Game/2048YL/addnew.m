function new_mat = addnew(mat)

new_mat = mat;

r1 = randi([1 4]);
r2 = randi([1 4]); 
while mat(r1,r2) ~= 0
    r1 = randi([1 4]);
    r2 = randi([1 4]);
end

new_mat(r1,r2)  = 2;

end