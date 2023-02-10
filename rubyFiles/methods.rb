# 1. Написать набор методов для работы с файлом:
DB_PATH = 'textFiles/db.txt'
TEMP = 'textFiles/temp.txt'


# ○ index - выводит все строки;
def index (index)
    puts File.open(index).read.split("\n")
end

# ○ find(id) - находит конкретную строку в файле и выводит ее;
def findById(id, path)
    currentLine = 1
    db = File.open(path).read
    db.each_line do |line|
    return line if id == currentLine
    currentLine+=1
   end
end

# ○ where(pattern) - находит все строки, где есть указанный паттерн;
def findByPattern(pattern, path)
    arr = []
    db = File.open(path).read
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
def update(id,text, path)
    file = File.new('textFiles/temp.txt', 'w')
    File.foreach(path).with_index do |person, index|
    file.puts(id == index ? text : person)
    end
    file.close
    File.write(path, File.read(TEMP))
    File.delete(TEMP) if File.exist?(TEMP)
end


# ○ delete(id) - удаляет строку;
def deleteById(id, path)
    file = File.new('temp.txt', 'w')
    File.foreach(path).with_index do |person, index|
    file.puts(id == index ? text : person) if index != id
    end
    file.close
    File.write(path, File.read(TEMP))
    File.delete(TEMP) if File.exist?(TEMP)
end