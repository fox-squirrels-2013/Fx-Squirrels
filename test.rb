require 'fb_graph'

# AreyouagrumpyB*tch
# App ID:	465495653562684
# App Secret:	a452120d11df6ee6b9dfe4b1c83540fa

token = 'CAACEdEose0cBAKraDsGM8jyzZCyxR6jynD8QyqZCiLNGZBqirPFDQp0SZApqVDzJtlI07sBYpXfv80yQyjvPAgXx9iu9R9l9zU9OtfVXtRkBI1O49pZCQrXnxL3lraRT9GIA6ln3TDlvWwCCFHnIpmDZCeuU4jvPOTCOwLfyx6F9v1cMU5ZByBqJeTBfqGGZBv0ZD'

user = FbGraph::User.fetch('tylerguyolson', :access_token => token)
# p user.permissions

my_friend = user.friends.first

id = my_friend.identifier
token = my_friend.access_token

user = FbGraph::User.fetch(id, :access_token => token)


p user.name
# # p user.likes
p user.permissions

# p user.posts.first
