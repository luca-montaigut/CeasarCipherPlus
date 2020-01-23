require 'dotenv'
Dotenv.load('.env')
puts "
   ___  ____  ___   __   ___  ____       ___ __ ____  __  __  ____ ____      
  //   ||    // \\\\ (( \\ // \\\\ || \\\\     //   || || \\\\ ||  || ||    || \\\\     ||   
 ((    ||==  ||=||  \\\\  ||=|| ||_//    ((    || ||_// ||==|| ||==  ||_//   ==||== 
  \\\\__ ||___ || || \\_)) || || || \\\\     \\\\__ || ||    ||  || ||___ || \\\\     ||
  
  "

def caesar_letter(str, num)
  ascii_str = str.ord
  if (65..90).include? ascii_str
    ascii_str + num % 26 > 90 ? ascii_str += num % 26 - 26 : ascii_str += num % 26
  elsif (97..122).include? ascii_str
    ascii_str + num % 26 > 122 ? ascii_str += num % 26 - 26 : ascii_str += num % 26
  end
  ascii_str.chr
end

def hardcore_crypto(str)
  i = 0
  f_str = []
  str.chars.each do |s|
    f_str << caesar_letter(s, (ENV["key1"].to_i * i + str.length * ENV["key2"].to_i))
    i+= 3
  end
  f_str.join
end

def hardcore_decrypt(str)
  i = 0
  f_str = []
  str.chars.each do |s|
    f_str << caesar_letter(s, 26 - (ENV["key1"].to_i * i + str.length * ENV["key2"].to_i ) % 26)
    i+= 3
  end
  f_str.join
end

def easter_egg
puts "\n\n  |--------------------------------------------------------------------------|"
    puts "  | \"...zZzzz..zZzz...zZz...Hein?! Ce cipher ? Ouais je sais qui l'a fait !  |"
    puts "  |  Tu peux remercier DevPomeis pour son algorithme et ton serviteur        |"
    puts "  |  LazyRabbit pour l'interface. Maintenant va essayer l'appli !\"           |"
    puts "  |--------------------------------------------------------------------------|"
    puts "                                                |"
    puts "                                                |"
    puts "                                                |________________   _/)/)"
    puts "                                                                   (-.- )"
    puts "                                                                 (\")(\")_o"
    puts "\n"
    print "\n    Pressez la touche \"Entrer\" pour revenir au menu "
    gets.chomp
    choice = 0
end

def menu
  puts "\n     ***********************************************************************"
  puts "     |   Que souhaitez-vous faire ?                                        |"
  puts "     |   1. Chiffrer un message à envoyer                                  |"
  puts "     |   2. Déchiffrer un message reçu                                     |"
  puts "     |   3. QUITTER                                                        |"
  puts "     ***********************************************************************\n"
  print "\n    Entrez la commande de votre choix : "
  choice = gets.chomp.to_i
end

def perform
  puts "     %$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(\n\n"
  puts "                       Bienvenue sur Ceasar Cipher +"
  puts "\n     %$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(\n\n"
  puts "\n      Grâce à cette appli vous allez pouvoir échanger des messages chiffrés" 
  puts "              aux amis qui partagent vos clefs de déchiffrage. "
  puts "\n           Même la CIA ne pourra pas espionner vos conversations !\n\n"
  choice = 0
  while choice != 3
    choice = menu  
    case choice
    when 0
      easter_egg
    when 1
      puts "\n    Écrivez le message à chiffrer"
      print "   > "
      str = gets.chomp
      puts "\n    Chiffrage en cours, veuillez patienter :"
      print "   > "
      hardcore_crypto(str).split('').each do |l|
        print l
        sleep(0.1)
      end      
      print "\n\n   Votre message a bien été chiffré. \n   Copiez-le pour l'envoyer puis pressez la touche \"Entrer\" pour revenir au menu "
      gets.chomp
    when 2
      puts "\n    Écrivez le message à déchiffrer"
      print "   > "
      str = gets.chomp
      puts "\n    Déchiffrage en cours, veuillez patienter :"
      print "   > "
      hardcore_decrypt(str).split('').each do |l|
        print l
        sleep(0.1)
      end
      print "\n\n    Pressez la touche \"Entrer\" pour revenir au menu "
      gets.chomp
    when 3
      puts "\n     %$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(\n"
      puts "\n           Au revoir, ou comme on dit chez nous : #{hardcore_crypto("Au revoir")}"
      puts "\n     %$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(@%$£€~/&(\n\n"
      break
    else
      print "\n   Je n'ai pas compris votre demande...Pressez la touche \"Entrer\" pour revenir au menu "
      gets.chomp
    end
  end
end

perform

#  (\(\_
#  ( -.-)       "See you in the next hole!"
#  o_(")(")                          - LazyRabbit & DevPomeis