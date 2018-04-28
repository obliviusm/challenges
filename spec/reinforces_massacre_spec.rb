require_relative '../reinforces_massacre.rb';

RSpec.describe ReinforcesMassacre do
  context '.alphabet_war' do
    it 'small war' do
      reinforces = ["abcdefg", "hijklmn"];
      airstrikes = ["   *   ", "*  *   "];
      battlefield = subject.alphabet_war(reinforces, airstrikes)
      expect(battlefield).to eq "hi___fg"
    end

    it 'big war' do
      reinforces = [
        "g964xxxxxxxx",
        "myjinxin2015",
        "steffenvogel",
        "smile67xxxxx",
        "giacomosorbi",
        "freywarxxxxx",
        "bkaesxxxxxxx",
        "vadimbxxxxxx",
        "zozofouchtra",
        "colbydauphxx"
      ]
      airstrikes = [
        "* *** ** ***",
        " ** * * * **",
        " * *** * ***",
        " **  * * ** ",
        "* ** *   ***",
        "***   ",
        "**",
        "*",
        "*"
      ]
      battlefield = subject.alphabet_war(reinforces, airstrikes)
      expect(battlefield).to eq "codewarsxxxx"
    end
  end

  context '.get_reinforces to buttlefield' do
    it 'from first line' do
      reinforces = ["h__kl_n", "op_stuv"]
      battlefield, reinforces = subject.get_reinforces("a___efg", reinforces)
      expect(battlefield).to eq "ap_kefg"
      expect(reinforces).to eq ["h___l_n", "o__stuv"]
    end
  end

  context '.get_place_reinforces to one spot' do
    it 'from first line' do
      reinforces = ["hijklmn", "abcdefg"]
      place, reinforces = subject.get_place_reinforces(2, reinforces)
      expect(place).to eq "j"
      expect(reinforces).to eq ["hi_klmn", "abcdefg"]
    end

    it 'from second line' do
      reinforces = ["hi__lmn", "abcdefg"]
      place, reinforces = subject.get_place_reinforces(2, reinforces)
      expect(place).to eq "c"
      expect(reinforces).to eq ["hi__lmn", "ab_defg"]
    end

    it 'if no reinforce available' do
      reinforces = ["hi__lmn", "ab__efg"]
      place, reinforces = subject.get_place_reinforces(2, reinforces)
      expect(place).to eq "_"
      expect(reinforces).to eq ["hi__lmn", "ab__efg"]
    end
  end

  context '.do_airstrike kills forces on battlefield' do
    it 'one bomb' do
      battlefield = subject.do_airstrike("abcdefg", "   *   ")
      expect(battlefield).to eq "ab___fg"
    end

    it 'two bombs' do
      battlefield = subject.do_airstrike("abcdefg", "* *    ")
      expect(battlefield).to eq "____efg"
    end
  end

  context '.get_kill_zone converts airstrike to kill zone' do
    it 'one bomb' do
      kill_zone = subject.get_kill_zone("   *   ")
      expect(kill_zone).to eq "  ___  "
    end

    it 'one bomb at the start' do
      kill_zone = subject.get_kill_zone("*      ")
      expect(kill_zone).to eq "__     "
    end

    it 'one bomb at the end' do
      kill_zone = subject.get_kill_zone("      *")
      expect(kill_zone).to eq "     __"
    end

    it 'two bombs' do
      kill_zone = subject.get_kill_zone("* *    ")
      expect(kill_zone).to eq "____   "
    end
  end
end
