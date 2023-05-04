# Api News project Ruby on Rails

This is a simple API project to fetch an external API for [gnews](https://gnews.io/).

## Ruby version
ruby 2.7.3

## System dependencies
Remember to run bundle install to install all the gem
For this project I use Httparty, redis, and json gem.

To start the server you should use: rails server

### To use redis you will need to install it

[Macbook](https://redis.io/docs/getting-started/installation/install-redis-on-mac-os/)

[Windows](https://redis.io/docs/getting-started/installation/install-redis-on-windows/)

To run redis you should use: redis-server

## Services

The API have this methods: fetching N news articles, finding a news article with a specific title or author, and searching by keywords.

## Try the API

To test the API after do the installation you can use this link:
http://localhost:3000/news
http://localhost:3000/news/show

