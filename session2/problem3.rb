module Health
    attr_reader :hp

    def initialize_health
        @hp = 100
    end

    def be_attacked
        @hp = @hp - Random.rand(25..110)
    end

    def rest 
        puts "Zzzzzzz.... Zzzzzz.... Zzzzz...."
        @hp += Random.rand(1..10)
        @hp = 100 if @hp > 100
    end
    
end

class Animal
    include Health

    attr_reader :name
    attr_accessor :alive

    DEFAULT_NOISE = "grrrrrrr"
    ACTIONS = [:eat, :poop, :make_a_noise, :sleep, :attack]

    def initialize(name)
        initialize_health
        @name = name
        @alive = true
    end

    def eat 
        puts "#{@name} is eating: nhmamm nhmmam"
    end

    def poop
        puts "#{@name} is pooping 💩💩💩"
    end

    def make_a_noise
        puts "#{@name} makes a noise: #{DEFAULT_NOISE}"
    end

    def sleep
        hp = rest
        puts "#{@name} is sleeping. Mimimimi mimimimi.... [HP: #{hp}]"
    end

    def attack(victim)
        victim_hp = victim.be_attacked
        victim.alive = false if victim_hp < 0
        puts "#{@name} attacked #{victim.name} [HP: #{victim_hp}]"
    end    

    def actions
        self.class::ACTIONS
    end
end

module Birds
    class Parrot < Animal
        ACTIONS =  Animal::ACTIONS + [:be_annoying, :dance]

        def be_annoying
            puts "#{@name} is being annoying 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨"
        end

        def make_a_noise
            puts "#{@name} makes a noise: PACOOOOOOOOOOOÓ"
        end

        def dance
            puts "#{@name} is dancing 💃🕺"
        end
    end

    class Duck < Animal
        ACTIONS =  Animal::ACTIONS + [:swim, :fly] 

        def swim
            puts "#{@name} is swimming 🌊🌊"
        end

        def make_a_noise
            puts "#{@name} makes a noise: quak quak"
        end

        def fly
            puts "#{@name} is flying 🦆"
        end
    end
end


animals = [
    Birds::Parrot.new("Parrot"),
    Birds::Duck.new("Duck"),
    Animal.new("Ganso"),
    Animal.new("Monkey")
  ]
  

20.times do
animal = animals.sample
if animal.alive
    action =  animal.actions.sample
    if action == :attack
        target = animals.reject { |a| a == animal || !a.alive }.sample
        animal.attack(target)
    else
        animal.send(action)
    end
else
    puts "#{animal.name} is dead."
end
sleep(1)
end