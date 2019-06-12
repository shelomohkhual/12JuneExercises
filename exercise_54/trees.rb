require "byebug"
#===================== FRUIT-TREE ======================
class FruitTree
    attr_accessor :height,:age,:max_height,:growth_rate,:death,:maturity,:fruit,:fruit_yield
    def initialize
        @height = 0
        @age = 0
        @max_height = 0
        @growth_rate = 0
        @death = 0
        @maturity = 0
        @fruit = []
        @fruit_yield = 0
    end
    def age!
        @age += 1 
        if @height < @max_height
            @height += @growth_rate
        end
        if @age > @maturity
            @fruit_yield.times do |fruit|
                fruit = Fruit.new
                @fruit << fruit
            end      
        end
    end
    def any_fruits?
        @fruit.length > 0 ? true : false 
    end
    def dead?
        @age > @death ? true : false
    end
    def pick_an_fruit!
        @fruit.pop
    end
end
#===================== ORANGE ==========================
# class OrangeTree < FruitTree
#     def initialize
#         @orange = []
#     end
#     def age!
#         if @age < 30
#             @age += 1
#             @height += rand(80..120)
#             rand(700..1250).times do |o|
#             o = Orange.new
#             @orange << o
#             end
#         else @age += 1
#         end
#     end
#     def any_oranges?
#         @orange.length > 0 ? true : false end

#     def dead?
#         @age > 25 ? true : false end

#     def pick_an_orange!
#         @orange.pop end

# end

# class Orange
#     # Initializes a new Orange with diameter +diameter+
#     attr_accessor :diamater
#     def initialize
#         @diamater = rand(20..50)
#     end

#     tree = OrangeTree.new

#     tree.age! until tree.any_oranges?

#     puts "Tree is #{tree.age} years old and #{tree.height} cm tall"
#     until tree.dead?
#         basket = []

#         #It places the oranges in the basket
#         #IT PLACES THE ORANGES IN THE basket

#         while tree.any_oranges?
#             basket << tree.pick_an_orange!
#         end

#         avg_diameter = # It's up to you to calculate the average diameter for this harvest.

#         puts "Year #{tree.age} Report"
#         puts "Tree height: #{tree.height/100.0} m"
#         puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} cm"
#         puts ""

#         #Age the tree another year
#         tree.age!
#     end
# end
# puts "Alas, Orange tree, she is dead!"

#===================== APPLE ==========================
 class AppleTree < FruitTree
    attr_accessor :max_height,:growth_rate,:fruit_yield,:maturity,:death,:fruit,:age,:height
    def initialize
        @max_height = 26
        @growth_rate = 2
        @fruit_yield = rand(400..600)
        @maturity = 5
        @death = 45
        @fruit = []
        @age=0
        @height = 0
    end
    def age!
        super
    end
    def any_fruits?
        super
    end
    def dead!
        super
    end
    def pick_an_fruit!
        super
    end
end

#===================== Fruit ==========================
class Fruit
    trees = [AppleTree,OrangeTree,PearTree]
    trees.each do |name|
        type = name.chomp(Tree)
        tree=name.new
    end
    
    # tree = AppleTree.new
    tree.age! until tree.any_fruits?
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "                #{type.upcase} TREE                               "
        puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        puts "Tree is #{tree.age} years old and (#{tree.height})cm tall"
        until tree.dead?
        basket = []
        
        while tree.any_fruits?
            basket << tree.pick_an_fruit!
        end

        avg_diameter = # It's up to you to calculate the average diameter for this harvest.

        puts "#{type} Tree : Year #{tree.age} Report"
        puts "#{type} Tree : height: #{tree.height/100.0} m"
        puts "Harvest: #{basket.size} #{type} with an average diameter of #{avg_diameter} cm"
        puts ""

        #Age the tree another year
        tree.age!
    end
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "        Alas, The #{type} tree, she is dead!"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

end

class Apple < Fruit
    attr_accessor :diamater,
    def initialize
        @diamater = rand(20..40)
    end
    fruit = "Apple"
    def tree(fruit)
        super
    end
end