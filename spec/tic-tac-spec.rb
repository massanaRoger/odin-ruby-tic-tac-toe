require '../tic_tac.rb' 

describe Game do
  describe '#winner?' do
    context 'when top row is all same' do
      let(:player1) { Player.new('Roger', 'X') }
      let(:player2) { Player.new('Massana', 'O') }
      subject(:game) { Game.new(player1, player2) }

      it 'all X' do
        game.game_array[0] = 'X'
        game.game_array[1] = 'X'
        game.game_array[2] = 'X'
        expect(game.winner?(0, 0, 'X')).to be(true)
      end

      it 'all Y' do
        game.game_array[0] = 'Y'
        game.game_array[1] = 'Y'
        game.game_array[2] = 'Y'
        expect(game.winner?(0, 0, 'Y')).to be(true)
      end

      it 'not all X' do
        game.game_array[0] = 'Y'
        game.game_array[1] = 'X'
        game.game_array[2] = 'X'
        expect(game.winner?(0, 0, 'X')).not_to be(true)
      end
    end

    context 'when diagonal is all same' do
      let(:player1) { Player.new('Roger', 'X') }
      let(:player2) { Player.new('Massana', 'O') }
      subject(:game) { Game.new(player1, player2) }

      it 'all X' do
        game.game_array[0] = 'X'
        game.game_array[4] = 'X'
        game.game_array[8] = 'X'
        expect(game.winner?(0, 0, 'X')).to be(true)
      end

      it 'all Y reverse' do
        game.game_array[2] = 'Y'
        game.game_array[4] = 'Y'
        game.game_array[6] = 'Y'
        expect(game.winner?(0, 2, 'Y')).to be(true)
      end

      it 'not all X reverse' do
        game.game_array[2] = 'Y'
        game.game_array[4] = 'Y'
        game.game_array[6] = 'X'
        expect(game.winner?(0, 2, 'Y')).not_to be(true)
      end
    end
  end

  describe '#update_array' do
    let(:player1) { Player.new('Roger', 'X') }
    let(:player2) { Player.new('Massana', 'O') }
    subject(:game) { Game.new(player1, player2) }

    it 'is %' do
      game.update_array(0, 0, 'X')
      expect(game.game_array[0]).to eq('X')
    end

    it 'is not %' do
      game.game_array[0] = 'X'
      game.update_array(0, 0, 'Y')
      expect(game.game_array[0]).to eq('X')
    end
  end
end
