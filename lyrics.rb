#!/usr/bin/env ruby

# Dependencies
require './include/lyricClass.rb'
require './include/menu.rb'

# Variables
SLEEP_TIME = 0.08


mp3 = (ARGV[0]) ? ARGV[0] : ""
txtFile = (ARGV[1]) ? ARGV[1] : (name = mp3.chop.chop.chop + "txt")

if mp3 == ""
  puts "Usage: #{__FILE__} audiofile [/path/to/lyrics]"
else
  file = LyricScroll.new(mp3, txtFile)
  if file.exists
    menu(file, 1)
  end
end
