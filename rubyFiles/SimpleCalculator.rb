# Спроектировать класс SimpleCalculator, который совершает арифметические операции для двух аргументов (сложение, вычитание, умножение, деление).
#Во время разработки, учитывать возможность передачи неправильных аргументов, путём вывода сообщения об ошибке в удобном для пользователя виде.
class SimpleCalculator
    def add(num1,num2)
        if (num1 == nil || num2 == nil)
            puts "Error at SimpleCalculator.add() - method requires parameters".chomp
        end
        if(!(num1.is_a? (Numeric)) || !(num2.is_a? (Numeric)))
            puts "Error at SimpleCalculator.add() - the parameter is not a Number".chomp
        else
        return num1 + num2
        end
    end

    def subtract(num1,num2)
        if(!(num1.is_a? (Numeric)) || !(num2.is_a? (Numeric)))
            puts "Error at SimpleCalculator.subtract() - the parameter is not a Number".chomp
        else
        return num1 - num2
        end
    end

    def multiply(num1, num2)
        if(!(num1.is_a? (Numeric)) || !(num2.is_a? (Numeric)))
            puts "Error at SimpleCalculator.multiply() - the parameter is not a Number".chomp
        else
        return num1 * num2
        end
    end

    def divide(num1,num2)
        if(!(num1.is_a? (Numeric)) || !(num2.is_a? (Numeric)))
            puts "Error at SimpleCalculator.divide() - the parameter is not a Number".chomp
        elsif (num2 == 0)
            puts "Error at SimpleCalculator.divide() - division by zero occured".chomp
        else 
        return num1/num2
        end
    end

end




