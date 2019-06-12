# ======================================================= RecodeBakery =============================================================
class RecodeBakery
    attr_accessor :kookies_to_bake,
    def initalize(type,size,baking_time,kookies_to_bake)
        @kookies_type == Hash.new{|type,size|type[size]=[]}
        @kookies_to_bake = Hash.new{|type,qty|type[qty]=qty}
    end
    # Methods
end
# ======================================================= Kookies ==================================================================
class Kookies < RecodeBakery
    attr_accessor  :type, :size, :baking_time
    def initalize
        @type = type
        @size = size
        @bakingtime = baking_time
    end
    # Methods
    def kookies_type(type, size, time)
        @kookies_type[type] = [size, time] end

    def kookies_to_bake(type,qty)
        @kookies_to_bake[type] = qty end
end
# ======================================================= Oven =====================================================================
class Oven < RecodeBakery
    attr_accessor :tray_size, :timer
    def initalize(tray_size=20,timer)
        @tray_size = tray_size
        @timer = timer
    end
    # Methods
    def timer(timer)
        @timer = timer end

    def tray_size
        @tray_size = tray end
    
    # def oven_done?
    #     @timer == 0 ? true : false end

    def status
        @kookies_type.each do |type,time|
            time = time[1] 
            if time == @timer
                return "#{type} Kookie is READY!!"
            elsif time > @timer
                if time - @timer >= 2
                    return "#{type} Kookie is DOUGHY!!"
                else
                    return "#{type} Kookie is Almost READY!!"
                end
            else
                return "#{type} Kookie is BURNT!!"
            end
        end
    end
end
# ======================================================= END ======================================================================
puts "~~~~~~~~~~~~~"
puts "RECODE-BAKERY"
puts "~~~~~~~~~~~~~"
puts "How many type of Kookie to Baked?"
num_type=gets.chomp.to_i
puts

num_type.times do |num|
    puts "Enter the (#{num+1})Kookies's Type/Name"
    type=gets.chomp.to_s
    puts "Enter #{type} Kookie's Size(mm)"
    size=gets.chomp.to_i
    puts "Enter #{type} Kookie's Baking Time"
    time=gets.chomp.to_i
    puts "How many #{type} Kookie to Baked?"
    qty=gets.chomp.to_i
    puts
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    kookies=Kookies.new
    kookies.kookies_type(type, size, time)
    kookies.kookies_to_bake(type,qty)
end
puts "Set Timer to Baked all of the kookies in mins"
Oven.timer(gets.chomp.to_i)


puts oven.status(kookies.kookies_type)