require_relative './methods.rb'
# 2. Написать программу, которая начинается с чтения файла, -- КАКОГО?!??!?!

index(DB_PATH) # чтение файла

# Запросив у пользователя ввести свой возраст, программа должна
# найти в результатах чтения файла студента(-ов), чей возраст равен
# введенному числу и записать этого студента(-ов) в другой файл с
# названием results.txt. После чего перезапросить ввод.

puts "How old are you??\n"

age = gets.chomp #chomp убирает ошибку связаную с \n, если сравнивать это значение
                 # с другим, без .chomp сравнивает age == age\n, что очень очень интересно!??!?! 
                 # я потратил на это минут 20..

result = File.new('textFiles/result.txt', 'w')

age = age.to_s

found = findByPattern(age, DB_PATH) 
for info in found do 
    result.puts(info)
end
result.close


# Программа должна завершаться выводом на экран содержимого
# файла results.txt построчно при условии, что все студенты из
# первого файла были записаны во второй или если пользователь ввел
# с клавиатуры -1.

RESULT_PATH = 'textFiles/result.txt'
puts "enter '-1' to see the result file\n"
input = gets.to_i # если оставить просто gets, то руби посчитает что -1 != -1, 
                  # если поставить gets.to_s, он посчитает что -1 != -1
                  # хотя оператор "==" в динамических языках нормально сравнивает int и char
                  # это не руби это пёрл..

if (File.size(DB_PATH) == File.size(RESULT_PATH) || input == -1) 
    index(RESULT_PATH)
end