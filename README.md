<strong>Sync Lyrics</strong>

<p>This simple Ruby script will sync up lyrics taken from a supplied MP3 file (<strong>.mp3</strong>) and a supplied lyrics text file (<strong>.txt</strong>). After using the script to sync the lyrics, the script generates a file in the current directory called <em>timed_MP3FILENAME.txt</em> with the correct timings</p>

&emsp;<code>./lyrics.rb mp3file [/path/to/lyrics]</code>

<p>Note that the path to the lyrics file is optional. The code automagically assumes that the lyrics file is simply named the same as the mp3 file if not supplied with a path to it.</p>
