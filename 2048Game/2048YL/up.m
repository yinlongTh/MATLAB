function [new_bd, changed] = up(bd)
new_bd = transpose(bd);
[new_bd, changed] = left(new_bd);
new_bd = transpose(new_bd);

if new_bd == bd
changed = false;
else
changed = true;
end

end