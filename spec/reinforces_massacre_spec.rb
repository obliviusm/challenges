require_relative '../reinforces_massacre.rb';

RSpec.describe ReinforcesMassacre do
  context '.do_airstrike' do
    it 'strikes' do

    end
  end

  context '.get_kill_zone converts airstrike to kill zone' do
    it 'one bomb' do
      kill_zone = ReinforcesMassacre.get_kill_zone("   *   ")
      expect(kill_zone).to eq "  ___  "
    end

    it 'one bomb at the start' do
      kill_zone = ReinforcesMassacre.get_kill_zone("*      ")
      expect(kill_zone).to eq "__     "
    end

    it 'one bomb at the end' do
      kill_zone = ReinforcesMassacre.get_kill_zone("      *")
      expect(kill_zone).to eq "     __"
    end

    it 'two bombs' do
      kill_zone = ReinforcesMassacre.get_kill_zone("* *    ")
      expect(kill_zone).to eq "____   "
    end
  end
end
