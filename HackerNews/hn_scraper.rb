require 'open-uri'
# require 'restclient'
require 'nokogiri'
require 'pry'

class Post
    attr_reader :title, :url, :points, :item_id, :comments

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def print_all_comments
    @comments.each {|x|
      pp [@comments.index(x)+1,x.text]
    }
  end

  def add_comment(comment)
    @comments << comment #@comments is a Message Object
  end
end


class Comment
  # belongs_to :post
  attr_reader :text
  def initialize(text)
    @text = text
  end

end

# https://news.ycombinator.com/item?id=7663775
PAGE_URL = "#{ARGV[0]}"
page = Nokogiri::HTML(open(PAGE_URL))
title = page.css("a.storylink").text
url = page.css("a.storylink")[0]["href"]
points = page.css("span#score_7663775").text
id = page.css("span.age a")[0]["href"][8..-1]
post = Post.new(title,url,points,id)

page.css("span.comment").each {|comment|
  c = Comment.new(comment.text.strip)
  post.add_comment(c)
}

puts "Post Title: #{title}"
puts "Number of comments: #{post.comments.length}"
# post.print_all_comments
