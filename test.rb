puts "hello"
def factorial (a)
    num = 1;

    i = 1;
    for i in 1..a
        num *= i
        i+=1
    end

    return num;
end


