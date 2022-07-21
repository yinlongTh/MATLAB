function [new_bd, changed] = right(bd)
new_bd = fliplr(bd);
[new_bd, changed] = left(new_bd);
new_bd = fliplr(new_bd);

if new_bd == bd
changed = false;
else
changed = true;
end

end