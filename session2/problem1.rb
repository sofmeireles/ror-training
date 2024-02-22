def normal_line(first, *list)
    return if list.length < 1

    puts "For want of a #{first} the #{list.first} was lost."
    normal_line(*list)
end

def proverb(list)
    normal_line(*list)
    puts("And all for the want of a #{list.first}.")
end

proverb(["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"])


