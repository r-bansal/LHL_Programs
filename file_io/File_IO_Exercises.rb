# require "open-uri"
#
#
# remote_full_url = "https://en.wikipedia.org/wiki/Ada_Lovelace"
# remote_data = open(remote_full_url).read
# my_local_file = open("my-downloaded-page.html","w")
#
# my_local_file.write(remote_data)
# my_local_file.close
#
# File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}
#

# Exercise #1
# require "open-uri"
#
# wiki_url = "https://en.wikipedia.org/wiki/Main_Page"
# remote_data = open(wiki_url).read
#
# File.open("wiki-page.html","w"){ |x| x.write(remote_data)}


# file = File.open("sample.txt", "r")
# contents = file.read
# puts contents
#
# contents = File.open("sample.txt", "r"){ |file| file.read }
# puts contents
#
# file = File.open("sample.txt", 'r')
# while !file.eof?
#    line = file.readline
#    puts line
# end

#Exercise 2
# require 'open-uri'
# url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
# File.open("hamlet.txt","w"){|x| x.write(open(url).read)}
#
# File.open("hamlet.txt","r") do |file|
#   file.readlines.each_with_index do |line,idx|
#     puts line if idx % 42 == 41
#   end
# end

#Exercise 3
puts Dir.pwd
puts Dir.chdir ".."
puts Dir.pwd
Dir.glob("*").sort_by{|x| File.size(x)}.reverse[0..9].each do |y|
  puts "#{y} \t #{File.size(y)}"
end

#Exercise 4
DIRNAME = "data-hold"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)
   hsh
end
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end

# require 'rubygems'
# require 'rest-client'
#
# wiki_url = "https://en.wikipedia.org/wiki/Main_Page"
# wiki_local_filename = "wiki-page.html"
#
# File.open(wiki_local_filename, "w") do |file|
#    file.write(RestClient.get(wiki_url))
# end
