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

if Artwork.count == 0
  art = Artwork.new
  art.user_id = 1
  art.title = 'Landscape painting , 40" - Beautiful & Colorful Abstract Tree'
  art.price = 420.00
  art.inventory = 1
  art.description = 'ABOUT THIS PAINTING
Life, giving, power, and elegance. This tree prides itself with all of these. This is a tree which is founded on the Art Nouveau style, continuous and wavy on a returning basis. It combines an abundance of strong and beautiful colors from nature, which create a gentle, elegant mixture in one’s eyes. A black and elegant spraying passes over, which balances the colorfulness of the painting, creates opposition on the white canvas and adds an additional dimension of undefined randomness combined with lack of control and and natural flow.

DETAILS
* Name: Tree of happiness
* Painter: Koby Feldmos
* Size: 40" 40" (100 X 100 cm)
* Original handmade oil painting on canvas
* Style: Modern, Abstract
* Certification of Authenticity attached
* Express shipping 3-4 days worldwide
* 30 Days full money refund accepted '

  url = "https://img1.etsystatic.com/053/0/9019569/il_570xN.765493729_9dvg.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 1
  art.title = 'Painting 40" Pink Flower, Modern style, luxury looks, thick layers'
  art.price = 360.00
  art.inventory = 1
  art.description = 'ABOUT THIS PAINTING
A classic flower with five soothing pink petals shaped like a heart. Its center is like the flower’s nectar and its delicate stalk comes out of it in the twisting forms of Art Nouveau. It is the color of pastel pink and green with subtle touches of yellow and blue. A painting with a minimalist and subtle flow. Symbolizing romantic and classic beauty.

DETAILS
* Name: Pink Flower
* Painter: Koby Feldmos
* Size: 40" 30" (100 X 75 cm)
* Shipping "ready to hang" (stretched) in rigid box
* Original handmade oil painting on canvas
* Style: Modern, Abstract
* Certification of Authenticity attached
* Express shipping 3-4 days worldwide
* 30 Days full money refund accepted '

  url = "https://img1.etsystatic.com/106/0/9019569/il_570xN.881420891_41u5.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 2
  art.title = "Oil Painting Original Artwork Seascape Sailing Boat and Lighthouse at Dawn Vivid Color Painted with Palette Knife Textured"
  art.price = 135.00
  art.inventory = 1
  art.description = 'Heavy Texture Oil Painting
Size: 20x24 inches(50x60 cm)

Medium: Oil on gallery-wrapped stretched canvas. Palette Knife, Textured, ready to hang
The painting is signed on the front and 100% guaranteed, I want you happy with your purchase.
This artwork is new and in excellent condition. Directly from my studio.
The painting will be shipped and packed professionally. In order to protect your painting I will personally pack your painting with great care using high quality, shipping industry approved
packing materials.'

  url = "https://img0.etsystatic.com/057/0/7895875/il_570xN.683801464_o6lq.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 2
  art.title = "Canvas Art, Black and White Wall Art, Large Oil Painting"
  art.price = 250.00
  art.inventory = 1
  art.description = 'Abstract Painting, Canvas Art, Black and White Wall Art, Large Oil Painting, Abstract Art, Abstract Canvas Art, Oil Painting Abstract, Art
Heavy Texture Oil Painting
Size: 24x48 inches(60x120 cm)

