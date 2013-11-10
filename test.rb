require 'koala'

token = 'CAACEdEose0cBAKraDsGM8jyzZCyxR6jynD8QyqZCiLNGZBqirPFDQp0SZApqVDzJtlI07sBYpXfv80yQyjvPAgXx9iu9R9l9zU9OtfVXtRkBI1O49pZCQrXnxL3lraRT9GIA6ln3TDlvWwCCFHnIpmDZCeuU4jvPOTCOwLfyx6F9v1cMU5ZByBqJeTBfqGGZBv0ZD'

@graph = Koala::Facebook::API.new(token)

p feed = @graph.get_connections("me", "feed")
feed.each {|f| p f['message'] }

feed = feed.next_page
feed.each {|f| p f['message'] }