require 'rails_helper'

describe Bet do
  describe '#is_protected?' do
    let(:perform) { bet.is_taken? }

    context 'bet is taken' do
      let(:bet) { create(:bet, :taken)}

      it { expect(perform).to be_truthy }
    end
  end

  describe '#is_done?' do
    let(:perform) { bet.is_done? }

    context 'bet is done' do
      let(:bet) {create(:bet, :done)}

      it { expect(perform).to be_truthy }
    end
  end

  describe '#can_be_accepted_by?' do
    let(:creator) { create(:user) }
    let(:other_user) { create(:user)}
    let(:bet) { create(:bet) }

    context 'user is owner of the bet' do
      context 'state is waiting for challenger' do
        let(:bet) { create(:bet, creator_user_id: creator.id, state: 'Waiting for challenger')}

        it 'returns false' do
          expect(bet.can_be_accepted_by?(creator)).to be_falsey
        end
      end

      context 'state is waiting for challenger' do
        let(:bet) { create(:bet, creator_user_id: creator.id, state: 'is different')}

        it 'returns false' do
          expect(bet.can_be_accepted_by?(creator)).to be_falsey
        end
      end
    end

    context 'user is not owner of the bet' do
      context 'state is waiting for challenger' do
        let(:bet) { create(:bet, creator_user_id: other_user.id, state: 'Waiting for challenger')}
        it 'returns true' do
          expect(bet.can_be_accepted_by?(creator)).to be_truthy
        end
      end

      context 'state is not waiting for challenger' do
        let(:bet) { create(:bet, creator_user_id: other_user.id, state: 'is different')}
        it 'returns false' do
          expect(bet.can_be_accepted_by?(creator)).to be_falsey
        end
      end
    end
  end
end