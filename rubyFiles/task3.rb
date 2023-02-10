require_relative './methods.rb'

# 3. Написать программу, которая начинается с чтения банковского
# баланса клиента из файла с именем balance.txt, содержащего одну
# строку со стартовым балансом клиента. Если файла не
# существует, используется стартовый баланс 100.0, который
# должен быть константой.

BALANCE_PATH = "textFiles/balance.txt"
BASE_SUM = 100

if !File.exist?(BALANCE_PATH) then
    balance = File.new(BALANCE_PATH, "w")
    balance.puts(BASE_SUM)
    puts "\nTOTAL AMOUNT:"
    index(BALANCE_PATH)
    puts "\n"
else
    puts "\nTOTAL AMOUNT:"
    index(BALANCE_PATH)
    puts "\n"
end


# После этого программа должна предложить клиенту внести деньги,
# вывести деньги, проверить баланс или выйти, используя буквы D
# (deposit), W (withdraw), B (balance) и Q (quit). 

quit = false
puts "WELCOME TO OUT BANKING TERMINAL\n"

while !quit do
    puts "Press D to deposit\n"
    puts "Press W to withdraw\n"
    puts "Press B to see your balance\n"
    puts "Press Q to quit\n"

    # Программа должна
    # принимать на вход значения в верхнем или нижнем регистре.
    input = gets.chomp.to_s.downcase

    case input
    when "d"
        #Для депозитов (D) программа должна подсказывать сумму. 
        puts "Please choose the amount to deposit:\n"
        puts "1 , 5, 10, 50, 100, 200, 500\n"
        depositInput = gets.chomp.to_i
        case depositInput
            when 1..300000
                if depositInput < 0
                    puts "Deposit invalid: must be more than zero\n"
                    puts depositInput
                end
                if depositInput > 300000
                    puts "Deposit invalid: 300,000 is the maximum deposit value"
                end
                if depositInput <= 300000
                    currentAmount = findById(0, BALANCE_PATH)
                    update(0,currentAmount.to_i + depositInput, BALANCE_PATH)
                    puts "\nDepositing #{depositInput}"
                    puts "\nCurrent Balance:"
                    index(BALANCE_PATH)
                    puts "\n"

                end
            else
            puts "#{depositInput} -- You've Entered a Non-Valid input\n"
        end  
    when "w"
        puts "\nTOTAL AMOUNT:"
        index(BALANCE_PATH)
        puts "Please choose the amount to withdraw:\n"
        puts "1 , 5, 10, 50, 100, 200, 500, max: 100,000\n"

        withdrawInput = gets.chomp.to_i
        currentAmount = findById(0, BALANCE_PATH).to_i
        case withdrawInput
        when 1..100000
            if withdrawInput < 0
                puts "Deposit invalid: must be more than zero\n"
                puts depositInput
            end
            if withdrawInput > currentAmount
                puts "Withdraw invalid: #{currentAmount} is the maximum withdraw value"
            end
            if withdrawInput < currentAmount && withdrawInput > 0
                update(0,currentAmount.to_i - withdrawInput, BALANCE_PATH)
                puts "\nYou withdrew #{withdrawInput}"
                puts "\nCurrent Balance:"
                index(BALANCE_PATH)
                puts "\n"

            end
        else
        puts "#{withdrawInput} -- You've Entered a Non-Valid input\n"
    end  

    when "b"
        puts "\nCurrent Balance:"
        index(BALANCE_PATH)
        puts "\n"
    when "q"
      quit = true
    else
      puts "#{input} -- Is NOT a Valid Input"
    end

end



# Сумма должна быть больше нуля. Если сумма действительна, программа
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