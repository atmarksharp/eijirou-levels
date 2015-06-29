#!/usr/bin/env ruby

EIJI_FILE = "EIJI-139.TXT"

def escape(s)
  s.split('"').join("")
end

def level_file(i)
  return "levels/level-#{i}.txt"
end

level_words = []

`mkdir -p levels`
(1..12).each do |i|
  level_words.push []
  `touch #{level_file(i)}`
end

count = 0
File.open(EIJI_FILE).each_with_index do |line,i|
  line.strip!

  if line.include? "【レベル】"
    m = (line.match(/^■([^:]+) :.*【レベル】([0-9]+)/))
    word = escape(m[1])
    level = Integer(m[2])

    # level_words[level-1].push(line)
    level_words[level-1].push("#{word}")
    count += 1
  end
end

(1..12).each do |i|
  file = level_file(i)
  words = level_words[i-1].sort!
  File.write(file, words.join("\n"))
end

puts "出力単語数: #{count}"
