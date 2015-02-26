require 'nokogiri'
require 'open-uri'
require 'marky_markov'

class LyricsScraper

  def initialize(artist_name)
    # artist_name = artist_name.downcase.gsub(/\s/, '_')
    # begin
    #   puts "http://www.azlyrics.com/#{artist_name[0]}/#{artist_name}.html"
    #   doc = Nokogiri::HTML(open("http://www.azlyrics.com/#{artist_name[0]}/#{artist_name}.html"))
    # rescue OpenURI::HTTPError => e
    #   puts "Looks like that artist isn't on A-Z Lyrics."
    #   exit(0)
    # end

    # @filename = "#{artist_name}_lyrics.txt"
    # f = File.new(@filename, "w+")

    # doc.css('#listAlbum a[target=_blank]').each do |link|
    #   song_title = link.content.downcase.gsub(/\W/, '')
    #   puts "Getting song #{link.content}..."
    #   begin
    #     lyrics_doc = Nokogiri::HTML(open("http://www.azlyrics.com/lyrics/#{artist_name}/#{song_title}.html"))
    #     lyrics_node = lyrics_doc.at("//comment()[contains(.,'start of lyrics')]")
    #     lyrics_node = lyrics_node.parent
    #     f.write "#{lyrics_node.content}\n"
    #   rescue
    #     puts "Something went wrong with the song #{link.content}. Skipping that one..."
    #   end
    #   # try to avoid getting blocked
    #   sleep(1)
    # end

    # f.close

    build_dictionary
  end

  def build_dictionary
    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_file 'sexual_personae.txt'
    markov.parse_file 'korn_lyrics.txt'
    markov.parse_file 'korn_lyrics.txt'
    markov.parse_file 'korn_lyrics.txt'
    markov.parse_file 'korn_lyrics.txt'
    markov.parse_file 'korn_lyrics.txt'
    puts markov.generate_n_sentences 5
    puts markov.generate_n_words 200
    markov.clear! # Clear the temporary dictionary.
  end

end

artist = ARGV[0] || 'Korn'
LyricsScraper.new(artist)

