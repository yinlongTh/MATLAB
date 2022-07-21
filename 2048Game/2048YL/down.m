function [new_bd, changed] = down(bd)
new_bd = transpose(bd);
[new_bd, changed] = right(new_bd);
new_bd = transpose(new_bd);

if new_bd == bd
changed = false;
else
changed = true;
end

end