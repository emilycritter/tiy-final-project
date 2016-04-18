class Category < ActiveRecord::Base
  has_many :piece_categories, dependent: :destroy

  validates :name, inclusion: { in: %w(Art Ceramic Drawing/Sketch
    Mixed-media/Collage Painting Acrylic Oil Watercolor Pastel Photography
    Collectibles Glass Sculpture Prints Fiber/Textile Clothing Purse/Bag
    Jewelry Necklace Bracelet Earrings Rings Cuff-links Accessories),
  message: "%{value} is not a valid category" }

  validates :name, :uniqueness => {:case_sensitive => false}
end
