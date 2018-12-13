module Hangman
  module Dictionary

    WORDS = ""

    WORDS = File.readlines("words.txt").each do |line|

      line.strip!
      line.length >= 5

    end

    def self.random
      WORDS.sample
    end
  end
end
