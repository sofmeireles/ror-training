def production_per_hour(speed, rate)
    speed*221*rate
end

def choice(speed)
    case speed
    when 1..4
        puts "Production: #{production_per_hour(speed, 1)} cars per hour\n"
        puts "Working items: #{production_per_hour(speed, 1)/60}\n"
    when 5..8
        puts "Production: #{production_per_hour(speed, 0.9)} cars per hour\n"
        puts "Working items: #{production_per_hour(speed, 1)/60}\n"
    when 9
        puts "Production: #{production_per_hour(speed, 0.8)} cars per hour\n"
        puts "Working items: #{production_per_hour(speed, 1)/60}\n"
    when 10
        puts "Production: #{production_per_hour(speed, 0.77)} cars per hour\n"
        puts "Working items: #{production_per_hour(speed, 1)/60}\n"
    end
end

def menu
    choice = ''
    while choice != 'q'
        puts "\nEnter speed 1 - 10 or q to quit:"
        choice = gets.chomp
        choice(choice.to_i)
    end
end

menu