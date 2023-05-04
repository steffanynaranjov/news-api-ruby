require 'httparty'
require 'json'
require 'redis'

class NewsController < ApplicationController

  def index
    n = params[:n] || 10
    news = fetch_news(n)
    render json: news
  end

  def show
    query = params[:query]
    news = fetch_news(100)
    news_article = news.find { |article| article['title'] == query || article['author'] == query }
    render json: news_article
  end

  def search
    query = params[:query]
    news = fetch_news(100)
    search_result = news.select { |article| article['title'].downcase.include?(query.downcase) || article['description'].downcase.include?(query.downcase) }
    render json: search_result
  end

  def fetch_news(n)
    redis = Redis.new
    news = redis.get("#{n}_news")
    if news.nil?
      response = HTTParty.get("https://gnews.io/api/v4/top-headlines?category=general&apikey=214ac039801359e23c9af0981e9d7dc3")
      news = JSON.parse(response.body)['articles']
      redis.setex("#{n}_news", 3600, news.to_json)
    else
      news = JSON.parse(news)
    end
    news
  end
end
