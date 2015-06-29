#!/usr/bin/env ruby

require 'open3'

EIJI_FILE = "EIJI-139.TXT"

def sh(command)
  # puts command
  ret = Open3.capture3(command)
  return ret[0]
end

puts (sh "cat #{EIJI_FILE} | grep \"【レベル】\"")

