module Hangman
  Signal.trap("INT") { Graphics.clear_screen ;puts "Goodbye, cruel world!"; exit}
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess, :wrong_guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @word = Dictionary.random
      @wrong_guess = ""
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.chomp
        Graphics.clear_screen

        if char.empty?
          puts "You need to enter a letter!"
          puts "Try again: "+ Graphics.obfuscate_word(word, guess)

        elsif char.match (/\W/)
          puts "You entered '#{char}'. You need to enter a letter!"
          puts "Try again: "+ Graphics.obfuscate_word(word, guess)

        elsif char.match (/\d/)
          puts "You entered '#{char}'. You need to enter a letter!"
          puts "Try again: "+ Graphics.obfuscate_word(word, guess)

        elsif word.include? char
          if guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
          else
            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder
          end

          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            Graphics.clear_screen
            puts Graphics::ALIVE_R
            Time.new
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE_L
            Time.new
            sleep 0.5
            Time.new
            Graphics.clear_screen
            puts Graphics::ALIVE_C
            Time.new
            sleep 0.5
            Graphics.clear_screen
            puts Graphics::ALIVE_R
            Time.new
            sleep 0.5
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end

        else

          if wrong_guess.include? char
            puts "You already entered '#{char}'. Yes, it is still not correct.. 🙄"
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)

          else
            puts "OH NOES! The word doesn't contain '#{char}'"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
            wrong_guess << char
            @wrong_tries +=1
          end


          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          # else
          #   puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end
