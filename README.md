# Ruqqus

This is a Ruby API implementation for [Ruqqus](https://ruqqus.com/), an [open-source](https://github.com/ruqqus/ruqqus) platform for online communities, free of censorship and moderator abuse by design. 

The platform is still in Beta at this time, and the public API for it is still quite limited, but this gem will be actively updated as it continues to grow and is developed.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruqqus'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ruqqus

## Usage

At this time, there are only four publicly exposed functions to utilize for acquiring information on the following items:

* Users
* Guilds
* Posts
* Comments

The full documentation can be found here[](), but the API is rather intuitive. Here is some basic examples to give a taste of its basic usage.

### User

Obtain information about users.

```ruby
user = Ruqqus.user('foreverzer0')

# Get user's total rep (as well as separate for comments/posts)
user.total_rep
=> 22234

# Enumerate earned badges
user.badges.map(&:to_s)
=> ["Joined Ruqqus during open beta", "Verified Email", "Recruited 10 friends to join Ruqqus"]

# Retrieve a Time object for when user created account
user.created
=> 2020-06-16 21:59:04 -0400
```

### Guild

Obtain information about guilds.

```ruby
guild = Ruqqus.guild('Ruby')

# Query the number of members, description, accent color, etc.
guild.member_count
=> 43

# Links to guild's banner, profile, etc.
guild.banner_url
=> "https://i.ruqqus.com/board/ruby/banner-2.png"

# Check for flags, such as NSFW, NSFW, deletion, banned, "offensive", etc.
guild.nsfw?
=> false
```

### Post

Obtain information about posts. The API functions for querying comments from a post are not yet implemented on the backend, so you will have to settle for web-scraping with `mechanize`, `nokogiri`, etc. if that information is needed.

```ruby
post = Ruqqus.post('2e0x')
# ...or alternatively
post = Ruqqus::Post.from_url('https://ruqqus.com/post/2e0x/made-this-project-in-ruby-on')

# Obtain relevant information pertaining the guilds on Ruqqus
  
post.author_name
=> "Galadriel"

post.title
=> "Made this project in Ruby On Rails"

post.url
=> "https://ruqqus-metrics.com/"

post.score
=> 10
```

### Comment

Obtain information about comments. Comments are very similar to posts, but have a few unique methods for obtaining their nesting level, parent post/comment, etc.

```ruby
comment = Ruqqus.comment('67mt')
# ...or alternatively
comment = Ruqqus::Comment.from_url('https://ruqqus.com/post/1wbo/hi-im-josh-roehl-singer-and/67mt')

comment.author.ban_reason
=> "Spam"

comment.post.title
=> "Hi. I'm Josh Roehl, singer and songwriter of the hit song \"Endless Summer\". I am hosting an AMA here."
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ForeverZer0/ruqqus.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
