class Category < ActiveRecord::Base
  has_many :piece_categories, dependent: :destroy

  validates :name, inclusion: { in: %w(Art Ceramic Drawing/Sketch
    Mixed-media/Collage Painting Acrylic Oil Watercolor Pastel Photography
    Collectible Glass Sculpture Print Fiber/Textile Clothing Purse/Bag
    Jewelry Necklace Bracelet Earring Ring Cuff-link Accessories),
  message: "%{value} is not a valid category" }

  validates :name, :uniqueness => {:case_sensitive => false}
end
