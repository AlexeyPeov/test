#puts "hello"
def factorial (a)
    num = 1;

    i = 1;
    for i in 1..a
        num *= i
        i+=1
    end

    return num;
end 

def squareOf (a) 
    return a*a;
end

#1. Написать метод greeting, который будет запрашивать имя, фамилию и возраст, а затем выдавать приветствие в одном из двух вариантов, в за-висимости от возраста: 
#○ Привет, {имя} {фамилия}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано. 
#○ Привет, {имя} {фамилия}. Самое время заняться делом! 
#2. Написать метод foobar, который принимает пару чисел, если хотя бы одно равно 20 - возвращает второе число, в противном случае выводит сумму этих чисел. 
def greeting 
    puts "Hello\nWhats your name?\n"
    name = gets.chomp 
    puts "Whats your second name?\n"
    secondName = gets.chomp
    puts "Whats your age?\n"
    age = gets.chomp

    if age.to_i < 18 
        puts "Hi #{name} #{secondName}. Your age is less than 18, but it's never too early to start programming."
    else puts "Hi #{name} #{secondName}. It's about time you started programming!"
    end
end

def foobar (a,b)
    if a === 20 || b == 20
        return b
    else return a+b
    end
end

greeting
puts foobar(15,20)
puts foobar 




