class Project::Bowling
    def initialize
        @rolls = []
        @total_points = 0
    end

    def roll(pins)
        @rolls << pins
    end

    def score
        @rolls.each_with_index do |roll, index|
            if !is_last_roll?(index) && is_spare?(roll, index)
                calculate_spare_bonus(roll, index)
                break if is_bonus_frame?(index)
            elsif roll == 10
                calculate_strike_bonus(roll, index)
                break if is_bonus_frame?(index)                
            end
            @total_points += roll
        end
        @total_points
    end

    private

    def calculate_spare_bonus(roll, index)
        @total_points += @rolls[index+2]
        @total_points += roll + @rolls[index+1] if is_bonus_frame?(index)
    end

    def calculate_strike_bonus(roll, index)
        @total_points += @rolls[index+1] + @rolls[index+2]
        @total_points += roll if is_bonus_frame?(index)
    end

    def is_bonus_frame?(index)
        index == @rolls.length-3
    end
    
    def is_last_roll?(index)
        index == @rolls.length-1
    end

    def is_new_frame?(index)
        index % 2 == 0
    end

    def is_spare?(roll, index)
        is_new_frame?(index) && roll + @rolls[index+1] == 10 
    end
end