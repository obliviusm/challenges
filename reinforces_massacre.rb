# http://www.codewars.com/kata/alphabet-wars-reinforces-massacre

module ReinforcesMassacre
  def self.get_kill_zone(airstrike)
    kill_zone = ' ' * airstrike.size
    airstrike.split('').each_with_index do |place, index|
      next unless place == '*'

      kill_zone[index - 1] = '_' if index - 1 >= 0
      kill_zone[index + 1] = '_' if index + 1 < kill_zone.size
      kill_zone[index] = '_'
    end
    kill_zone
  end

  def self.do_airstrike(battlefield, airstrike)
    kill_zone = self.get_kill_zone(airstrike)
    new_battlefield = '' * airstrike.size
    battlefield.split('').each_with_index do |place, index|
      new_battlefield[index] = kill_zone[index] == '_' ? '_' : place
    end
    new_battlefield
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
