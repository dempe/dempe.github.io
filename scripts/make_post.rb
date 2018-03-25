require 'date'

title = ARGV[0]
if title.nil? then abort("must provide title") end
filename = "_posts/#{DateTime.now.strftime "%Y-%m-%d"}-#{title.gsub(/[,]/, '').gsub(/[\s]/, '-')}.md"

File.open(filename, 'a') do |f|
  f.puts("---")
  f.puts("layout: post")
  f.puts("title: #{title.split.map(&:capitalize).join(' ')}")
  f.puts("date: #{DateTime.now.strftime "%Y-%m-%d %H:%M:%S"}")
  f.puts("tags:")
  f.puts("excerpt: none)
  f.puts("---")
end
