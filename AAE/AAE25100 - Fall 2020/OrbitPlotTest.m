for x = 0:10
    for y = 0:10
        if(x > y)
            fprintf("*");
        else
            fprintf(" ");
        end
            fprintf(" ");
        if(y > x)
            fprintf("*");
        else
            fprintf(" ");
        end
    end
    fprintf("\n");
end