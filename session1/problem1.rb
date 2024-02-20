class BirdWatcher
    def initialize
        @week_counts = [0, 2, 5, 3, 7, 8, 4]
    end

    def week_counts
        @week_counts
    end

    def yesterday_counts
        @week_counts.last
    end

    def total_counts
        @week_counts.sum
    end

    def more_than_five
        @week_counts.inject do |mem, count|
            count > 5 ? mem +=1 : mem
        end
    end

    def days_without_birds
        @week_counts.each do |count|
            return true if count == 0
        end
        false
    end
end

def start
    bird_watcher = BirdWatcher.new

    puts "\n\nBIRD WATCHER\n\n"
    puts "Week counts: #{bird_watcher.week_counts}\n"
    puts "Yesterday counts: #{bird_watcher.yesterday_counts}\n"
    puts "Total counts: #{bird_watcher.total_counts}\n"
    puts "More than five counts: #{bird_watcher.more_than_five}\n"
    puts "Days without birds?: #{bird_watcher.days_without_birds}\n"    
end


start