clear all
clc

bd = startgame();

for i = 1:1:20

    prompt = "WASD to control : ";
    x = input(prompt,"s");

    flag = false;

    if x == "w" || x == "W"
        [bd, flag] = up(bd);
        if flag == true
        bd = addnew(bd);
        end
        disp(bd)
        state = stat(bd);
        if state == "Ended" || state == "win"
            break
        end
    elseif x == "s" || x == "S"
        [bd, flag] = down(bd);
        if flag == true
        bd = addnew(bd);
        end
        disp(bd)
        state = stat(bd);
        if state == "Ended" || state == "win"
            break
        end
    elseif x == "a" || x == "A"
        [bd, flag] = left(bd);
        if flag == true
        bd = addnew(bd);
        end
        disp(bd)
        state = stat(bd);
        if state == "Ended" || state == "win"
            break
        end
    elseif x == "d" || x == "D"
        [bd, flag] = right(bd);
        if flag == true
        bd = addnew(bd);
        end
        disp(bd)
        state = stat(bd);
        if state == "Ended" || state == "win"
            break
        end
    end
end
