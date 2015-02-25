require 'nokogiri'
require 'open-uri'
require 'pry'

class LyricsScraper

  def initialize(artist_name)
    artist_name = artist_name.downcase.gsub(/\s/, '_')
    begin
      puts "http://www.azlyrics.com/#{artist_name[0]}/#{artist_name}.html"
      doc = Nokogiri::HTML(open("http://www.azlyrics.com/#{artist_name[0]}/#{artist_name}.html"))
    rescue OpenURI::HTTPError => e
      puts 'Looks like that artist isn\'t on A-Z Lyrics.'
      exit(0)
    end

    f = File.new("#{artist_name}_lyrics.txt", "w+")

    doc.css('#listAlbum a[target=_blank]').each do |link|
      song_title = link.content.downcase.gsub(/\s/, '')
      puts "Getting song #{link.content}..."
      lyrics_doc = Nokogiri::HTML(open("http://www.azlyrics.com/#{artist_name}/#{song_title}.html"))
      lyrics_node = lyrics_doc.at("//comment()[contains(.,'start of lyrics')]")
      lyrics_node = lyrics_node.parent
      f.write "#{lyrics_node.content}\n"
    end

    f.close

  end

end

artist = ARGV[0] || 'Korn'
LyricsScraper.new(artist)

