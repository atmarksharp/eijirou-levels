#!/usr/bin/env ruby

EIJI_FILE = "EIJI-139.TXT"

def escape(s)
  s.split('"').join("")
end

File.open(EIJI_FILE).each_with_index do |line,i|
  if line.include? "【レベル】"
    m = (line.match(/^■([^:]+) :.*【レベル】([0-9]+)/))
    word = escape(m[1])
    level = m[2]
    puts "\"#{level}\",\"#{word}\""
    # puts line
  end
end

