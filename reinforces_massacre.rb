# http://www.codewars.com/kata/alphabet-wars-reinforces-massacre

module ReinforcesMassacre
  def self.get_kill_zone(airstrike)
    kill_zone_arr = Array.new(airstrike.size, ' ')
    airstrike.split('').each_with_index do |place, index|
      if place == '*'
        kill_zone_arr[index - 1] = '_' if index - 1 >= 0
        kill_zone_arr[index + 1] = '_' if index + 1 < kill_zone_arr.size
        kill_zone_arr[index] = '_'
      end
    end
    kill_zone_arr.join ''
  end

  def self.do_airstrike(battlefield, airstrike)
    kill_zone = self.get_kill_zone(airstrike)
  end

  def self.alphabet_war(reinforces, airstrikes)
    self.do_airstrike(reinforces[0], airstrikes[0])
  end
end

# reinforces = ["abcdefg", "hijklmn"];
# airstrikes = ["   *   ", "*  *   "];

# alphabetWar(reinforces, airstrikes)

# The battlefield  is     : "abcedfg".
# The first airstrike    : "   *   "
# After first airstrike  : "ab___fg"
# Reinforces are comming : "abjklfg"
# The second airstrike   : "*  *   "
# After second airstrike : "_____fg"
# Reinforces are coming  : "hi___fg"
# No more airstrikes => return "hi___fg"
