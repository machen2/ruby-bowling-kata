require "spec_helper"

RSpec.describe Project::Bowling do
    let(:game) { Project::Bowling.new }

    describe "basic scoring" do 
        it "can score a game if no pins are knocked down" do
            20.times { game.roll(0) }
            expect(game.score).to eq(0)
        end

        it "can score a game if one pin is knocked down each roll" do 
            20.times { game.roll(1) }
            expect(game.score).to eq(20)
        end
    end

    describe "bonus scoring" do 
        it "can score a game if there is a spare" do 
            game.roll(9)
            2.times { game.roll(1) } 
            17.times { game.roll(0)}
            expect(game.score).to eq(12)
        end

        it "only calculates a spare if it is a new frame" do 
            game.roll(3)
            game.roll(4)
            game.roll(6)
            game.roll(1)
            16.times { game.roll(0) }
            expect(game.score).to eq(14)
        end

        it "can score a game if there is a strike" do 
            game.roll(10)
            2.times { game.roll(1) }
            16.times { game.roll(0) }
            expect(game.score).to eq(14)
        end

        it "can score a perfect game" do 
            12.times { game.roll(10) }
            expect(game.score).to eq(300)
        end

        it "can score a game of all spares" do 
            21.times { game.roll(5) }
            expect(game.score).to eq(150)
        end

        it "can calculate a game with a strike then spare in tenth frame" do 
            18.times { game.roll(0) }
            game.roll(10)
            2.times { game.roll(5) }
            expect(game.score).to eq(20)
        end
    end
end