Medium: Oil on gallery-wrapped stretched canvas. Palette Knife, Textured, staples on back, ready to hang
The painting is signed on the front and 100% guaranteed, I want you happy with your purchase.
This artwork is new and in excellent condition. Directly from my studio.'

  url = "https://img0.etsystatic.com/116/0/7895875/il_570xN.945003630_elp5.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 3
  art.title = 'Marilyn Monroe Art, 4"x24" Reclaimed Wood Art'
  art.price = 425.00
  art.inventory = 1
  art.description = 'This is a stunning art painting of Marilyn Monroe created by Sarasota artist Matt Pecson. This is an original oil painting on reclaimed wood board of the lovely Marilyn. The bright pastels work well on the wood canvas, with exposed wood showing as well. Display it in a shared living space to make a dramatic statement. It also works equally well in a man cave or she shed. Buy it for yourself or gift it to your favorite art connoisseur.'

  url = "https://img0.etsystatic.com/111/1/8802615/il_570xN.875685300_dcuu.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 3
  art.title = 'Pop Art Custom Dog Portrait Custom'
  art.price = 500.00
  art.inventory = 1
  art.description = 'This is a unique hand painted piece of custom art of your beloved family pet that commemorates them in a beautiful contemporary painting. This is a hand painted piece of custom art on a canvas size of your choosing and image of your choosing. A custom painting from a favorite photo of your pet would be such a special gift for your family or as a gift for another family. '

  url = "https://img1.etsystatic.com/043/0/8802615/il_570xN.638446957_t399.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 3
  art.title = 'CUSTOM Pop Art Painting Remix, Large Canvas Painting 48"x48" Urban Art Mashup Pop Art Fusion'
  art.price = 1800.00
  art.inventory = 1
  art.description = 'This is a very unique pop art painting, a style called "Pop Art Fusion" or "Mashup Pop Art". Matt Pecson is known for creating stunning paintings using a combination of somewhat unrelated pop images. His witty art encourages conversation and always gets attention. He can paint any of the same images above, or create custom pop art just for you, based on your tastes. Disney characters or princesses, music legends, movie icons or other pop culture elements can be put together in to a unique piece for your home. Imagine showing that off at your next dinner party!! An amazing original wall hanging for your home. Display it in the home, office or even a man cave.'

  url = "https://img0.etsystatic.com/076/1/8802615/il_570xN.809270238_22cs.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 4
  art.title = "Twelve Square Inches of Sunshine"
  art.price = 400.00
  art.inventory = 1
  art.description = "Sunflowers, purple statice, and white Peruvian lilies in a white porcelain pitcher sit by the window on a sunny day. It is a twelve square inches of sunshine to lift your spirit!
The painting size is 12\" x 12\". Signed on front; varnished. The painting is ready to hang.
Oil on stretched canvas. The gallery-wrapped (no staples around edges) canvas is 7/8\" deep and comes with a hanging wire already attached. The edges are painted in neutral gray."

  url = "https://img1.etsystatic.com/111/0/6251547/il_570xN.998547461_art7.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 4
  art.title = "Hot Red Rose"
  art.price = 120.00
  art.inventory = 1
  art.description = 'A red rose in the hot summer sun.
The painting size is 8" x 6". Signed on front; varnished. The painting requires framing for display.
Oil on oil-primed linen on birch panel. The painting is mounted on Baltic birch panel with archival glue.'

  url = "https://img1.etsystatic.com/101/1/6251547/il_570xN.837585313_iwqi.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 4
  art.title = "18\" x 24\", Custom Portrait from Your Photograph"
  art.price = 800.00
  art.inventory = 1
  art.description = "Of all the painting subjects under the sun, I find portraits and figures the most challenging and rewarding. In particular, I love painting children. Capture their youthful beauty and innocence before they grow up! I can also paint special moments from your wedding and vow renewal and other double portraits of young siblings, man and his dog, mother and child, grandparent and child, child and her pet, etc. The possibilities are endless! My beautiful portraits have brought joys of tears to my clients. They also make perfect presents for birthdays, anniversaries, and holidays."

  url = "https://img1.etsystatic.com/138/0/6251547/il_570xN.998548235_ghx1.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save

  art = Artwork.new
  art.user_id = 4
  art.title = "6\" x 8\", Custom Pet Portrait from Your Photograph"
  art.price = 135.00
  art.inventory = 1
  art.description = "I love painting cats and dogs. I seem to have a natural knack for capturing the spirit, not just the likeness, of your beloved pet. My beautiful pet portraits have brought joys of tears to their owners. They also make perfect presents.
All my pet portraits are done in oil. I use only the top-quality materials for conservation—professional-grade oil paints, oil-primed Belgian linen, then mounted on Baltic birch panel, masonite, or gatorboard (lightweight, archival board). All paintings require framing.
The current turnaround time is approximately 2 weeks to complete the painting. There is a 5-10% shipping/handling charge. I ship via USPS Priority Mail with tracking within the United States. Expedited shipping is available for an additional charge. I ship via USPS International First Class without tracking worldwide."

  url = "https://img0.etsystatic.com/049/1/6251547/il_570xN.693083528_md6i.jpg"
  open(url, "rb") do |file|
    art.photo = file
  end
  art.save
end
