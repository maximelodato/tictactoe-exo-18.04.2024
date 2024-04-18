require_relative '../lib/tictactoe'
require_relative '../board_case'
require_relative '../board'
require_relative '../player'
require_relative '../game'

RSpec.describe 'Tic Tac Toe Game' do
  describe BoardCase do
    subject { BoardCase.new(1) }

    it 'initializes with a value of " "' do
      expect(subject.value).to eq(" ")
    end

    it 'initializes with a number' do
      expect(subject.number).to eq(1)
    end
  end

  describe Board do
    subject { Board.new }

    it 'creates 9 instances of BoardCase' do
      expect(subject.cases.length).to eq(9)
      expect(subject.cases.values).to all(be_a(BoardCase))
    end

    it 'converts A1 to position 1' do
      expect(subject.convert_position("A1")).to eq(1)
    end

    it 'converts C3 to position 9' do
      expect(subject.convert_position("C3")).to eq(9)
    end

    it 'is not full initially' do
      expect(subject.full?).to be_falsey
    end

    it 'can detect a full board' do
      subject.cases.each { |_, c| c.value = 'X' }
      expect(subject.full?).to be_truthy
    end

    it 'detects no victory initially' do
      expect(subject.victory?).to be_falsey
    end
  end

  describe Player do
    subject { Player.new("Max", "X") }

    it 'is initialized with a name and symbol' do
      expect(subject.name).to eq("Max")
      expect(subject.symbol).to eq("X")
    end
  end

  describe Game do
    subject { Game.new }

    before do
      allow($stdout).to receive(:write)  # Suppresses console output
    end

    it 'initializes with two players' do
      expect(subject.players.length).to eq(2)
      expect(subject.players.map(&:symbol)).to contain_exactly("X", "O")
    end

    it 'starts with a status of "en cours"' do
      expect(subject.status).to eq("en cours")
    end
  end
end
