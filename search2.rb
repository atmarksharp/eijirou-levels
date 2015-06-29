#!/usr/bin/env ruby

EIJI_FILE = "EIJI-139.TXT"

exit 1 if ARGV.size < 1

word = ARGV[0]

hit_flag = false
File.open(EIJI_FILE).each do |line|
  line.strip!
  if line =~ /^■#{word}[^:a-zA-Z]+:/
    hit_flag = true
    puts line
  elsif hit_flag
    exit 0
  end
end