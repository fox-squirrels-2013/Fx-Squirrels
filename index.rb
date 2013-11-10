

This repository
Explore
Gist
Blog
Help
benediktgirz
27  Unwatch
Star 0 Fork 0PUBLIC fox-squirrels-2013 / Fx-Squirrels
 branch: koala  Fx-Squirrels / authentication.rb 
 benediktgirz 6 minutes ago changes to koala
1 contributor
 file 42 lines (34 sloc) 1.175 kb  Open EditRawBlameHistory Delete
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
Bundler.require(:default)

# register your app at facebook to get those infos
# your app id
APP_ID     = 465495653562684
# your app secret
APP_SECRET = 'a452120d11df6ee6b9dfe4b1c83540fa'

class SimpleRubyFacebookExample < Sinatra::Application

  use Rack::Session::Cookie, secret: 'PUT_A_GOOD_SECRET_IN_HERE'

  get '/' do
    if session['access_token']
      'You are logged in! <a href="/logout">Logout</a>'
     @graph = Koala::Facebook::GraphAPI.new(session["access_token"])
      
    else
      redirect '/login'
    end
  end

  get '/login' do
    # generate a new oauth object with your app data and your callback url
    session['oauth'] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, "#{request.base_url}/callback")
    # redirect to facebook to get your code
    redirect session['oauth'].url_for_oauth_code()
  end

  get '/logout' do
    session['oauth'] = nil
    session['access_token'] = nil
    redirect '/'
  end

  #method to handle the redirect from facebook back to you
  get '/callback' do
    #get the access token from facebook with your code
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect '/'
  end
end
 
Status API Training Shop Blog About © 2013 GitHub, Inc. Terms Privacy Security Contact
