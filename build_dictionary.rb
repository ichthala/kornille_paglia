require 'marky_markov'

class DictionaryBuilder

  def build_dictionary
    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_file 'sexual_personae.txt'
    40.times { markov.parse_file 'korn_lyrics.txt' }
    20.times do
      puts markov.generate_n_sentences 1
      puts "\n"
    end
  end

end

DictionaryBuilder.new.build_dictionary
