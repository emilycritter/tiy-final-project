require 'open-uri'

if User.count == 0
  user = User.new
  user.first_name = "Koby"
  user.last_name = "Feldmos"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = true
  user.phone_number = "8175551234"
  user.bio = "Koby Feldmos, 32 years old (born May 3rd, 1983), Israeli painter born in Tel Aviv. Koby studied at the Art School in Tel Aviv, descendant of a family of jewelers, he specialized in gold and diamonds and designing jewelry in the family business. In recent years, Feldmos abandoned jewelry design in favor of painting. Painting is something he dealt with in the past, and today dedicates himself fully to the craft of painting, as well as developing a style that distinguishes him on the national stage as well as on the international stage in the 21st century.
  The artist’s picturesque style is inspired by the French movement which developed in Post Impressionism in the 19th century, Pointillism. This technique is expressed in paintings which are made up of points. "

  url = "https://img1.etsystatic.com/074/0/9019569/isla_500x500.16256715_2yma5zu5.jpg"
  open(url, "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.first_name = "George"
  user.last_name = "Miller"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = true
  user.phone_number = "8175551234"
  user.bio = "I am a painter living and working in Asia. I paint abstract and landscape oil paintings. Sometimes I paint dogs, horses, cats.
  I learned oil painting skills when I studied in high school."

  url = "https://img0.etsystatic.com/069/0/7895875/isla_500x500.16074800_hwh5zubh.jpg"
  open(url, "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.first_name = "Matt"
  user.last_name = "Pecson"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = true
  user.phone_number = "8175551234"
  user.bio = "I create modern art, in a style that's all my own. Impressionism, Expressionism, Abstract Art, Pop Art and more are synthesized into true Post Modern Art.
  Each one of my paintings is original and hand painted. I usually paint on canvas, but I particularly enjoy painting on reclaimed items, like vinyl records, wood pallets or doors. I also paint custom portraits or other personalized paintings.
  Much of my art celebrates the work of other American artists. Jimi Hendrix, The Grateful Dead, Janis Joplin, Johnny Cash and Elvis just to name a few. These Americans are my heroes. "

  url = "https://img1.etsystatic.com/064/0/39775370/iusa_400x400.32504711_aw6k.jpg"
  open(url, "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.first_name = "Kim"
  user.last_name = "Stenberg"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = true
  user.phone_number = "8175551234"
  user.bio = "Hi, my name is Kim Stenberg. I used to be a college history professor for 20 years. After I turned 50, I somehow felt brave enough to quit my job to fulfill my dream of becoming a full-time painter!
  Although I opened the account in 2011, I started listing on Etsy in 2013. I hope you enjoy my art!
  I love to paint cats and dogs. If you send your pet's photos to kimstenbergart [!at] gmail.com, I will make beautiful pet portraits out of them. My pet portraits make perfect presents. "

  url = "https://img1.etsystatic.com/105/1/6251547/il_570xN.914238169_igev.jpg"
  open(url, "rb") do |file|
    user.photo = file
  end
  user.save

  user = User.new
  user.first_name = "Bob"
  user.last_name = "Paulson"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = false
  user.phone_number = "8175551234"
  user.save

  user = User.new
  user.first_name = "Emily"
  user.last_name = "Ritter"
  user.email = "#{user.first_name}@example.com"
  user.password = "12345678"
  user.artist_boolean = false
  user.phone_number = "8175551234"
  user.save
end
