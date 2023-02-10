# Написать метод array_x2, который принимает в качестве аргумента массив чисел и возвращает массив, элементы которого вдвое больше элементов оригинального массива.
# Предусмотреть следующие сценарии
# 1.	Массив не содержит элементов - вывести сообщение о том, что мас-сив пустой
# 2.	Массив содержит не только целочисленные элементы - исключить в результирующем массиве все элементы кроме целочисленных, выве-сти результат только с ними
# 3.	Массив не содержит целочисленные элементы - вывести сообщение, о невозможности обработать запрос
# Отчёт можно сдавать в свободной форме в Moodle

def array_x2(arr)
    goodArr = []
    if arr.empty? 
        puts "array is empty"
    else
    arr.each do |number|
        if number.is_a? Integer
        goodArr.push(number*2)
        end
        end
    end 
    if (goodArr.empty?)  
        puts "ERROR: Cannot process the request"
    end
    return goodArr;
end

arrEmpty = []
arrGood = [1,2,3,4,5,6,7,8,9]
arrBad = [1.1,2.3,2.333,23.2,222.22,1.2]
arrHalfBad = [1,2,3.2,3,2.44,6.2,5,6,7.22,7]
puts array_x2(arrEmpty)
puts "\nGood array: \n"
puts array_x2(arrGood)
puts "\nHalfBadArray: \n"
puts array_x2(arrHalfBad)
puts "\nBad Array: \n"
puts array_x2(arrBad)