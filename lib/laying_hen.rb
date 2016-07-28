class LayingHen
  
  def initialize
    @age = 0
    @eggs = []
    @hatched_hours = 0
  end

  def age!
  # Ages the hen one month, and lays 4 eggs if the hen is older than 3 months
    @age =+ 1
    if @age >= 3
      4.times do 
      @eggs <<  Egg.new
      end
    end
    p @eggs
  end 

  def any_eggs?
    # Returns true if the hen has laid any eggs, false otherwise
    if @eggs > 0
      true
    else
      false
    end

  end

  def pick_an_egg!
    raise NoEggsError, "Te hen has not layed any eggs" unless self.any_eggs?
    # egg pick logic goes here
    return @egg.slice!(0)
  end

  def old?
    # Returns true if the hen can't lay eggs anymore because of its age, false otherwise
    # The max age for a hen to lat eggs is 10
    if self.age <= 10
      true
    else
      false
    end

  end

  def increase_hatched_hour(hours)
    @hatched_hours + hours
  end
end

class Egg

  def initialize
    # initializes a new Egg with hatched hours +hatched_hours+
    @hatched_hours = 0
  end

  def rotten?
    # Returns true if hatched hours is greater than 3, false otherwise
    if @hatched_hours > 3
      true
    else
      false
    end

  end

end

hen = LayingHen.new
basket = []
rotten_eggs = 0

hen.age! until hen.any_eggs?

puts "Hen is #{hen.age} months old, its starting to lay eggs."
puts ""

until hen.old?

  # The time we take to pick up the eggs
  hours = rand(5)
  hen.increase_hatched_hour(hours)

  while hen.any_eggs?
    egg = hen.pick_an_egg!

    if egg.rotten?
      rotten_eggs += 1
    else
      basket << egg
    end
  end

  puts "Month #{hen.age} Report"
  puts "We took #{hours} hour(s) to pick the eggs"
  puts "Eggs in the basket: #{basket.size}"
  puts "Rotten eggs: #{rotten_eggs}"
  puts ""

  # Age the hen another month
  hen.age!
end

puts "The hen is old, she can't laid more eggs!"
puts "The hen laid #{basket.size + rotten_eggs} eggs"
if rotten_eggs == 0
  puts "CONGRATULATIONS NO ROTTEN EGGS" 
else
  puts "We pick to late #{rotten_eggs} eggs so they become rotten"
end