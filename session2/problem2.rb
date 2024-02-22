class Utilities
    def number_of_files(file_system)
        file_system.flatten.size
    end
    
    #this did not work because it only found the first nested array
    def not_working_search(file_system, file_name, path = [])
        case file_system
        in [*, ^file_name, *]
            return (path + [file_name]).join('/')
        in [*, Array => directory, *]
            result = not_working_search(directory, file_name, path + [directory.first])
            return result if result
        else
            nil
        end
    end

    #allowing sub-sub folders
    def search(file_system, file_name, path = [])
        file_system.each do |elem|
            case elem
            in ^file_name
                return (path + [file_name]).join('/')
            in Array => directory
                directory_name, *files = directory
                result = search(directory, file_name, path + [directory_name])
                return result if result
            else
                nil
            end
        end
        nil
    end


    #traditional if else
    def search2(file_system, file_name, path = [])
        file_system.each do |elem|
          if elem.is_a?(Array)
            directory_name, *files = elem
            result = search2(files, file_name, path + [directory_name])
            return result if result
          elsif elem == file_name
            return (path + [file_name]).join('/')
          end
        end
        nil
    end


    def filter(file_system, extension, path = [])
        files_found = [] 
        file_system.each do |elem|
            case elem
            in String => file_name if file_name.end_with?(".#{extension}")
                files_found << (path + [file_name]).join('/')
            in Array => directory
                directory_name, *files = directory
                result = filter(directory, extension, path + [directory_name])
                files_found << result if result
            else
                nil
            end
        end
        files_found
      end
end

file_system =[
    "README.txt",
    ["images", "photo.jpg", "logo.png", "photo1.png"],
    "main.rb",
    ["src",["modules", "hihi.png", ["slay", "slay.png"]], "user.rb", "helper.rb"],
    "data.json",
    "haha.png",
    "hmm"
]

utilities = Utilities.new

#search
items_to_search = [ "data.json","photo.jpg", "helper.rb", "no.no", "hihi.png", "hmm", "slay.png"]

items_to_search.each do |item|
    path = utilities.search(file_system,item) || "No path found"
    puts "#{item} - #{path}"
end

#filter by extension
puts utilities.filter(file_system, "png")
