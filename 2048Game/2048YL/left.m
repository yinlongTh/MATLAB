function [new_bd, changed] = left(bd)
[new_bd, changed] = moveleft(bd);
[new_bd, changed] = sumleft(new_bd);
[new_bd, changed] = moveleft(new_bd);

if new_bd == bd
changed = false;
else
changed = true;
end

end