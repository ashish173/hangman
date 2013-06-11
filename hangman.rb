					# Welcome to Hangman Game __author__ : ashish singh(c0mrade)
def hangman(num)
  print "\n\t--------"
  case num
  when 0
        puts "\n\t   | "
  when 1
        puts "\n\t   |\n\t   O "
  when 2
        puts "\n\t   |\n\t   O\n\t  /"
  when 3
        puts "\n\t   |\n\t   O\n\t  /|"
  when 4
        puts "\n\t   |\n\t   O\n\t  /|\\ "
  when 5
        puts "\n\t   |\n\t   O\n\t  /|\\ \n\t  / "
  when 6
        puts "\n\t   |\n\t   O\n\t  /|\\ \n\t  / \\  "
 end
end
choice="yes"
while choice!="no"
	num=0
	word = File.open('words').readlines().sample.chomp.split("")    #readline reads all the lines, sample generates random out of all lines, chomp for "\n" 
	#word = word.split
	indexes=[]                     # stores the matched indexees
	life=6                         # number of chances player has
	count =0
	userWord = "_"*word.length     # String on which user tries to guess the real word   
	unhit = []
	while life!=0  
  		print "\n\n\t\t\t\tEnter letter: "
  		userInput=gets.chomp # validate the userinput string
  		count = word.count(userInput)  # find the number of occurences
    		if count == 0 # working fine
      			puts "\t\t\t\twrong guess try another word..."
      			life -= 1
      			unhit << userInput
      			print "\t\t\t\tyour Guess: #{ userWord} \n\t\t\t\tyou have tried #{unhit} \n\n\t\t\t\t\t #{hangman(6-life)}"
    		else    # do it
      		#find the indexes of occurances
			word.each_with_index do |value, index|
	     			if value == userInput then userWord[index]=userInput end
			end
			if userWord.index("_")==nil # checking for win
	  			puts userWord	
	  			puts "you are master of hangman!!!"
	 			break
			end
			print "\t\t\t\tyour Guess: #{userWord} \n\t\t\t\tYou Guessed a right letter! \n\t\t\t\tyou have tried #{unhit} \n\n\t\t\t #{hangman(6-life)}"
			indexes = []  # stores the matched indexes of letters
    		end # end of else
	end # end of while
	puts "'Game Over'"
	print "Want to play another game(Yes/no): "
	choice = gets.chomp
end

