#splat operator
def find_needle_on_haystack(find, *haystack)

    if find == '|'
        puts "Here's the needle!"
        return
    else
        print "Gotta keep searching"

        Array.new(Random.rand(1..3),'.').concat(["\n"]).each do |searching|
            print searching
            sleep(0.5)
        end
        find_needle_on_haystack(*haystack)
    end
end

#haystack = ["~","~","~","~","~","~","~","~","|"]
#find_needle_on_haystack(*haystack)

def update_shopping_list(list, **new_items)
    duplicates = list.keys & new_items.keys
    if duplicates.length > 0
        puts "Duplicates found: #{duplicates.join('\n')}\n\n"
    end

    merged_list = {**list, **new_items}
    merged_list.each do |item, quantity|
        merged_list[item] = quantity + list[item] if duplicates.include?(item)
    end
end

shopping_list = {
    banana: 2,
    melon: 1,
    kiwi: 5,
    peach: 3
}

# shopping_list = update_shopping_list(shopping_list, passion_fruit: 5, banana: 3)
# shopping_list = update_shopping_list(shopping_list, a: 5, b: 3, c: 9, d: 10)

# puts "#{shopping_list}"


def am_i_happy(status, **why)
    puts "\n\n\nAm I Happy? #{status.upcase}. Why:\n\n"
    why.each do |num, message|
        puts "#{num}. #{message}"
    end
end

# am_i_happy("no", "1": "my belly hurts", "2": "i miss my couch", "3": "im sleepy", "4": "my eyes are fucked up")
# am_i_happy("yes", "1": "my order has arrived")



def generate_greeting(**kwargs)
    name = kwargs[:name] || "Anonymous"
    age = kwargs[:age]
    location = kwargs[:location]
  
    greeting = "Hello, #{name}!"
  
    if age
      greeting << " You are #{age} years old."
    end
  
    if location
      greeting << " You are from #{location}."
    end
  
    return greeting
  end
  
#   puts generate_greeting(name: "Alice", age: 30, location: "New York")
#   puts generate_greeting(name: "Bob", location: "Los Angeles")
#   puts generate_greeting(age: 25)

  

  def generate_greeting(data)
    name = data[:name] || "Anonymous"
    age = data[:age]
    location = data[:location]
  
    greeting = "Hello, #{name}!"
  
    if age
      greeting << " You are #{age} years old."
    end
  
    if location
      greeting << " You are from #{location}."
    end
  
    return greeting
  end

#   data = {name: "Alice", age: 30, location: "New York"}
#   puts generate_greeting(data)
  
def erro(**kwargs)
    message = kwargs[:message] || "Default error."
    status = kwargs[:status] || 500
    extra_info = kwargs[:extra_info]

    puts "\n\n\n-------------------------------------"
    puts "ERROR - #{status}: #{message}\n"
    puts "Extra info: #{extra_info}" if extra_info
    puts "-------------------------------------"

end

erro(message: "és burrinha")
erro(message: "troladinha!", status: 200)
erro(extra_info: "lelelelel")