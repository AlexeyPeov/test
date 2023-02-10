# 1. Написать набор методов для работы с файлом:



DB_PATH = 'db.txt'
TEMP = 'temp.txt'


# ○ index - выводит все строки;
def index (index)
    puts File.open(index).read.split("\n")
end

# ○ find(id) - находит конкретную строку в файле и выводит ее;
def findById(id)
    currentLine = 1
    db = File.open("db.txt").read
    db.each_line do |line|
    return line if id == currentLine
    currentLine+=1
   end
end

# ○ where(pattern) - находит все строки, где есть указанный паттерн;
def findByPattern(pattern)
    arr = []
    db = File.open("db.txt").read
    db.each_line do |line|
        found = false
        
        if pattern.split.count > 1 then
            numberOfElements = pattern.split.count
            matches = 0
            for key in line.split do
                for value in pattern.split do
                    if key == value then
                        matches += 1 
                    end
                end
            end
            if numberOfElements == matches  then
                found = true 
            end
        else 
            for key in line.split do
                if key == pattern then
                     found = true
                end
            end
        end
        
        if found == true then
            arr.push(line) 
        end
    end

    return arr
end


# ○ update(id, text) - обновляет конкретную строку файла;
def update(id,text)
    file = File.new('temp.txt', 'w')
    File.foreach(DB_PATH).with_index do |person, index|
    file.puts(id == index ? text : person)
    end
    file.close
    File.write(DB_PATH, File.read(TEMP))
    File.delete(TEMP) if File.exist?(TEMP)
end


# ○ delete(id) - удаляет строку;
def deleteById(id)
    file = File.new('temp.txt', 'w')
    File.foreach(DB_PATH).with_index do |person, index|
    file.puts(id == index ? text : person) if index != id
    end
    file.close
    File.write(DB_PATH, File.read(TEMP))
    File.delete(TEMP) if File.exist?(TEMP)
end

#deleteById(0)




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

result = File.new('result.txt', 'w')

age = age.to_s

found = findByPattern(age) 
for info in found do 
    result.puts(info)
end
result.close


# Программа должна завершаться выводом на экран содержимого
# файла results.txt построчно при условии, что все студенты из
# первого файла были записаны во второй или если пользователь ввел
# с клавиатуры -1.

RESULT_PATH = 'result.txt'
puts "enter '-1' to see the result file\n"
input = gets.to_i # если оставить просто gets, то руби посчитает что -1 != -1, 
                  # если поставить gets.to_s, он посчитает что -1 != -1
                  # хотя оператор "==" в динамических языках нормально сравнивает int и char
                  # это не руби это пёрл..

if (File.size(DB_PATH) == File.size(RESULT_PATH) || input == -1) 
    index(RESULT_PATH)
end

# 3. Написать программу, которая начинается с чтения банковского
# баланса клиента из файла с именем balance.txt, содержащего одну
# строку со стартовым балансом клиента. Если файла не
# существует, используется стартовый баланс 100.0, который
# должен быть константой.


# После этого программа должна предложить клиенту внести деньги,
# вывести деньги, проверить баланс или выйти, используя буквы D
# (deposit), W (withdraw), B (balance) и Q (quit). 

# Программа должна
# принимать на вход значения в верхнем или нижнем регистре. Для
# депозитов (D) программа должна подсказывать сумму. Сумма
# должна быть больше нуля. Если сумма действительна, программа
# добавляет сумму депозита к балансу клиента и отображает новый
# баланс.
# При снятии средств (W) программа должна выдать запрос, в
# котором необходимо указать сумму. Сумма должна быть больше
# нуля и меньше или равна текущему балансу. Если сумма
# корректна, программа вычитает сумму вывода из баланса клиента
# и
# отображает новый баланс.
# При проверке баланса (B) программа должна вывести текущий
# баланс.
# Если клиент решит выйти из программы (Q), программа должна
# записать текущий баланс обратно в файл balance.txt.
# В случае неправильного ввода (команда или сумма), программа
# должна выдать соответствующее сообщение об ошибке, которое
# сообщит клиенту, как ее исправить. Нельзя просто выводить error