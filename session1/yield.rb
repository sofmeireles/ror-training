def jukebox
    return puts "Plug the jukebox you moron!" unless block_given?

    tracks = [
        "Gorillaz - Controllah",
        "Creepy Nuts - Bling-Bang-Bang-Born",
        "La Femme - Teatro Lucido"
    ]

    while tracks.length > 0
        puts "Available tracks:\n"
        puts "#{tracks.join("\n")}"
        puts "\nEnter track number 1 - #{tracks.length} or q to quit:"
        choice = gets.chomp
        break if choice == 'q'
        yield tracks.slice!(choice.to_i - 1)
    end
end

jukebox do |track|
    puts "\n\nPlaying at your request: #{track}\n\n"
    sleep(5)
end


jukebox