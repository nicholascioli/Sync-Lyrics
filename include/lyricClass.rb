# Class to handle the shtuff
class LyricScroll
  @filename = ""
  @file = ""
  @mp3 = ""
  @t = ""
  @pid = ""
  
  # Returns name
  def getName
    return @filename
  end
  
  # Checks if files exist
  def exists
    if @file && @mp3
       return true
    else
       return false
    end
  end
  
  # Gets the lyrics and mp3 file to be used
  def initialize (mp3File, nameFile)
    if File.exists?(mp3File)
      @mp3 = mp3File
    else
      puts "File #{mp3File} does not exist!"
    end
    
    if File.exists?(nameFile)
      if File.readable?(nameFile)
        @file = File.open(nameFile)
        @filename = nameFile
      else 
        puts "File is not readable! Are the permissions correct? :("
      end
    
    else
      puts "File #{nameFile} does not exist!"
    end
  end
  
  # Prints a line given to it character by character
  def charPrint (line)
    if line
      if line.chomp.to_f > 0.0
        sleep(line.chomp.to_f)
      else
        line.each_char {|char| 
          print char 
          sleep(SLEEP_TIME)}
      end
    end
  end
  
  # Gets the time duration between lines
  def getTime (line, nFile)
    startT = Time.new
    
    $stdin.gets

    endT = Time.now
    endT = endT - startT
    line += "#{endT}\n"
    nFile.puts(line)
  end
  
  # Writes time durations to new file
  def setTime
    if self.exists && File.writable?(".")
      nFile = File.new("timed_#{@filename}", "w+")
      
      self.play
      
      puts "Press enter every time the next lyric should show up!\n"
      
      @file.each {
      |line|
      charPrint(line)
      getTime(line, nFile)
      }

      nFile.close
      @file.rewind
    end
  end
  
  # Prints the lyrics using the charPrint function
  def lyrics
    if @file && @mp3
      self.play
      
      @file.each {|line| charPrint(line)}
    end
  end
  
  def play
    @t = Thread.new {
          @pid = fork{ exec 'mplayer', '-really-quiet', @mp3 }
          }
    @t.join
    
    sleep 0.1
    puts "\e[H\e[2J"
  end
  
  # Closes text file
  def close
    if @file
      if !(@file.closed?)
        @file.close
      end
    end
    
    if @t
      Process.kill 9, @pid
      Process.wait @pid
      @t.kill
    end
  end
end
