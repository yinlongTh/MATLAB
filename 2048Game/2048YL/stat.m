function tq = stat(bd)

tq = "st";

for i = 1:1:4
 for j = 1:1:4
    if bd(i,j) == 2048
        tq = "win";
    end
 end
end

for i = 1:1:4
 for j = 1:1:4
    if bd(i,j) == 0
        tq = "Continue";
    end
 end
end

for i = 1:1:3
 for j = 1:1:3
    if bd(i,j) == bd(i+1,j) || bd(i,j) == bd(i,j+1)
        tq = "Continue";
    end
 end
end

for i = 1:1:3
    if bd(i,3) == bd(i+1,3)
        tq = "Continue";
    end
end

for j = 1:1:3
    if bd(3,j) == bd(3,j+1)
        tq = "Continue";
    end
end

if tq == "st"
tq = "Ended";
end


end