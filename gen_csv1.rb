#!/usr/bin/env ruby

EIJI_FILE = "EIJI-139.TXT"

hit_flag = false
File.open(EIJI_FILE).each_with_index do |line,i|
  next if i < 4

  exit 1 if i == 100000

  line.strip!
  # p line
  m = line.match(/^■(.+)?:(.+)$/)
  if m and m != 0
    label = m[1].split('"').join('""')
    mean = m[2].split('"').join('""')
    puts "\"#{label}\",\"#{mean}\""
  else
    puts
    puts "ERROR: #{line}"
    exit 0
  end
end