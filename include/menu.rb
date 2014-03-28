def menu (file, exit)
  print "\e[H\e[2J"
  print "Lyrics Sync V.1
----------------
  1) Sync lyrics to music time
  2) Play lyrics
  3) Quit
Enter an Option: "
  
  exit = $stdin.gets

  case exit.chomp.to_i
    when 1
      print "\e[H\e[2J"
      file.setTime
      print "\e[H\e[2J"
      puts "The new saved file labeled timed_#{file.getName} has been created!\n\n"
      file.close
    when 2
      print "\e[H\e[2J"
      file.lyrics
      file.close
      puts "\n\n"
    when 3
      puts "\n----------\nGoodbye!\n----------\n"
      file.close
    else
      puts "\n--------------------\n#{exit.chomp} is not a valid option!\n--------------------\n\n"
      menu(file, exit)
  end
end
