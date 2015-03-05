# kornille_paglia
A Twitterbot Markov mashup of Korn lyrics and the text of Sexual Personae.

## How to Use
First, scrape lyrics. This will actually scrape whatever artist you want from azlyrics.com, but if you don't give a specific argument, it defaults to Korn.

- `ruby lyrics_scraper.rb` --> Korn lyrics
- `ruby lyrics_scraper.rb Yes` --> Yes lyrics

Requests to azlyrics are heavily throttled since they're very block-happy. Expect scraping to take a while.

Next, build the dictionary and output some sentences.

`ruby build_dictionary.rb`

Korn and Camille Paglia don't work as well together as I'd hoped. The language of the two sources is too dissimilar to produce very much mixed output.
