require_relative 'tictactoe'

RSpec.describe BoardCase do
  let(:board_case) { BoardCase.new(1) }

  describe "#initialize" do
    it "creates a BoardCase object with the correct initial values" do
      expect(board_case.value).to eq(" ")
      expect(board_case.number).to eq(1)
    end
  end
end

RSpec.describe Board do
  let(:board) { Board.new }

  describe "#initialize" do
    it "creates a Board object with the correct initial values" do
      expect(board.cases.size).to eq(9)
    end
  end

  describe "#convert_position" do
    it "converts the position from letter-number format to index" do
      expect(board.convert_position("A1")).to eq(1)
      expect(board.convert_position("B2")).to eq(5)
      expect(board.convert_position("C3")).to eq(9)
    end
  end

  # Add more tests for other methods as needed
end

RSpec.describe Player do
  let(:player) { Player.new("John", "X") }

  describe "#initialize" do
    it "creates a Player object with the correct initial values" do
      expect(player.name).to eq("John")
      expect(player.symbol).to eq("X")
    end
  end
end

RSpec.describe Game do
  let(:game) { Game.new }

  describe "#initialize" do
    it "creates a Game object with the correct initial values" do
      expect(game.players.size).to eq(2)
      expect(game.current_player).to eq(game.players[0])
      expect(game.status).to eq("en cours")
    end
  end

  # Add more tests for other methods as needed
end

# Add tests for Show and Application classes if needed
